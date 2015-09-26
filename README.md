# GandCData
### Script run_analysis.R steps to Generate Submitted Data Set

1.	Read and combined the training and the test sets to create one data set using rbind for complete measurements data set. Did a similar combination for the subjects and activities data sets.
2.	Extracted only the measurements on the mean and standard deviation for each measurement. Selected only those measurements that had mean() or std(), using grepl, resulting in 66 columns being selected for further processing.
3.	Replaced the numeric activity names with descriptive names in the data set by matching the activity names to the activity codes in the data set supplied for this project.
4.	Replaced the provided measurement names with descriptive label names and applied them to the data set. Added the subjects and activities columns to the data set using cbind resulting in a data set with 68 columns.
5.	From the data set in step 4, created a second  independent tidy data set with the average of each variable for each activity and each subject using aggregate. This resulted in a data set with 180 rows [30 subjects by 6 activities] and 68 columns [Subjects, Activities and 66 measurement averages].
6.	The created tidy data set was written out as a text file, tidy_data.txt using write.table with row.names = FALSE.

This file was uploaded as part of this submission.

### Code book information for tidy data set

#### Source

Original data from Human Activity Recognition Using Smartphones Dataset [Version 1.0] from:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
www.smartlab.ws

### Data Set Information

#### Oringinal Data Set

The data are from the experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#### Attribute Information for the Original Data Set

The original data set includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The complete list of variables of each feature vector is available in 'features.txt'.

### Attribute Information for the Tidy Data Set Submitted:

- Test_Subjects: list of subjects identified as 1 to 6;
- Activity_Name: list of 6 activities [ "Walking", "Walking_Up", "Walking_Down", "Sitting", "Standing", "Laying"]
-  66 measurement averages by subject and activities. The measurements used were the mean and standard deviation of the folloiwng 66 variables: 

[Notes:
X, Y or Z'is used to denote corresponding axial signals in the X, Y and Z directions. 
The notation Time_Domain and Freq_Domain are used to denote time and frequency domain values respecitively.
Since the measurements in the original data set were normalized and bounded within [-1,1], there are no units to any of these values. If not normalized, acceleration would have units of m/s^2 and gyro velocity would have units of radians/s.]

Mean_Body_Acceleration_Time_Domain_X_axis
Mean_Body_Acceleration_Time_Domain_Y_axis
Mean_Body_Acceleration_Time_Domain_Z_axis
StdDev_Body_Acceleration_Time_Domain_X_axis
StdDev_Body_Acceleration_Time_Domain_Y_axis
StdDev_Body_Acceleration_Time_Domain_Z_axis
Mean_Gravity_Acceleration_Time_Domain_X_axis
Mean_Gravity_Acceleration_Time_Domain_Y_axis
Mean_Gravity_Acceleration_Time_Domain_Z_axis
StdDev_Gravity_Acceleration_Time_Domain_X_axis
StdDev_Gravity_Acceleration_Time_Domain_Y_axis
StdDev_Gravity_Acceleration_Time_Domain_Z_axis
Mean_Body_Acceleration_Jerk_Time_Domain_X_axis
Mean_Body_Acceleration_Jerk_Time_Domain_Y_axis
Mean_Body_Acceleration_Jerk_Time_Domain_Z_axis
StdDev_Body_Acceleration_Jerk_Time_Domain_X_axis
StdDev_Body_Acceleration_Jerk_Time_Domain_Y_axis
StdDev_Body_Acceleration_Jerk_Time_Domain_Z_axis
Mean_Body_Gyro_Velocity_Time_Domain_X_axis
Mean_Body_Gyro_Velocity_Time_Domain_Y_axis
Mean_Body_Gyro_Velocity_Time_Domain_Z_axis
StdDev_Body_Gyro_Velocity_Time_Domain_X_axis
StdDev_Body_Gyro_Velocity_Time_Domain_Y_axis
StdDev_Body_Gyro_Velocity_Time_Domain_Z_axis
Mean_Body_Gyro_Jerk_Time_Domain_X_axis
Mean_Body_Gyro_Jerk_Time_Domain_Y_axis
Mean_Body_Gyro_Jerk_Time_Domain_Z_axis
StdDev_Body_Gyro_Jerk_Time_Domain_X_axis
StdDev_Body_Gyro_Jerk_Time_Domain_Y_axis
StdDev_Body_Gyro_Jerk_Time_Domain_Z_axis
Mean_Body_Acceleration_Magnitude_Time_Domain
StdDev_Body_Acceleration_Magnitude_Time_Domain
Mean_Gravity_Acceleration_Magnitude_Time_Domain
StdDev_Gravity_Acceleration_Magnitude_Time_Domain
Mean_Body_Acceleration_Jerk_Magnitude_Time_Domain
StdDev_Body_Acceleration_Jerk_Magnitude_Time_Domain
Mean_Body_Gyro_Velocity_Magnitude_Time_Domain
StdDev_Body_Gyro_Velocity_Magnitude_Time_Domain
Mean_Body_Gyro_Jerk_Magnitude_Time_Domain
StdDev_Body_Gyro_Jerk_Magnitude_Time_Domain
Mean_Body_Acceleration_Freq_Domain_X_axis
Mean_Body_Acceleration_Freq_Domain_Y_axis
Mean_Body_Acceleration_Freq_Domain_Z_axis
StdDev_Body_Acceleration_Freq_Domain_X_axis
StdDev_Body_Acceleration_Freq_Domain_Y_axis
StdDev_Body_Acceleration_Freq_Domain_Z_axis
Mean_Body_Acceleration_Jerk_Freq_Domain_X_axis
Mean_Body_Acceleration_Jerk_Freq_Domain_Y_axis
Mean_Body_Acceleration_Jerk_Freq_Domain_Z_axis
StdDev_Body_Acceleration_Jerk_Freq_Domain_X_axis
StdDev_Body_Acceleration_Jerk_Freq_Domain_Y_axis
StdDev_Body_Acceleration_Jerk_Freq_Domain_Z_axis
Mean_Body_Gyro_Velocity_Freq_Domain_X_axis
Mean_Body_Gyro_Velocity_Freq_Domain_Y_axis
Mean_Body_Gyro_Velocity_Freq_Domain_Z_axis
StdDev_Body_Gyro_Velocity_Freq_Domain_X_axis
StdDev_Body_Gyro_Velocity_Freq_Domain_Y_axis
StdDev_Body_Gyro_Velocity_Freq_Domain_Z_axis
Mean_Body_Acceleration_Magnitude_Freq_Domain
StdDev_Body_Acceleration_Magnitude_Freq_Domain
Mean_Body_Acceleration_Jerk_Magnitude_Freq_Domain
StdDev_Body_Acceleration_Jerk_Magnitude_Freq_Domain
Mean_Body_Gyro_Velocity_Magnitude_Freq_Domain
StdDev_Body_Gyro_Velocity_Magnitude_Freq_Domain
Mean_Body_Gyro_Jerk_Magnitude_Freq_Domain
StdDev_Body_Gyro_Jerk_Magnitude_Freq_Domain

The file Descriptive_Var_Names.txt has the info used to add these descripting column namesto to the tidy data set.
