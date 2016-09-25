# Getting and Cleaning Data Couse Project
This is the Coursera's _Getting and Cleaning Data_ final course project.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis.

## Description
This projects starts with the Human Activity Recognition [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and does the following:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Content
This project contains four files and described below:

* `run_analysis.R` - R script that performs the steps described above
* `README.md` - this file. Explains how the script works
* `CodeBook.md`- modifies and updates the original data code book with the resulting variables and summaries calculated
* `activity_data.txt`- resulting tidy data set with the average of each variable for each activity and each subject

## Running the script
Download the `run_analysis.R` script into a folder on the local drive.

The script will look for a folder called `UCI HAR Dataset` on the same directory where it was saved. If it does not already exists, it downloads the original data set and unzips it. 

The script will produce a resulting file called `activity_data.txt` with the average of each mean and standard deviation variable for each activity and each subject.