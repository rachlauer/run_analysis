# You should create one R script called run_analysis.R that does the following. 

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. Creates a second, independent tidy data set with the average of each variable for 
#   each activity and each subject. 

#Step 1: Merge the training ("X_train.txt") and test ("X_test.txt") sets to create one data set.
#Both datasets are containted in a folder called "UCI HAR Dataset"

#Download zip file from:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#test and train sets hold the values for the 561 feature vector created with time and frequency domain variables
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
#test_label indicates for each row   in "test" what activity took place, i.e, 1 = walking, etc.

train_test_mean_std <- cbtest_label <- read.table("./UCI HAR Dataset/test/y_test.txt")

train <- read.table("./UCI HAR Dataset/train/X_train.txt")
#train_label indicates for each column in "train" what activity took place, i.e, 1 = walking, etc.
train_label <- read.table("./UCI HAR Dataset/train/y_train.txt")

#activity_label reads in the coding of each activity, i.e, 1 = Walking, 2 = walking_upstairs, etc.
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")

#STEP 4:
#assign descriptive activity labels to the test and train dataset
i <- 0
j <- 0
train_activity <-0

for (i in 1:nrow(train)){
  for (j in 1:nrow(activity_label)){
    if (train_label[i,1]==activity_label[j,1]){
      train_activity[i] <- as.character(activity_label[j,2])
    }
    else{
      j=j+1
    }
  }
  i=i+1
}

i <- 0
j <- 0
test_activity <-0

for (i in 1:nrow(test)){
  for (j in 1:nrow(activity_label)){
    if (test_label[i,1]==activity_label[j,1]){
      test_activity[i] <- as.character(activity_label[j,2])
    }
    else{
      j=j+1
    }
  }
  i=i+1
}

#STEP 3
#features is a list of all features
features <- read.table("./UCI HAR Dataset/features.txt")
features <- features[,2] # a list of the variable names for the train_test set


#create row and column headers for test and train datset using "features", "test_activity" and "train_activity"
names(test) <- features
test <- cbind(test_activity, test)
names(test)[1] <- "activity"

names(train) <- features
train <- cbind(train_activity, train)
names(train)[1] <- "activity"

#bind train and test sets 
train_test <- rbind(train, test)

#STEP 2:
#Keep only the measurements on the mean and std for each measurement
#tag the headers with mean() or std()
train_test_mean <- train_test[,grep("mean()", colnames(train_test))]
#remove columns with meanFreq
train_test_mean <- train_test_mean[,grep("meanFreq()", colnames(train_test_mean), invert=TRUE)]
train_test_std <- train_test[,grep("std()",colnames(train_test))]

#bind mean and std columns
train_test_mean_std <- cbind(train_test_mean, train_test_std)

#PART 5:

#Subject numbers for each row in train_X
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train) <- "subject"
train <- cbind(subject_train, train)

#Subject numbers for each row in test_X
subject_test <-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test) <- "subject"
test <- cbind(subject_test, test)

#bind train and test sets with the subject column
train_test <- rbind(train, test)                      
train_test_sub <- cbind(train_test_sub, train_test_mean_std)

#An independent tidy data set with the average of each variable for each activity and each subject.
mean_std_agg <- aggregate(. ~ subject + activity, data=train_test_sub, FUN=mean)
