# GettingAndCleaningData
Start the analysis by downloading and unzipping the dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
from the directory UCI HAR Directory.  Move files into a directory called /data.  Run the  R code script called run_analysis.R one level above /data. A high level summary of these steps are below.

##The Script

Read the files into R.
Merge the datasets from the original Test and Train directories.
Select only the variables of interest -- those relecting standard deviations or means.  This text appears in those column names: “std” and “mean”.
Rename numeric activities.
Remove extra characters in variable names give a cleaner appearance.
Filter out a new data set that is tidy.  The new data set contains means of each variable for each activity and each subject.

##The Tidy Data Set

A link in this repo GettingAndCleaningData takes you to a file called tiny_data.txt.

##Code Book

A link in this repo GetCleanData takes you to a file called CodeBook.md.

This code book modifies and updates the code book available from the original analysis.  It provides a description of the variables used, measurement units, and other relevant information.

