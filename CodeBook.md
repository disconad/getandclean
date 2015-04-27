###Input Data
The script uses the UCI dataset provided in a .zip
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
This is extracted into the working directory.

The dataset includes the following files:
- <i>features_info.txt,features.txt</i> - Provides information about the feature variables provided.
- <i>activity_labels.txt</i> - A table outlining the activities that corespond to the integers in the y_train and y_test data.
- <i>x_train.txt, x_test.txt</i> - contains the recorded data .
- <i>y_train.txt, y_test.txt</i> - contains the activity integer to define what activity was done.
- <i>subject_train.txt, subject_test.txt</i> - contains identifiers for the subjects. 

###Variables

The resulting tidy_data.txt dataset includes a calculated average of the mean and standard deviation variables for the following, arranged by Subject and Activity.


||||
--- | --- | --- | --- |
|tBodyAcc-mean()-X|tBodyAcc-mean()-Y|tBodyAcc-mean()-X.1|
tBodyAcc-mean()-Y.1|tBodyAcc-mean()-Z|tBodyAcc-std()-X
|tBodyAcc-std()-Y|tBodyAcc-std()-Z|tGravityAcc-mean()-X|
tGravityAcc-mean()-Y|tGravityAcc-mean()-Z|tGravityAcc-std()-X|
tGravityAcc-std()-Y|tGravityAcc-std()-Z|tBodyAccJerk-mean()-X|
tBodyAccJerk-mean()-Y|tBodyAccJerk-mean()-Z|tBodyAccJerk-std()-X|
tBodyAccJerk-std()-Y|tBodyAccJerk-std()-Z|tBodyGyro-mean()-X|
tBodyGyro-mean()-Y|tBodyGyro-mean()-Z|tBodyGyro-std()-X|
tBodyGyro-std()-Y|tBodyGyro-std()-Z|tBodyGyroJerk-mean()-X|
tBodyGyroJerk-mean()-Y|tBodyGyroJerk-mean()-Z|tBodyGyroJerk-std()-X|
tBodyGyroJerk-std()-Y|tBodyGyroJerk-std()-Z|tBodyAccMag-mean()|
tBodyAccMag-std()|tGravityAccMag-mean()|tGravityAccMag-std()|
tBodyAccJerkMag-mean()|tBodyAccJerkMag-std()|tBodyGyroMag-mean()|
tBodyGyroMag-std()|tBodyGyroJerkMag-mean()|tBodyGyroJerkMag-std()|
fBodyAcc-mean()-X|fBodyAcc-mean()-Y|fBodyAcc-mean()-Z|
|fBodyAcc-std()-X|fBodyAcc-std()-Y|fBodyAcc-std()-Z|
|fBodyAccJerk-mean()-X|fBodyAccJerk-mean()-Y|fBodyAccJerk-mean()-Z|
|fBodyAccJerk-std()-X|fBodyAccJerk-std()-Y|fBodyAccJerk-std()-Z|
|fBodyGyro-mean()-X|fBodyGyro-mean()-Y|fBodyGyro-mean()-Z|
|fBodyGyro-std()-X|fBodyGyro-std()-Y|fBodyGyro-std()-Z|
|fBodyAccMag-mean()|fBodyAccMag-std()|fBodyBodyAccJerkMag-mean()|
|fBodyBodyAccJerkMag-std()|fBodyBodyGyroMag-mean()|fBodyBodyGyroMag-std()|
|fBodyBodyGyroJerkMag-mean()|fBodyBodyGyroJerkMag-std()|angle(tBodyAccMean,gravity)|
|angle(tBodyAccJerkMean),gravityMean)|angle(tBodyGyroMean,gravityMean)|angle(tBodyGyroJerkMean,gravityMean)|
|angle(X,gravityMean)|angle(Y,gravityMean)|angle(Z,gravityMean)|

##Transformations
run_analysis.R, does the following:
1. Merges the training and the test x data sets to create one data set.
2. renames the x_data set with activites, the y_data set with Labels, the s_data with Subject.
3. Extracts only the measurements on the mean and standard deviation from the mergerd x data.
4. Create a filter for the mean() and std() data. 
5. Apply the filter, and create a new cleaned table.
6. Bind the remaining subject and activity data into the cleaned table
7. Rename activities from the loaded activites_label.txt file.
8. Uses dplyr to summarise the data with the mean of each variable by activity and subject.
