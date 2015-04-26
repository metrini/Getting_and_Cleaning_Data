#CodeBook
This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

##The data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The attached R script (run_analysis.R) performs the following to clean up the data:

Merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt, train/y_train.txt with test/y_test.txt  and train/subject_train.txt with test/subject_test.txt.

Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 

Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:

	WALKING
	WALKING UPSTAIRS
	WALKING DOWNSTAIRS
	SITTING
	STANDING
	LAYING
	
The script also appropriately labels the data set with descriptive names: all feature names had brackets () removed while all underscores are removed from the activity names.   Then it merges the features and the activity data frames. The result is saved as tidy_data.txt, 

Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as data_set_with_the_averages.txt