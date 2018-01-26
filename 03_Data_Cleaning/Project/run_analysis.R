# R Programming (JHU) Coursera
## Written by Jack Zhan
## 01/24/2018

library(dplyr)
library(data.table)

#Set the working directory
setwd("C:/git/datasciencecoursera/03_Data_Cleaning/Dataset/UCI HAR Dataset")

# Find all the mean and std columns
features <- fread("features.txt")
features[,2] <- as.character(features$V2)
needed_features <- grep("*mean*|*std*", features$V2)
feature_names <- features$V2[needed_features]
feature_names = gsub('-mean', 'Mean', feature_names)
feature_names = gsub('-std', 'Std', feature_names)
feature_names <- gsub('[-()]', '', feature_names)

#Load the training dataset with the wanted features
train_dat <- fread("train/X_train.txt")[,needed_features,with=FALSE]
train_activities <- fread("train/Y_train.txt")
train_subjects <- fread("train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train_dat)

#Load the test dataset with the wanted features
test_dat <- fread("test/X_test.txt")[,needed_features,with=FALSE]
test_activities <- fread("test/Y_test.txt")
test_subjects <- fread("test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test_dat)

#Merge and add labels to the dataset
final_dat <- rbind(train, test)
colnames(final_dat) <- c("subject", "activity", feature_names)

#Get the activity labels of dataset
labels <- fread("activity_labels.txt")

#Turn activities and subjects into factors
final_dat$activity <- factor(final_dat$activity, levels = labels$V1, labels = labels$V2)
final_dat$subject <- as.factor(final_dat$subject)

#Write the tidy data set with the average of each variable for each activity and each subject
dat_melt <- melt(final_dat, id = c("subject", "activity"))
dat_mean <- dcast(dat_melt, subject + activity ~ variable, mean)
write.table(dat_mean, "../../Project/tidy.txt", row.names = FALSE, quote = FALSE)

summary(dat_mean$subject)

