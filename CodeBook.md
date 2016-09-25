# Code Book
This Code Book updates and modifies the data from the [Human Activity Recognition ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) database built from the recordings of 30 subjects perfirming activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 

## Original Data
The original experiment have been carried out by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Transformation details
From the data collected by the original experiment, this analysis did the following:
1. Merges the training and test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Creates a second, independent data set with the average of each variable for each ativity and each subject

The resulting data set was saved in "analysis_data.txt" file.

## Variables
The features selected on the original data set come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'time') were captured at a constant rate of 50Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcceleration-XYZ and timeGravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerationJerk-XYZ and timeBodyAngularVelocityJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccelerationMagnitude, timeGravityAccelerationMagnitude, timeBodyAccelerationJerkMagnitude, timeBodyAngularVelocityMagnitude, timeBodyAngularVelocityJerkMagnitude).

Finally a Fast Fourier Transform (TTF) was applied to some of these signals producing frequencyBodyAcceleration-XYZ, frequencyBodyAccelerationJerk-XYZ, frequencyBodyAngularVelocity-XYZ, frequencyBodyAccelerationJerkMagnitude, frequencyBodyAngularVelocityMagnitude, frequencyBodyAngularVelocityJerkMagnitude.

From the original measures, for this analysis it was selected only the mean value (_mean()_) and standard deviation (_std()_).

These measures were averaged by each one of the 30 subjects and for each of the six activities considered (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), resulting in 180 observations.

The complete list of variables resulting from the processing of the original data is:

* subject
* activity
* timeBodyAcceleration-mean()-X
* timeBodyAcceleration-mean()-Y
* timeBodyAcceleration-mean()-Z
* timeBodyAcceleration-std()-X
* timeBodyAcceleration-std()-Y
* timeBodyAcceleration-std()-Z
* timeGravityAcceleration-mean()-X
* timeGravityAcceleration-mean()-Y
* timeGravityAcceleration-mean()-Z
* timeGravityAcceleration-std()-X
* timeGravityAcceleration-std()-Y
* timeGravityAcceleration-std()-Z
* timeBodyAccelerationJerk-mean()-X
* timeBodyAccelerationJerk-mean()-Y
* timeBodyAccelerationJerk-mean()-Z
* timeBodyAccelerationJerk-std()-X
* timeBodyAccelerationJerk-std()-Y
* timeBodyAccelerationJerk-std()-Z
* timeBodyAngularVelocity-mean()-X
* timeBodyAngularVelocity-mean()-Y
* timeBodyAngularVelocity-mean()-Z
* timeBodyAngularVelocity-std()-X
* timeBodyAngularVelocity-std()-Y
* timeBodyAngularVelocity-std()-Z
* timeBodyAngularVelocityJerk-mean()-X
* timeBodyAngularVelocityJerk-mean()-Y
* timeBodyAngularVelocityJerk-mean()-Z
* timeBodyAngularVelocityJerk-std()-X
* timeBodyAngularVelocityJerk-std()-Y
* timeBodyAngularVelocityJerk-std()-Z
* timeBodyAccelerationMagnitude-mean()
* timeBodyAccelerationMagnitude-std()
* timeGravityAccelerationMagnitude-mean()
* timeGravityAccelerationMagnitude-std()
* timeBodyAccelerationJerkMagnitude-mean()
* timeBodyAccelerationJerkMagnitude-std()
* timeBodyAngularVelocityMagnitude-mean()
* timeBodyAngularVelocityMagnitude-std()
* timeBodyAngularVelocityJerkMagnitude-mean()
* timeBodyAngularVelocityJerkMagnitude-std()
* frequencyBodyAcceleration-mean()-X
* frequencyBodyAcceleration-mean()-Y
* frequencyBodyAcceleration-mean()-Z
* frequencyBodyAcceleration-std()-X
* frequencyBodyAcceleration-std()-Y
* frequencyBodyAcceleration-std()-Z
* frequencyBodyAcceleration-meanFreq()-X
* frequencyBodyAcceleration-meanFreq()-Y
* frequencyBodyAcceleration-meanFreq()-Z
* frequencyBodyAccelerationJerk-mean()-X
* frequencyBodyAccelerationJerk-mean()-Y
* frequencyBodyAccelerationJerk-mean()-Z
* frequencyBodyAccelerationJerk-std()-X
* frequencyBodyAccelerationJerk-std()-Y
* frequencyBodyAccelerationJerk-std()-Z
* frequencyBodyAccelerationJerk-meanFreq()-X
* frequencyBodyAccelerationJerk-meanFreq()-Y
* frequencyBodyAccelerationJerk-meanFreq()-Z
* frequencyBodyAngularVelocity-mean()-X
* frequencyBodyAngularVelocity-mean()-Y
* frequencyBodyAngularVelocity-mean()-Z
* frequencyBodyAngularVelocity-std()-X
* frequencyBodyAngularVelocity-std()-Y
* frequencyBodyAngularVelocity-std()-Z
* frequencyBodyAngularVelocity-meanFreq()-X
* frequencyBodyAngularVelocity-meanFreq()-Y
* frequencyBodyAngularVelocity-meanFreq()-Z
* frequencyBodyAccelerationMagnitude-mean()
* frequencyBodyAccelerationMagnitude-std()
* frequencyBodyAccelerationMagnitude-meanFreq()
* frequencyBodyAccelerationJerkMagnitude-mean()
* frequencyBodyAccelerationJerkMagnitude-std()
* frequencyBodyAccelerationJerkMagnitude-meanFreq()
* frequencyBodyAngularVelocityMagnitude-mean()
* frequencyBodyAngularVelocityMagnitude-std()
* frequencyBodyAngularVelocityMagnitude-meanFreq()
* frequencyBodyAngularVelocityJerkMagnitude-mean()
* frequencyBodyAngularVelocityJerkMagnitude-std()
* frequencyBodyAngularVelocityJerkMagnitude-meanFreq()
