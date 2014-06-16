Below are the steps taken to create the tidy dataset with the average of each variable for each activity and each subject.

1. The test and train dataset were read into R
2. The activity labels (1 through 6) for each row, for both test and train, were read into R.
3. A description of the activity (i.e., walking, standing, etc.) was assigned to the activity labels by looping through each activity label for the train and test
   activity labels. The activity label for each row of the train and test dataset now has an activity assigned to it, the column name for this variable is "activity".
4. The activty was added to the train and test label using the cbind function.
5. The features data was read into R. The features names were used to assign column names to both the train and test datasets.
6. The subject numbers (1 through 30) were read into R for both the train and test set. Each dataset had another column added called "subject" which indicates the subjects
   number.
7. The train and test sets were then combined using rbind.
8. Using the grep function the variables that measured mean and standard deviation (i.e, columns ending in mean() or std() ) were extracted from the
   combined test/train dataset.
9. I then combind the dataset that included only the mean() or std() columns (66 in total) with the activity and subject associated with each row.
   In total there are 68 columns in the dataset and over 10k rows.
10.The dataset described in step 9 was used to create another dataset that took the average of each variable (the variables that measured mean and std) for each 
   activity and each subject. The aggregate function was used. This created a 126 by 68 data frame.