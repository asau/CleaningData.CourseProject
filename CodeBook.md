##Code Book
##Methods
* Reading data in
The files X_test.txt, y_test.txt, X_train.txt, y_train.txt, subject_test.txt, subject_train.txt, features.txt, and activity_labels.txt were read into R. The files in the Inertial Signals folders were not read in because they did not seem important towards our final goals. 

*Renaming the Activities
The function RenameActivity takes an input x and checks if it is equal to integers running from 1 through 6. If they correspond with the activity listed in the activity_labels.txt, then it will set x to be the said activity. This function is run through sapply to rename the entire column from numbers to the actual activity names.

*Selecting the variables
The variables chosen in the data frame were the variables with mean and std in the names, as these were the ones requested by the assignment. The variables with meanFreq() were not included because they were not considered to be the means and standard deviations required by the assignment. The function used in selecting the variables was grep. grep finds the indices of the data.frame that corresponds with the string that is requested. The strings mean() and std() were used to match with the strings in each of the column names.

*Forming the test and train data.frames
Merged the subject_train.txt, y_train, X_train, and the same for test respectively into train and test data.frames.

*Removing unwanted characters in the column names
The function gsub was used to remove brackets and dashes in the variable names, and to replace the dashes with period signs. These names, along with "Subject" and "Activity", were then used for the column names in the test and train data frames.

*Merging the test and train data.frames
The data frames were merged using rbind

*Averaging the values into a final tidy data set
Aggregate was used as the function to calculate the mean over the subjects and the activities, resulting in a dataframe with 180 rows and 68 columns, all calculating the averages of each variable.

##Description about the Variables
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals that are included in this tidy dataset are: 

mean(): Mean value
std(): Standard deviation
