# Description
This R code collects and summarises data from a movement study of 30 people using their smartphones. 6 activities (waling, standing etc) are identified and measurements such as acceleration and rotation were recorded.

## Files Used
  *activity_labels.txt - a file that links the activity numeric identifier (1-6) with its description (ex walking, standing)
  *features.txt - a file that provides the column names for the test and training data by describing the measurements
  *subject_train - a file which lists the subject for each record in the training data
  *subject_test - a file which lists the subject for each record in the test data
  *X_train - a file with the measurements from each record in the training data
  *X_test - a file with the measurements from each record in the test data
  *y_train - a file with the activity numeric identifier for each record in the training data
  *y_test - a file with the activity numeric identifier for each record in the test data
  
## steps in the code

1. Load dplyr package, create a temporary directory to store the zip file, pull the file from the file url and then unzip the file.
2. Read the text files as tables and then merge the training and test data. 
3. Use the labels and features files to give descriptions to the activities and column names to the X data. Renames columns without names to provide descriptions of what is in the columns.
4. Take only the columns from the dataset that include "-mean()" and "-std()". 
5. Combine the X, y and subject datasets to create the full activity dataset. 
6. Summarise the activity dataset by taking the average of each measure, grouped by Subject and ActivityDescription
7. Create csv files of the activity dataset and the summarised activity dataset
