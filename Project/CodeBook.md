---
title: "CodeBook"
author: "ShwetaGhosh"
date: "04/27/2015"
---
## Source
Human Activity Recognition Using Smartphones Dataset
Version 1.0 
Data is collected from this [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data
The raw data can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz data were captured, of accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The variables included in the data set are :
- **activity_id**: Identifier, identifying the activity of each subject Type: Integer Values: 1 : 6

- **activity_name** : Descriptive name of each subject's activity Type: Factor Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

- **subject_id** : Identifier, identifying each subject Type: Integer Values: 1 : 30
- **Variable Values**
1. tBodyAcc-XYZ 
2. tGravityAcc-XYZ 
3. tBodyAccJerk-XYZ 
4. tBodyGyro-XYZ 
5. tBodyGyroJerk-XYZ 
6. tBodyAccMag 
7. tGravityAccMag 
8. tBodyAccJerkMag 
9. tBodyGyroMag 
10. tBodyGyroJerkMag 
11. fBodyAcc-XYZ 
12. fBodyAccJerk-XYZ 
13. fBodyGyro-XYZ 
14. fBodyAccMag 
15. fBodyAccJerkMag 
16. fBodyGyroMag 
17. fBodyGyroJerkMag

* **angle()**: Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

1. gravityMean 
2. tBodyAccMean 
3. tBodyAccJerkMean 
4. tBodyGyroMean 
5. tBodyGyroJerkMean

Feature Vector variables:

- **mean()** : mean values of multiple measurements of the original variables. Type: Real number

- **std()**: Standard deviation of multiple measurements of the original variables. Type: Real number

## Data analysis and code flow
Below is a list of the operations done to achieve the outputs.
1. Downloaded the data set
2. Unzipped the data set into my chosen working directory
3. Loaded test and training data sets into data frames
4. Loaded source variable names for test and training data sets
5. Loaded activity labels
6. Combined the data frames to produce one data frame for test and training data containing the subjects, measurements and activities using cbind
7. Combined test and training data frames using rbind
8. Extracted the data frames to only include the mean and standard deviation variables
9. Merged data frames to add activity IDs with the activity labels information for readability and the data is written to the **"merged_data.txt"** file
10. Lastly, with the help of the "melt" and "dcast" functions of the **"reshape2"** package, the data is converted into a table containing mean values of all the included features, ordered by the activity name and the subject id, and the data is written to the **"tidy_data.txt"** file.
    

*Please refer to **run_analysis.R** for implementation details.*


