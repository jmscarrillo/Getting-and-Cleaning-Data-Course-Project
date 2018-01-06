## Coursera - Data Science - Universidad Johns Hopkins
## Getting and Cleaning Data - Week 4
## Course Project
## José Mª Sebastián Carrillo

##########
## Step 0A.- Check libraries in the current system.
##########

if (!require('dplyr')) {
    stop('The package dplyr was not installed!')
}

library(dplyr)

##########
## Step 0B.- Check if the downloaded data already exists.
##########

currentFolder <- getwd()
dataFileZip <- "UCI_HAR_Dataset.zip"

# Verify the file downloaded
if (!file.exists(dataFileZip)){
    dataFileZipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(dataFileZipUrl, dataFileZip, method="curl")
}

# Verify the folder with the data uncompressed
dataFolderName <- "UCI HAR Dataset"
dataFolder <- file.path(currentFolder, dataFolderName)
if (!dir.exists(dataFolder)) {
    unzip(dataFileZip)
}

##########
## Step 01.- Merges the training and the test sets to create one data set.
##########

# Author <- "José Mª Sebastián Carrillo"

# Read the training data files
trainingSubjects <- read.table(file.path(dataFolderName, "train", "subject_train.txt"), header = FALSE)
trainingValues <- read.table(file.path(dataFolderName, "train", "X_train.txt"), header = FALSE)
trainingActivity <- read.table(file.path(dataFolderName, "train", "y_train.txt"), header = FALSE)

# Read the test data files
testSubjects <- read.table(file.path(dataFolderName, "test", "subject_test.txt"), header = FALSE)
testValues <- read.table(file.path(dataFolderName, "test", "X_test.txt"), header = FALSE)
testActivity <- read.table(file.path(dataFolderName, "test", "y_test.txt"), header = FALSE)

# Read the features data file
dataFeatures = read.table(file.path(dataFolderName, "features.txt"), header = FALSE, as.is = TRUE)
colnames(dataFeatures) <- c("featureId", "featureLabel")

# Read the activity labels data file
activityLabels = read.table(file.path(dataFolderName, "activity_labels.txt"), header = FALSE, as.is = TRUE)
colnames(activityLabels) <- c("activityId", "activityLabel")

# Combine all data in one
allData <- rbind(
    cbind(trainingSubjects, trainingActivity, trainingValues),
    cbind(testSubjects, testActivity, testValues)
)
colnames(allData) <- c("subjectId", "activityId", dataFeatures$featureLabel)

# Delete the variables which we don't need to use more (memory efficiency purposes)
rm(trainingSubjects, trainingActivity, trainingValues, 
   testSubjects, testActivity, testValues)


##########
## Step 02.- Extracts only the measurements on the mean and standard deviation
##              for each measurement.
##########

# Obtains the target columns (key columns [subjectId,activityId] and data columns [mean,std])
targetColumns <- grepl("subjectId|activityId|mean|std", colnames(allData))

# Constructs the dataset with the data required
targetData <- allData[, targetColumns]

# Delete the variables which we don't need to use more (memory efficiency purposes)
rm(allData)


##########
## Step 03.- Uses descriptive activity names to name the activities in the data set.
## Step 04.- Appropriately labels the data set with descriptive variable names.
##########

# Obtains the columns for apply the descriptive names
targetDataColumns <- colnames(targetData)

# Remove all the special characters
targetDataColumns <- gsub("[\\(\\)-]", "", targetDataColumns)

# Apply the correct names
targetDataColumns <- gsub("mean$", "Mean", targetDataColumns)
targetDataColumns <- gsub("std$", "StandardDeviation", targetDataColumns)
targetDataColumns <- gsub("mean", "Mean_", targetDataColumns)
targetDataColumns <- gsub("std", "StandardDeviation_", targetDataColumns)

targetDataColumns <- gsub("Acc", "Accelerometer_", targetDataColumns)
targetDataColumns <- gsub("Gyro", "Gyroscope_", targetDataColumns)
targetDataColumns <- gsub("Mag", "Magnitude_", targetDataColumns)
targetDataColumns <- gsub("Freq", "Frequency_", targetDataColumns)
targetDataColumns <- gsub("Body", "Body_", targetDataColumns)
targetDataColumns <- gsub("Gravity", "Gravity_", targetDataColumns)

targetDataColumns <- gsub("^t", "Time_", targetDataColumns)
targetDataColumns <- gsub("^f", "Frequency_", targetDataColumns)
targetDataColumns <- gsub("_$", "", targetDataColumns)

# Rename the targetData column names with the correct ones
colnames(targetData) <- targetDataColumns

##########
## Step 05.- From the data set in step 4, creates a second, independent tidy data set
##              with the average of each variable for each activity and each subject.
##########

# Using the pipe operator, obtains the mean of all values, grouping by "subject" and "activity".
tidyDataSet <- targetData %>% 
    group_by(subjectId, activityId) %>%
    summarise_all(funs(mean))

# output to file "tidy_data_set.txt"
write.table(tidyDataSet, "tidy_data_set.txt", row.names = TRUE, 
            quote = FALSE)

