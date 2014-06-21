## Description of the tidy data set

The data set consits of:
	1. Hello
	* 30 rows: Each row corresponds to one of the 30 subjects who were subjected to the experimentation
	* 475 columns: Each column indicates the average of either the mean or the standard deviation of one of the features that were measured. More description below

Each column name in the data set is of the form <Activity>-[t/f]<Feature>-[mean/std]-{X/Y/Z} where:
	* <Activity> is one among:
		* LAYING - Data was collected when the subject was laying down
		* SITTING - Data was collected when the subject was sitting
		* STANDING - Data was collected when the subject was standing
		* WALKING - Data was collected when the subject was walking
		* WALKING_DOWNSTAIRS - Data was collected when the subject was walking downstairs
		* WALKING_UPSTAIRS - Data was collected when the subject was walking upstairs
	* [t/f] indicates that either 't' or 'f' is present, where:
		* t means the values are in time domain
		* f means the values are in frequency domain
	* <Feature> is one among:
		* BodyAcc - Data in this column relates to Body Acceleration signal which is obtained by separating the acceleration signal using low pass Butterworth filter with a corner frequency of 0.3 Hz
		* GravityAcc - Data in this column relates to Gravity Acceleration signal which is obtained by separating the acceleration signal using low pass Butterworth filter with a corner frequency of 0.3 Hz
		* BodyAccJerk - Data in this column relates to Jerk signals which are obtained when the the body linear acceleration was derived in time
		* BodyGyro - Data in this column relates to Gyroscope signal
		* BodyGyroJerk - Data in this column relates to Jerk signals of Gyroscope which are obtained when the the angular velocity was derived in time
		* BodyAccMag - Data in this column relates to magnitude of Body Acceleration signal calculated using the Euclidean Norm
		* GravityAccMag - Data in this column relates to magnitude of Gravity Acceleration signal calculated using the Euclidean Norm
		* BodyAccJerkMag - Data in this column relates to magnitude of Jerk Signal for body linear acceleration, calculated using the Euclidean Norm
		* BodyGyroMag - Data in this column relates to magniture of the Gyroscope signal, calculated using the Euclidean Norm
		* BodyGyroJerkMag - Data in this column relates to magnitude of Jerk Signal for Gyroscope, calculated using the Euclidean Norm
	* [mean/std] indicates either 'mean' or 'std' is present, where:
		* mean indicates that the values in the column are averages of the mean of different observations of the concerned signal
		* std indicates that the values in the column are averages of the standard deviation of different observations of the concerned signal
	* {X/Y/Z} is an "optional" pattern (may be missing in some column names) that indicates one among 'X', 'Y' or 'Z' is present, where:
		* X indicates that the column contains signal values measured in the X-axis direction
		* Y indicates that the column contains signal values measured in the Y-axis direction
		* Z indicates that the column contains signal values measured in the Z-axis direction

Some examples of column names as per above definition:
		* LAYING-tBodyAcc-mean-X : indicates that the column contains the mean of the Body Acceleration signal measured in X-axis direction when the subject was LAYING down
		* WALKING_DOWNSTAIRS.fBodyAccMag-std : indicates that the column contains the standard deviation of the magniture of the Body Accelration Signal calculated in the frequency domain. Axis direction is not relevant here


	
