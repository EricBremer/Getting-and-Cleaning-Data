### Zip file containing data was downloaded from:
if(!file.exists("data")) {dir.create("data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./data/UCI HAR Dataset.zip", method="curl")
dateDownloaded <- date()

### It was unzipped in a "data" subdirectory of the working directory
list.files("./data")

require(plyr)
library('plyr') 


### A function to assemble x, y, and subject files for either the test or training data
data_assemble <- function(test_or_train = "test"){
        ## Merge X, Y, and subject from folder_path
        ## Argument is test or train(test is default)
        ## Returns a data frame
        
        tt <- test_or_train
        folder_name <- "./data/UCI HAR Dataset/"
        X_path <- paste0(folder_name, tt, "/X_", tt, ".txt")
        y_path <- paste0(folder_name, tt, "/y_", tt, ".txt")
        subject_path <-paste0(folder_name, tt, "/subject_", tt, ".txt")
        
        X <- read.table(X_path, header = F)
        y <- read.table(y_path, header = F,  sep = " ")
        
        subject <- read.table(subject_path, header = F,  sep=" ")
        colnames(subject) <- "subject"
        
        x_colnames <-
                read.csv2(paste0(folder_name, "features.txt"), sep=" ", header = F)
        
        colnames(X) <- x_colnames[, 2]
        colnames(y) <- "y"
        
        return(data.frame(y = y, subject = subject, X))
}

### 1) Merge the training and the test sets to create one data set
test_set <- data_assemble("test")
train_set <- data_assemble("train")
dat <- rbind(test_set, train_set)
dim(dat)
head(dat)
write.csv(dat, file="./data/merged_data.csv")

### Create a second, independent tidy data set with the average of each variable for each activity and each subject.

### 2) Extract the measurements on the mean and standard deviation for each measurement. 
dat_col <- colnames(dat)
idx_mean <- grep("mean[^F]|std", dat_col, ignore.case = T)
dat2 <- dat[, c(1, 2, idx_mean[1:66])]
### colnames(dat2)

dat3 <- ddply(dat2, .(subject, y), function(x){
        unlist(lapply(x, mean, na.rm = T))
})

### 3) Use descriptive activity names to name the activities in the data set
### and 4) Appropriately label the data set with descriptive variable names

### Transform y label to something humanly readable
activity <- read.csv("./data/UCI HAR Dataset/activity_labels.txt",
                     sep = " ", header = F)
dat3$y <- activity[dat3$y, 2]
colnames(dat3)[1] <- "activity"

### 5) A second, independent tidy data set with the average of each variable for each activity and each subject. 
write.csv(dat3, file = "tidy_SamsungDS_Coursera.csv")
## or tab separated .txt file
write.table(dat3, file="tidy_SamsungDS_Coursera.txt", sep="\t")
