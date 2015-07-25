##Getting the data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

##1.Reading data from the targeted files
##2.Reading data from the files into the variables

dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

##Creatas ones data set by merging the training and the test sets

##1.Concatenate the data tables by rows
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

##2.Variable names are set
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

##3.Get the data frame Data for all data by merging columns
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

##Extracts only the measurements on the mean and standard deviation for each measurement
##Subset Name of Features by measurements on the mean and standard deviation

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

##using selected names of Features to Subset the data frame Data 
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)


##Name the activities in the data set by Using descriptive activity names
##Read descriptive activity names from 'activity_labels.txt'
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
##Use descriptive activity names to factorize Variable activity in the data frame Data 
Data$activity <- as.character(Data$activity)
Data$activity[Data$activity == 1] <- "Walking"
Data$activity[Data$activity == 2] <- "Walking Upstairs"
Data$activity[Data$activity == 3] <- "Walking Downstairs"
Data$activity[Data$activity == 4] <- "Sitting"
Data$activity[Data$activity == 5] <- "Standing"
Data$activity[Data$activity == 6] <- "Laying"
Data$activity <- as.factor(Data$activity)
head(Data$activity,30)

##Labels the data set appropriately with descriptive variable names
##Label Names of Features using descriptive variable names.
##Replace prefix t is by time
##Replace Acc by Accelerometer
##Replace Gyro by Gyroscope
##Replace prefix f by frequency
##Replace Mag by Magnitude
##Replace BodyBody by Body
##Calculates mean and SD are for each subject for each activity for each mean and SD measurements. 
##Units given are g's for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.
names(Data)<-gsub("std\\(\\)", "StandardDeviation", names(Data))
names(Data)<-gsub("mean\\(\\)", "Mean", names(Data))
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

##Creates independent tidy data set and output to a file
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
