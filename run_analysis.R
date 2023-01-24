#read in all the train data
train_x = read.table("./UCI HAR Dataset/train/X_train.txt")
train_y = read.table("./UCI HAR Dataset/train/y_train.txt")
train_subj = read.table("./UCI HAR Dataset/train/subject_train.txt")

#read in all the test data
test_x = read.table("./UCI HAR Dataset/test/X_test.txt")
test_y = read.table("./UCI HAR Dataset/test/y_test.txt")
test_subj = read.table("./UCI HAR Dataset/test/subject_test.txt")

#read in the list of feature names and activity labels
features = read.table("./UCI HAR Dataset/features.txt")
activityLabels = read.table("./UCI HAR Dataset/activity_labels.txt")

#change the column names of the data frames accordingly
colnames(test_x) <- features[,2] -> colnames(train_x)
colnames(test_y) <- "activityID" -> colnames(train_y)
colnames(train_subj) <- "subjectID" -> colnames(test_subj)


#merge the train and test sets into an overall data frame
train = cbind(train_x,train_subj,train_y)
test = cbind(test_x,test_subj,test_y)
all_df = rbind(train,test)

#select rows that contain mean and std, along with activityID and subjectID
columnNames <- colnames(all_df)
selectedRows = (grepl("activityID",columnNames)|grepl("subjectID",columnNames)|grepl("mean..",columnNames)|grepl("std...",columnNames))

#subsetting the mean and std data frame
dfMeanStd = all_df[,selectedRows]

#define the function that maps activityID to the corresponding activity
ID_to_activity = function(activity){
  activityLabels[activityLabels[,1]==activity,2]
}

#use descriptive activity names to name the activities in the data set
dfMeanStd[,72] = sapply(dfMeanStd[,72],ID_to_activity)

#create a second tidy dataset
tidySet = aggregate(. ~subjectID + activityID, dfMeanStd, mean)
tidySet = tidySet[order(tidySet$subjectID, tidySet$activityID), ]

#write the tidy dataset
write.table(tidySet, "tidySet.txt", row.names = FALSE)


