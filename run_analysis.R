# Create one R script called run_analysis.R that does the following:

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("reshape2")) {
        install.packages("reshape2")
}

if (!require("plyr")) {
        install.packages("plyr")
}
require("data.table")
require("reshape2")
require("plyr")

## Read in activity labels and features, and raw data.
actlab <- read.table("./UCI HAR Dataset/activity_labels.txt")
feat <- read.table("./UCI HAR Dataset/features.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

## Section 1. Merges the training and the test sets to create one data set.
## Merge the data
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
s_data <- rbind(s_test, s_train)

## rename the x_data set with activites, the y_data set with ID and Label, the s_data with Subject.
colnames(x_data) <- t(feat[2])
colnames(y_data) <- "Activity"
colnames(s_data) <- "Subject"

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

## Create a filter for the mean() and std() data.Use grep to search through the headers.
meanfilter<- grep("mean()\\>",names(x_data), ignore.case = TRUE)
stdfilter<- grep("std()\\>",names(x_data), ignore.case = TRUE)
Activity<- grep("Activity", colnames(y_data))
Subject<- grep("Subject", colnames(s_data))

## Apply the filter, and create a new cleaned table.
filteredData<- c(meanfilter, stdfilter)
sorted<- sort(filteredData)
cleanData<- x_data[, c(1,2,sorted)]

## bind the remaining data together into the cleaned table
complete_data <- cbind(s_data,y_data,cleanData)

## 3. Uses descriptive activity names to name the activities in the data set
## rename activities from the loaded activites_label.txt file.
complete_data$Activity=actlab$V2[match(complete_data$Activity, actlab$V1)]

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Uses plyr to summarise the data with the mean of each variable by activity and subject.
tidy <-summarise_each(group_by(complete_data, Subject, Activity), funs(mean))

write.table(tidy, file = "./tidy_data.txt", row.name=FALSE)