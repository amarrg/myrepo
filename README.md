## Readme for Run Analysis script
The purpose of this script is to create a tidy data set from the raw data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The raw data contains data collected from accelerometers from the Samsung Galaxy S smartphone. This phone was attached to 30 subjects who were asked to do various
activities like WALKING, WALKING_UPSTAIRS, STANDING etc. 2 sets of the data are present: some subjects contributed to training data and remaining contributed to test data

The instructions provided to tidy the data and the steps undertaken to achieve this are indicated below:

1. Merges the training and the test sets to create one data set.
	rbind command was used to merge the training (7352 observations of 561 variables) and test data sets (2947 observations of 561 variables) to create
	10299 observations of 561 variables

2. Extracts only the measurements on the mean and standard deviation for each measurement.
	- Activity names are provided in the "activity_labels.txt" file in the input zip file. 
	- These activity names are assigned as column names to the merged data created in Step 1 above
	- The names contain special characters like '(' and ')', these were removed using 'gsub' command to make the names more understandable
	- It is noticed that column names of all the mean values and standard deviation values have "mean" and "std" as a pattern in the column names

