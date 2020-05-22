# CodeBook

The dataset (tidydata.txt) included in the repo has the average for means and standard deviations of all measurements collected with the accelerometers obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

All the data was read into R and then prepared with the run_analysis.R script detailed below

# Merge data

a is an object that includes the measuments data of all subjects 

b is an object that includes the activity IDs of all subjects 

subjects is an object that includes the IDs of all subjects 
alldata merges a, b and subjects into one complete dataset

# Extract mean and standard deviation

dataextract is an object that includes all columns from alldata that have "mean" and "std" in their names. It also includes the subjects and the activity IDs

# Replace activity IDs with activity names

The activity IDs are replaced with their corresponding names as seen in the activity_labels.txt included in the downloaded data

# Label the dataset

All names were set to lower case and expanded as follows:

"acc" to "accelerometer"

"gyro" to "gyroscope"

"bodybody" to "body"

"mag" to "magnitude"

If it started with a "t" then set to "time"

If it started with an "f" then set to "frequency"

# Create a tidy dataset with the average of each variable for each activity

tidydata is an object that includes the data grouped by subject and activity and summarised by mean of each activity
