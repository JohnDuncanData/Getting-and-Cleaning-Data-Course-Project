## Getting-and-Cleaning-Data-Course-Project

### Description

This R script processes data from the Human Activity Recognition Using Smartphones Dataset study. It loads the files, combines the test and training data sets and captures the mean and standard deviation measurements. An additional dataset is created that averages the mean and standard deviation measurements by each subject and activity.

Run the R script run_analysis.R that will download the zip file, combine the relevant files and output 2 data sets: activitydata and SummarisedActivityData. The R package dplyr is required but the code will automatically laod it if you do not have hte package installed.

### Data Sets Created

The activitydata dataset has every record of data recorded from the study, with training and test data combined. The measurements included were all mean and standard deviation measurements. The key columns are:
*Subject - The numeric identifier of the test subject (there were 30 people in the study)
*ActivityDescription - the description of the activity the person was doing at the time of measurement (walking, standing etc)

The SummarisedActivityData dataset summarises the average of the mean and standard deviation measurements by Subject and ActivityDescription.

