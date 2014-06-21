## Readme for Run Analysis script
The purpose of this script is to create a tidy data set from the raw data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The raw data contains data collected from accelerometers from the Samsung Galaxy S smartphone. This phone was attached to 30 subjects who were asked to do various
activities like WALKING, WALKING_UPSTAIRS, STANDING etc. 2 sets of the data are present: some subjects contributed to training data and remaining contributed to test data

The instructions provided to tidy the data and the steps undertaken to achieve this are indicated below:

1. Merges the training and the test sets to create one data set.
	rbind command was used to create a data frame by merging the training (X_train.txt -> 7352 observations of 561 variables) and test data sets (X_test.txt -> 2947 observations of 561 variables) of X to create
	10299 observations of 561 variables

2. Extracts only the measurements on the mean and standard deviation for each measurement.
	- Features are provided in the "features.txt" file in the input zip file.
	- These feature names are assigned as column names to the data frame created in Step 1 above
	- The names contain special characters like '(' and ')', these were removed using 'gsub' command to make the names more understandable
	- It is noticed that column names of all the mean values and standard deviation values have "mean" and "std" as a pattern in the column names
	- To extract only the mean and standard deviation columns, the data frame is subset using grep command so that only column names having "mean" and "std" are present in the output data frame
 
3. Uses descriptive activity names to name the activities in the data set
	- This has been mentioned in Step 2 above. Feature names are used to create the column names in the data frame

4. Appropriately labels the data set with descriptive variable names.
	- The Activities are mentioned as indices in the training (Y_train.txt) and test (Y_test.txt) data sets of Y in the input zip file
	- The two data sets are merged using rbind command
	- The indices are replaced by actual Activity Names by using sapply command
	- The Activity names are merged with the data frame created in Step 2 by using cbind command

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	- reshape2 library commands 'melt' and 'acast' are used to melt the data frame and create the average of each mean and standard deviation for each subject and activity
	- First, the data is melted according to 'Subject' and 'Activity' columns
	- Second, acast command is used to find the average.
	- Finally, the subjects information is merged with the output data frame to make it more readable
	- The output data frame is written to a files


	