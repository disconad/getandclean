## Getting and Cleaning Data Course Project

This R script is for creating a new tidy data set from a given compilation. (Found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###To run the script:
  1. Extract the above .zip data into your working R directory. 
  2. Run the script.
  3. You now have the resultant tidy_data.txt file.

###The script:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


###For futher details, refer to CookBook.md

###Required R Packages:
data.table

dplyr

plyr

reshape2


