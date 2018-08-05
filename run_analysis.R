###Getting and Cleaning Data Course Project

#check if dplyr package is installed, if not, install it. Then load dplyr

list.of.packages <- c("dplyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(dplyr)

# Create a temporary directory to store the zip file

tf <- tempfile()
td <- tempdir()

# Load the Zip file

zipData <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(zipData, tf, mode="wb")

#Unzip the zip file

FileNames <- unzip(tf, exdir=td)

#Read the files as tables to prepare for merging

labels <- read.table(FileNames[1], header=FALSE)
features <- read.table(FileNames[2])

subtest <- read.table(FileNames[14], header=FALSE)
xtest <- read.table(FileNames[15], header=FALSE)
ytest <- read.table(FileNames[16], header=FALSE)

subtrain <- read.table(FileNames[26], header=FALSE)
xtrain <- read.table(FileNames[27], header=FALSE)
ytrain <- read.table(FileNames[28], header=FALSE)

# Merge Files

submerge <- rbind(subtrain, subtest)
xmerge <- rbind(xtrain, xtest)
ymerge <- rbind(ytrain, ytest)

#Add descriptive labels to y and to the Subject file

labelledy <- left_join(ymerge, labels)
colnames(labelledy) <- c("ActivityNumber", "ActivityDescription")
colnames(submerge) <- c("Subject")

#name columns in x based on the feature

colnames(xmerge) <- features$V2

# Extract only mean and standard deviation columns, then combine to one dataset

MeanData <- xmerge[,grep(pattern="-mean()", colnames(xmerge))]
StdData <- xmerge[,grep(pattern="-std()", colnames(xmerge))]

MeanStdData <- cbind(MeanData, StdData)

#combine x, y and subjects to create a full dataset

xydata <- cbind(labelledy, MeanStdData)

activitydata <- cbind(submerge, xydata)

#create a table to average each variable for each activity for each subject

SummarisedActivityData <- activitydata %>%
  group_by(Subject, ActivityDescription) %>%
  summarise_all(mean)