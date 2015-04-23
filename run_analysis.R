# Create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
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

require("data.table")
require("reshape2")

#fileName = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileName, 'data.zip', method = 'curl')
#unzip('data.zip')

# Read in activity labels and features, and raw data.
actlab <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
feat <- read.table("./UCI HAR Dataset/features.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
s_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
s_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

# Merge the data
x_data <- rbind(x_test, x_train)
y_data <- rbind(y_test, y_train)
s_data <- rbind(s_test, s_train)

# rename the x_data set with activites, the y_data set with ID and Label, the s_data with Subject.
colnames(x_data) <- t(feat[2])
colnames(y_data) <- "Activity"
colnames(s_data) <- "Subject"

# Create a filter for the mean() and std() data.
filt<- grep(".*mean.*|.*std.*",names(x_data), ignore.case = TRUE)


# filter for the mean() and std() data
x_data <- x_data[,filt]

# bind the data together
complete_data <- cbind(x_data,y_data,s_data)




write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)