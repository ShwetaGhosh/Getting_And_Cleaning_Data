# set the working directory to the folder conatining the data sets and the r script
setwd("~/Downloads/Coursera_selfstudy/Getting_And_Cleaning_Data/Project")
# unzip the data sets
# install required packages :- reshape2 and data.table
library(data.table)
library(reshape2)

# load test data set
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test = read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test = read.table("./UCI HAR Dataset/test/y_test.txt")
# load training data set
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train = read.table("./UCI HAR Dataset/train/y_train.txt")

## Read all activities and their names and label the aproppriate columns
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=c("activity_id","activity_name"))

## Read the dataframe's column names
features <- read.table("./UCI HAR Dataset/features.txt", col.names=c("feature_id","feature_names"))
feature_names <- features[,2]

colnames(X_test) <- feature_names
colnames(X_train) <- feature_names
colnames(Y_test) <- "activity_id"
colnames(Y_train) <-"activity_id"
colnames(subject_test) <- "subject_id"
colnames(subject_train) <- "subject_id"

# combining all test data subjects ids, activity ids and data set in one dataframe
test_data <- cbind(subject_test,Y_test,X_test)

# combining all training data subjects ids, activity ids and data set in one dataframe
training_data <- cbind(subject_train,Y_train,X_train)

# combining test data and training data frames into one
total_data <- rbind(training_data,test_data)

# extracting column indexs containing only mean and standard deviation data
mean_std_col_idx<-  grep("mean|std",names(total_data),ignore.case=TRUE)
mean_std_col_names <- names(total_data)[mean_std_col_idx]

# extracting total data having only mean and std values
total_data <- total_data[,c("subject_id","activity_id",mean_std_col_names)]

#Using descriptive activity names to name the activities in the data set
merged_data <- merge(total_data,activity_labels,by.x = "activity_id",by.y="activity_id",all=TRUE)

# create a file with the new merged dataset
write.table(merged_data,"./merged_data.txt", row.names=FALSE,col.names=TRUE,sep=" ")

##Melt the dataset with the descriptive activity names for better handling
melt_data <- melt(merged_data,id=c("activity_id","activity_name","subject_id"))
##Cast the melted dataset according to the average of each variable
##for each activity and each subject
tidy_mean_data <- dcast(melt_data,activity_id + activity_name + subject_id ~ variable,mean)

## Create a file with the new tidy dataset
write.table(tidy_mean_data,"./tidy_data.txt",row.names=FALSE,col.names=TRUE,sep=" ")


  

