# Getting and Cleaning Data Course Project

## Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to

In this case, these are the principal files:
    
1. run_analysis.R
> R program which contains all instructions to create the tidy dataset.

2. README.md
> This self-explicative file.

3. CodeBook.md
> Describes all the steps, transformations and variables used in the `run_analysis.R` program

4. tidy_data_set.txt
> Tidy dataset that contains the final result of cleaning data.

## Version

\>sessionInfo()
R version 3.4.3 (2017-11-30)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 17.10

Matrix products: default
BLAS: /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.7.1
LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.7.1

locale:
 [1] LC_CTYPE=es_ES.UTF-8       LC_NUMERIC=C               LC_TIME=es_ES.UTF-8       
 [4] LC_COLLATE=es_ES.UTF-8     LC_MONETARY=es_ES.UTF-8    LC_MESSAGES=es_ES.UTF-8   
 [7] LC_PAPER=es_ES.UTF-8       LC_NAME=C                  LC_ADDRESS=C              
[10] LC_TELEPHONE=C             LC_MEASUREMENT=es_ES.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] dplyr_0.7.4

loaded via a namespace (and not attached):
 [1] compiler_3.4.3   magrittr_1.5     assertthat_0.2.0 R6_2.2.2         tools_3.4.3      pillar_1.0.1    
 [7] bindrcpp_0.2     glue_1.2.0       tibble_1.4.1     yaml_2.1.16      Rcpp_0.12.14     pkgconfig_2.0.1 
[13] rlang_0.1.6      bindr_0.1       
