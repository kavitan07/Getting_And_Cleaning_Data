
Code Book

This code book that describes the variables used, data, and any transformations task that was performed to clean up the data and produce tidy data.



Raw data collection

Raw data were obtained from the UCI Machine Learning repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


Attribute Information:

For each record in the dataset the following is provided:

1.Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

2.Triaxial Angular velocity from the gyroscope.

3.A 561-feature vector with time and frequency domain variables.

4.The activity label.

5.An identifier of the subject who carried out the experiment. 


Raw Data transformation

The raw data sets are processed with the script run_analysis.R script to create a tidy data set.

Merge training and test sets Test and training data, subject ids and activity ids are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors.

Extract mean and standard deviation variables Keep only the values of estimated mean and standard deviation .

Get descriptive activity names A new column is added to intermediate data set with the activity description.

Get abel variables appropriately Labels given from the original collectors were changed to get valid/more descriptive R names 

Create a tidy data set From the intermediate data set is created a final tidy data set where numeric variables are averaged for each activity and each subject.


Tidy data set

Variables

The tidy data set contains :

1. Identifier of the subject who carried out the experiment (Subject). Its range is from 1 to 30. 

2. Activity label (Activity): Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying

3. Mean of all other variables are measurement collected from the accelerometer and gyroscope 3-axial raw signal (numeric value)

The variable name convention is as the following:

1. Measurement: the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroscopeJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerometerJerkMagnitude, timeGravityAccelerometerMagnitude, timeBodyAccelerometerJerkMagnitude, timeBodyGyroscopeMagnitude, timeBodyGyroscopeJerkMagnitude). Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAccelerometer-XYZ, frequencyBodyAccelerometerJerk-XYZ, frequencyBodyGyroscope-XYZ, frequencyBodyAccelerometerJerkMagnitude, frequencyBodyGyroscopeMagnitude, frequencyBodyGyroscopeJerkMagnitude. 

2. Mean/std: mean or standard deviation of the measurement

3. X/Y/Z: one direction of a 3-axial signal

4. Mean: global mean value

5. Std: standard deviation

The data set is written to the file 'tidydata.txt'.
