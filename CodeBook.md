# Description

The script `run_analysis.R` contains 5 steps, to achieve the objective in the course project's definition (a more complete description it's inside the code).

* Step 0A.- Check libraries in the current system. In this case, the program requires 'dplyr'.
* Step 0B.- Check if the downloaded data already exists. If the file has been previously downloaded and unzipped, jumps to the next step, otherwise, download and unzip the file in the current working directory.
* Step 01.- Merges the training and the test sets to create one data set. First of all, read all the data files and stores in variables (data frames). In case of 'features' and 'labels', add the column names. Then construct a data frame with the combination of all, assigns column names, and delete the variables (data frames) with the raw file data, for memory efficiency purposes.
* Step 02.- Extracts only the measurements on the mean and standard deviation for each measurement. Filter the column names, and then constructs a new data frame.
* Step 03/04.- Uses descriptive activity names to name the activities in the data set/Appropriately labels the data set with descriptive variable names. Using regular expressions, transform the column names to another ones more 'readeble'.
* Step 05.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Using pipes, it's possible to group (more clearly for the un-experienced user) by the two key fields, applying the 'mean' function to the anoter ones. Finally, save the result to the output file 'tidy_data_set.txt'.