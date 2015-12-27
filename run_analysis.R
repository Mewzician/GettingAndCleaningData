##Getting and Cleaning Data Project
##run_analysis R script

##create the directory if necessary
##download the zip file and unzip it to the /data directory
if(!dir.exists("data")){
    dir.create("data")
}

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "./data")
##unzip the files in UCI HAR Dataset.zip
##manually move files from directories test and train to /data

##START SCRIPT

#Select appropriate libraries
library(plyr)
library(dplyr)

##work from directory one level above newly created directory called 'data'
subjectTest   <- read.table("./data/subject_test.txt")
subjectTrain  <- read.table("./data/subject_train.txt")
xtest         <- read.table("./data/X_test.txt") 
xtrain        <- read.table("./data/X_train.txt")
ytest         <- read.table("./data/y_test.txt")
ytrain        <- read.table("./data/y_train.txt")
features      <- read.csv("./data/features.txt", header = FALSE, sep = " ")
activity      <- read.csv("./data/activity_labels.txt", header = FALSE, sep = " ")

##STEP 1
##Bind the rows of each respective training and test set
##first put each respective test/train group together
merge_x       <- rbind(xtest, xtrain)
merge_y       <- rbind(ytest, ytrain)
merge_subject <- rbind(subjectTest, subjectTrain)
##Add column names to each set of subject, y, and x data
colnames(merge_subject) <- "id"
colnames(merge_y)       <- "activity_name"
names(features)         <- c("number", "name") 
colnames(merge_x)       <- features$name
##Merge the x and y data to create one data set
allData       <- cbind(merge_subject,merge_y, merge_x)

##STEP 2
##subset raw data that includes columns 1 & 2 and those containing "mean" or "std" in their names
allraw     <- tbl_df(allData)
temptable  <- allraw[!duplicated(names(allraw))]
dataSubset <- select(temptable, 1, 2, 
                     contains("mean()", ignore.case = TRUE), 
                     contains("std()", ignore.case = TRUE))

##STEP 3
##replace numeric activity code with name from "activity"
dataSubset$activity_name <- activity[match(dataSubset$activity_name, activity$V1), "V2"]
##sort the df rows by the id column
sortedData <- dataSubset[order(dataSubset$id)]

##STEP 4
##tweak the variable names for clarification
names(sortedData) <- gsub("-","",names(sortedData))
names(sortedData) <- gsub("\\(\\)","",names(sortedData))

##STEP 5
##obtain the mean of each subject's activities
tidyData <- group_by(sortedData, id, activity_name) %>%
    summarize_each(funs(mean)) %>% 
    arrange(id, activity_name)

##upload resulting data set
write.table(tidyData, "tidy_data.txt", row.names = FALSE)
