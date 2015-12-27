# GettingAndCleaningData
Start the analysis by downloading and unzipping the dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
From the directory UCI HAR Directory, use R code script called run_analysis.R to carry out the analysis. A high level summary of these steps are below.

##The Script

First, extract the files you need.
Merge the datasets from two subdirectories Test and Train.
Select only the columns (variables of interest), specifically those relecting standard deviations or means.  This text appears in those column names: “std” and “mean”.
Rename activities.
Rename columns.
Filter out a new data set that is tidy.  The new data set contains means of each variable for each activity and each subject.

##The Tidy Data Set

A link in this repo GettingAndCleaningData takes you to a file called tiny_data.txt.

##Code Book

A link in this repo GetCleanData takes you to a file called CodeBook.md.

This code book modifies and updates the code book available from the original analysis.  It provides a description of the variables used, measurement units, and other relevant information.

