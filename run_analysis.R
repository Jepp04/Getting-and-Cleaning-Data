## Pre downloaded and extracted data from a Zip file 
## Read all test data in to R
activityLabels <- fread("UCI HAR Dataset/activity_labels.txt",sep = " ")
features <- fread("UCI HAR Dataset/features.txt",sep = " ")

# Test Data
xTest <- fread("UCI HAR Dataset/test/X_test.txt",sep = " ")
yTest <- fread("UCI HAR Dataset/test/Y_test.txt",sep = " ")
subjectTest <- fread("UCI HAR Dataset/test/subject_test.txt",sep = " ")

# Train Data
xTrain <- fread("UCI HAR Dataset/train/X_train.txt",sep = " ")
yTrain <- fread("UCI HAR Dataset/train/Y_train.txt",sep = " ")
subjectTrain <- fread("UCI HAR Dataset/train/subject_train.txt",sep = " ")
# bodyAccX <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",sep = " ")
# bodyAccY <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",sep = " ")
# bodyAccZ <- fread("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",sep = " ")
# bodyGyroX <- fread("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",sep = " ")
# bodyGyroY <- fread("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",sep = " ")
# bodyGyroZ <- fread("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",sep = " ")
# TotX <- fread("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",sep = " ")
# TotY <- fread("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",sep = " ")
# TotZ <- fread("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",sep = " ")

## Merge data into one Dataset
# names(xTest) <- features$V2
resultX <- rbind.data.frame(xTest,xTrain)
resultY <- rbind.data.frame(yTest,yTrain)
resultsubject <- rbind.data.frame(subjectTest,subjectTrain)
result <- cbind.data.frame(resultsubject,resultY,resultYresultX)
result <- tbl_df(result)

