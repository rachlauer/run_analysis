Code Book for the Project in the course "Getting and Cleaning Data"

Please see the "README" file in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for description of the 
datasets read into "run_analysis.R".

VARIABLES:
test - test data that holds the values of the 561 "feature" vectors created with time and fequency domain variables

test_label - indicates for each row in "test" what activity took place, i.e., walking, sitting, etc. - numeric values between 1 and 6

train - train data that holds the values of the 561 "features" vectors created with time and fequency domain variables

train_label - indicates for each row in "train" what activity took place, i.e., walking, sitting, etc. - numeric values between 1 and 6

activity_label - the numeric value (1 through 6) and the activity representing that values (i.e., 1=walking, 2=walking_upstairs)

subject_train - indicator of which subject (1 through 30) is associated with the row in the dataset train

subject_test - indicator of which subject (1 through 30) is associated with the row in the dataset test

test_activity - joins the test set with the activity_label and test_label - the test set now has one more column which indicates which activity took place
                in the row
train_activity - joins the train set with the activity_label and train_label- the train set now has one more column which indicates which activity took 
		 place in the row

features - the names of all 561 features 


train_test - combination of "train_label" and "test_lable" sets. This set contains 10299 rows and 563 columns which includes column headers (i.e., features),
	     a column that indicates the activity and a column that indicated the subject (1 through 30) associated with that row.

train_test_mean - keeps only the columns of train_test where the mean was calculated

train_test_std - keeps only the columns of train_test where the standard deviation was calculated

train_test_sub - activty and subject columns


DATA:
The data created is as follows:
1. train_test - Data from the train and test datasets along with the activities and subject associated with each row. Column names of this dataset are the features.
2. train_test_mean_std - Data extracted from the train_test. The data includes only the columns that whose features took the measurements on the mean and
   standard deviation for each measurement. Included are the activity and subject columns.
3. mean_std_agg - Independent tidy data set with the average of each variable for each activity and each subject. This dataset is 180 rows by 68 columns. 
  	 	  Each row takes the mean of each column based on an activity and subject.