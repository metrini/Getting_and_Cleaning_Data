## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 1. Merges the training and the test sets to create one data set.

temp1 <- read.table("train/X_train.txt")
temp2 <- read.table("test/X_test.txt")
X_test <- rbind(temp1, temp2)

temp1 <- read.table("train/y_train.txt")
temp2 <- read.table("test/y_test.txt")
Y_test <- rbind(temp1, temp2)

temp1 <- read.table("train/subject_train.txt")
temp2 <- read.table("test/subject_test.txt")
Subject_test <- rbind(temp1, temp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
features_indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X_test <- X_test[, features_indices]
names(X_test) <- features[features_indices, 2]
names(X_test) <- gsub("\\(|\\)", "", names(X_test))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", " ", as.character(activities[, 2]))
activities[, 2] = as.character(activities[, 2])
Y_test[,1] = activities[Y_test[,1], 2]
names(Y_test) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

names(Subject_test) <- "subject"
tidyDataSet <- cbind(Subject_test, Y_test, X_test)
write.table(tidyDataSet, "tidy_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
independent <- tidyDataSet[, 3:dim(tidyDataSet)[2]] 
tidyAVG <- aggregate(independent,list(tidyDataSet$subject, tidyDataSet$activity), mean)

names(tidyAVG)[1] <- "subject"
names(tidyAVG)[2] <- "activity"

write.table(tidyAVG, row.name=FALSE, "data_set_with_the_averages.txt")
  
  
  
  