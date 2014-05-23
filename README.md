##run_analysis.R

The script run_analysis.R reads in the data provided in the files X_test.txt, y_test.txt, X_train.txt, y_train.txt, subject_test.txt, subject_train.txt, features.txt, and activity_labels.txt, renames the numbers y_train and y_test to their corresponding activities from activity_labels, and fixes the column names that correspond to the variables in X_test, X_train. It selects the variables that correspond with mean and standard deviation from X_test and X_train, and averages them over the subjects and activities to return a final tidy data set in tidyData.txt.

To run the R script, the files X_test,y_test, and subject_test should be in a subfolder named test to the working directory. X_train, y_train, and subject_train should also be in a subfolder named train to the working directory. The files features and activity_labels should be in the working directory. The working directory will need to be adjusted accordingly at the beginning of the code. 

What the script returns is a table in tidyData.txt that is composed of 180 rows and 68 columns. The data in these rows and columns represent the means of the variables in the column title with respect to the subjects and activities in the rows. 

The dataset uses the following files:
===========================================

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt','test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The script produces the following files:
===========================================
- 'tidyData.txt': A dataset that is comprised of 180 rows and 68 columns, with each cell representing the average of the column variable and the row subject/activity.