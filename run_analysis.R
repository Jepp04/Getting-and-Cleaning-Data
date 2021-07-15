## Pre downloaded and extracted data from a Zip file 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Load Required Libraries
library(dplyr)
library(tidyr)
library(data.table)

## Read all test and train data in to R
# Test Data
xTest <- fread("UCI HAR Dataset/test/X_test.txt",sep = " ")
yTest <- fread("UCI HAR Dataset/test/Y_test.txt",sep = " ")
subjectTest <- fread("UCI HAR Dataset/test/subject_test.txt",sep = " ")

# Train Data
xTrain <- fread("UCI HAR Dataset/train/X_train.txt",sep = " ")
yTrain <- fread("UCI HAR Dataset/train/Y_train.txt",sep = " ")
subjectTrain <- fread("UCI HAR Dataset/train/subject_train.txt",sep = " ")

## Load all Activity and Feature labels
activityLabels <- fread("UCI HAR Dataset/activity_labels.txt",sep = " ")
features <- fread("UCI HAR Dataset/features.txt",sep = " ")

## Add Variable Names
resultX <- rbind.data.frame(xTest,xTrain)
names(resultX) <- features$V2
resultY <- rbind.data.frame(yTest,yTrain)
names(resultY) <-"Activity"
resultsubject <- rbind.data.frame(subjectTest,subjectTrain)
names(resultsubject) <-"Subject"

## Replace Activity Number with descriptive labels
for(i in 1:6)
{
  resultY$Activity<-sub(i,activityLabels$V2[i],resultY$Activity)
}

## Merge data into one Data set
tidyDataSet <- cbind.data.frame(resultsubject,resultY,resultX)



## Extract measurements on mean and standard deviation.
measurementsData <- tidyDataSet[,1:2]
measurementsData <- cbind.data.frame(measurementsData,tidyDataSet[,grep("mean()|std()",names(tidyDataSet))])
measurementsData <- tbl_df(measurementsData)

## Tidy data set with the average of each variable for each activity and each subject
GroupedData <- group_by(measurementsData, Activity, Subject)
GroupedData <- summarise_each(GroupedData, funs(mean))
write.table(GroupedData,"tidy_Data.txt",row.names = FALSE)
