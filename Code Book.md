#Code Book
This code book that describes the variables used, data, and any transformations task that was performed to clean up the data and produce tidy data.

#Raw data collection
Raw data were obtained from the UCI Machine Learning repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 



#Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


#Input Variable Information:

For each record in the dataset the following is provided:
.Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
.Triaxial Angular velocity from the gyroscope.
.A 561-feature vector with time and frequency domain variables.
.The activity label.
.An identifier of the subject who carried out the experiment. 

Please refer to Readme file into 'UCI HAR Dataset' for more information.


#Raw Data transformation

The raw data sets are processed with the script run_analysis.R script to create a tidy data set.
Merge training and test sets Test and training data, subject ids and activity ids are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors.
Extract mean and standard deviation variables Keep only the values of estimated mean and standard deviation .
Get descriptive activity names A new column is added to intermediate data set with the activity description.
Label variables appropriately from the original collectors were changed to get valid/more descriptive activity names 
Create a tidy data set From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.

#Output Variables

The following table shows a table with all variables in the output file. The first column in the table shows the column number of the variable, the second column shows the variable name and column three shows the source variable used to compute the value of the variable.

| No     |                         Variable                        |        source variable        |
| ------ | :------------------------------------------------------ | :---------------------------- |
|      1 | subjectid                                               | subject id from subjects file |
|      2 | activityname                                            | activity id from labels file  |
|      3 | timeBodyAccelerationMeanX                               | tBodyAcc-mean()-X             |
|      4 | timeBodyAccelerationMeanY                               | tBodyAcc-mean()-Y             |
|      5 | timeBodyAccelerationMeanZ                               | tBodyAcc-mean()-Z             |
|      6 | timeBodyAccelerationStandarddeviationX                  | tBodyAcc-std()-X              |
|      7 | timeBodyAccelerationStandarddeviationY                  | tBodyAcc-std()-Y              |
|      8 | timeBodyAccelerationStandarddeviationZ                  | tBodyAcc-std()-Z              |
|      9 | timeGravityAccelerationMeanX                            | tGravityAcc-mean()-X          |
|     10 | timeGravityAccelerationMeanY                            | tGravityAcc-mean()-Y          |
|     11 | timeGravityAccelerationMeanZ                            | tGravityAcc-mean()-Z          |
|     12 | timeGravityAccelerationStandarddeviationX               | tGravityAcc-std()-X           |
|     13 | timeGravityAccelerationStandarddeviationY               | tGravityAcc-std()-Y           |
|     14 | timeGravityAccelerationStandarddeviationZ               | tGravityAcc-std()-Z           |
|     15 | timeBodyAccelerationJerkMeanX                           | tBodyAccJerk-mean()-X         |
|     16 | timeBodyAccelerationJerkMeanY                           | tBodyAccJerk-mean()-Y         |
|     17 | timeBodyAccelerationJerkMeanZ                           | tBodyAccJerk-mean()-Z         |
|     18 | timeBodyAccelerationJerkStandarddeviationX              | tBodyAccJerk-std()-X          |
|     19 | timeBodyAccelerationJerkStandarddeviationY              | tBodyAccJerk-std()-Y          |
|     20 | timeBodyAccelerationJerkStandarddeviationZ              | tBodyAccJerk-std()-Z          |
|     21 | timeBodyGyroscopeMeanX                                  | tBodyGyro-mean()-X            |
|     22 | timeBodyGyroscopeMeanY                                  | tBodyGyro-mean()-Y            |
|     23 | timeBodyGyroscopeMeanZ                                  | tBodyGyro-mean()-Z            |
|     24 | timeBodyGyroscopeStandarddeviationX                     | tBodyGyro-std()-X             |
|     25 | timeBodyGyroscopeStandarddeviationY                     | tBodyGyro-std()-Y             |
|     26 | timeBodyGyroscopeStandarddeviationZ                     | tBodyGyro-std()-Z             |
|     27 | timeBodyGyroscopeJerkMeanX                              | tBodyGyroJerk-mean()-X        |
|     28 | timeBodyGyroscopeJerkMeanY                              | tBodyGyroJerk-mean()-Y        |
|     29 | timeBodyGyroscopeJerkMeanZ                              | tBodyGyroJerk-mean()-Z        |
|     30 | timeBodyGyroscopeJerkStandarddeviationX                 | tBodyGyroJerk-std()-X         |
|     31 | timeBodyGyroscopeJerkStandarddeviationY                 | tBodyGyroJerk-std()-Y         |
|     32 | timeBodyGyroscopeJerkStandarddeviationZ                 | tBodyGyroJerk-std()-Z         |
|     33 | timeBodyAccelerationMagnitudeMean                       | tBodyAccMag-mean()            |
|     34 | timeBodyAccelerationMagnitudeStandarddeviation          | tBodyAccMag-std()             |
|     35 | timeGravityAccelerationMagnitudeMean                    | tGravityAccMag-mean()         |
|     36 | timeGravityAccelerationMagnitudeStandarddeviation       | tGravityAccMag-std()          |
|     37 | timeBodyAccelerationJerkMagnitudeMean                   | tBodyAccJerkMag-mean()        |
|     38 | timeBodyAccelerationJerkMagnitudeStandarddeviation      | tBodyAccJerkMag-std()         |
|     39 | timeBodyGyroscopeMagnitudeMean                          | tBodyGyroMag-mean()           |
|     40 | timeBodyGyroscopeMagnitudeStandarddeviation             | tBodyGyroMag-std()            |
|     41 | timeBodyGyroscopeJerkMagnitudeMean                      | tBodyGyroJerkMag-mean()       |
|     42 | timeBodyGyroscopeJerkMagnitudeStandarddeviation         | tBodyGyroJerkMag-std()        |
|     43 | frequencyBodyAccelerationMeanX                          | fBodyAcc-mean()-X             |
|     44 | frequencyBodyAccelerationMeanY                          | fBodyAcc-mean()-Y             |
|     45 | frequencyBodyAccelerationMeanZ                          | fBodyAcc-mean()-Z             |
|     46 | frequencyBodyAccelerationStandarddeviationX             | fBodyAcc-std()-X              |
|     47 | frequencyBodyAccelerationStandarddeviationY             | fBodyAcc-std()-Y              |
|     48 | frequencyBodyAccelerationStandarddeviationZ             | fBodyAcc-std()-Z              |
|     49 | frequencyBodyAccelerationJerkMeanX                      | fBodyAccJerk-mean()-X         |
|     50 | frequencyBodyAccelerationJerkMeanY                      | fBodyAccJerk-mean()-Y         |
|     51 | frequencyBodyAccelerationJerkMeanZ                      | fBodyAccJerk-mean()-Z         |
|     52 | frequencyBodyAccelerationJerkStandarddeviationX         | fBodyAccJerk-std()-X          |
|     53 | frequencyBodyAccelerationJerkStandarddeviationY         | fBodyAccJerk-std()-Y          |
|     54 | frequencyBodyAccelerationJerkStandarddeviationZ         | fBodyAccJerk-std()-Z          |
|     55 | frequencyBodyGyroscopeMeanX                             | fBodyGyro-mean()-X            |
|     56 | frequencyBodyGyroscopeMeanY                             | fBodyGyro-mean()-Y            |
|     57 | frequencyBodyGyroscopeMeanZ                             | fBodyGyro-mean()-Z            |
|     58 | frequencyBodyGyroscopeStandarddeviationX                | fBodyGyro-std()-X             |
|     59 | frequencyBodyGyroscopeStandarddeviationY                | fBodyGyro-std()-Y             |
|     60 | frequencyBodyGyroscopeStandarddeviationZ                | fBodyGyro-std()-Z             |
|     61 | frequencyBodyAccelerationMagnitudeMean                  | fBodyAccMag-mean()            |
|     62 | frequencyBodyAccelerationMagnitudeStandarddeviation     | fBodyAccMag-std()             |
|     63 | frequencyBodyAccelerationJerkMagnitudeMean              | fBodyBodyAccJerkMag-mean()    |
|     64 | frequencyBodyAccelerationJerkMagnitudeStandarddeviation | fBodyBodyAccJerkMag-std()     |
|     65 | frequencyBodyGyroscopeMagnitudeMean                     | fBodyBodyGyroMag-mean()       |
|     66 | frequencyBodyGyroscopeMagnitudeStandarddeviation        | fBodyBodyGyroMag-std()        |
|     67 | frequencyBodyGyroscopeJerkMagnitudeMean                 | fBodyBodyGyroJerkMag-mean()   |
|     68 | frequencyBodyGyroscopeJerkMagnitudeStandarddeviation    | fBodyBodyGyroJerkMag-std()    |



The source variables consist of the following parts:
The first letter defines the domain: t for time or f for frequency
The next part defines the source variable: BodyAcc (BodyAcceleration), GravityAcc (GravityAcceleration) or BodyGyro (BodyGyroscope)
The next (optional) part describes the method that was used to derive the variable: Mag (Magnitued), Jerk or JerkMag (JerkMagnitude)
The part after the dash describes the function that was used to compute the feature mean (Mean) or std (Standarddeviation)
In case of three axial measurements, the last part of the variable defines the axis (X, Y or Z)

#Output Variable Units

* subject: identifier of an observed volunteer within an age bracket of 19-48 years.
    * Data type: Numeric
    * Value range: 1 - 30
* activity: Label string of the observed activity a person was performing
    * Data type: factor
    * Labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Rows 3 - 68: Means of selected features per subject and activity
    * Data type: The feature means have the same units as their input data. Due to the normalization they do not have units attached
    * Value range: [-1, 1]

#Tidy Data

The tidy data set contains :

* Subject : Identifier of the subject who carried out the experiment. Its range is from 1 to 30. 
* Activity : Activity label: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying
* Mean of all other variables are measurement collected from the accelerometer and gyroscope 3-axial raw signal (numeric value)

The data set is written to the file 'tidydata.txt'.
The tidy data set a set of variables for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + ActivityName + ActivityNum . The tidy data set’s first row is the header containing the names for each column.
