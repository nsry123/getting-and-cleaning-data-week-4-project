# Project Codebook
## Access to source data

This is the dataset for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## About the R script
The script performs the following five steps to process the data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## About variables
`train_x`,`train_y`,`train_subj`,`test_x`,`test_y`,`test_subj`,`features`,`activityLabels` contain the data reading from the files.
The rest of the variables are made very clear in the script.
