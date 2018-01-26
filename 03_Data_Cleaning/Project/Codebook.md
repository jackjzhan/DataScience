## Code Book for Course Project
## John Hopkins Coursera
## Taken by Jack Zhan

### Overview

[Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the original data:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
### Process

The script `run_analysis.R` performs the following process to clean up the data
and create tiny data sets:

1. Reads `features.txt` and uses only the measurements on the mean and standard
   deviation for each measurement. 

2. Edit the measurements names.

3. Merge the training and test sets to create one data set.

4. Reads `activity_labels.txt` to get activity names for data set.

5. Add the activity names to the data set.

6. Output mean by subject and activity to `tidy.txt`.

### Variables

Variable | Information
--- | --- 
features | Data frame of `features.txt`
needed_features | Integer vector containing the columns that contain "Mean" or "STD"
feature_names | Character vector containing the cleaned version of the features name
train_dat | Data frame of `train/X_train.txt`
train_activities | Data frame of `train/Y_train.txt`
train_subjects | Data frame of `train/subject_train.txt`
train | Data frame of the merged train data sets
test_dat | Data frame of `test/X_test.txt`
test_activities | Data frame of `test/Y_test.txt`
test_subjects | Data frame of `test/subject_test.txt`
test | Data frame of the merged test data sets
labels | Data frame containing the names of the activites
final_dat | Data frame of the merged data set between train and test
dat_melt | Melted version of final_dat by subject and activity
dat_mean | Final output dataset with the means

### Output

#### tidyData.txt

`tidy.txt` is a 180 by 81 data frame.

- The first column contains subject IDs.
- The second column contains activity names.
- The last 79 columns are measurements.
- Subject IDs are integers between 1 and 30.