
Code Book
=========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip . Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The attached R script (run_analysis.R) performs the following to clean up the data:


1. Merges the training and test sets to create one data set, namely:
A function(assemble_data) was created to merge the files associated with “test” and “train” and avoid moving files or repetitive  entry of file paths.  This function returns a data frame combining “y”(activity IDs), “subject”(subject IDs), and “x”(data) for test and train with feature names for the data attached. 

Two data frames were created with the “assemble_data” function:
test_set with 2947 observations and 563 variables
train_set with 7352 observations and 563 variables

These two data frames were then merged to create one data set (dat) with 10299 observations and 563 variables.



2.  Extracts only the measurements on the mean and standard deviation for each measurement.
The result is a 10299 x 68 data frame, because only 66 out of 561 data (x) attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).


3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
walking
walkingupstairs
walkingdownstairs
sitting
standing
laying


4. The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.

The result is saved as merged_data.csv, a 10299x68 data frame such that the first column contains activity names, the second column subject IDs, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. Names of the measurements are similar to the following:
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y



5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.
The result is saved as “tidy_SamsungDS_Coursera.txt” or “tidy_SamsungDS_Coursera.csv”, a 180x68 data frame, where as before, the first column contains activity names(see point 3 above), the second column contains subject IDs, and then the averages for each of the 66 measurements are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.
