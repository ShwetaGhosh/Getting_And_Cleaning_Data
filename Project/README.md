---
title: "README.md"
author: "ShwetaGhosh"
date: "04/27/2015"
output: html_document
---
This Repository is for the project for Getting and Cleaning Data
It contains the following files
* data.zip : The zip file containing the data set downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* UCI HAR Dataset : The extracted folder containing all data and text files describing the data
* run_analysis.R : The r script to analysis and create a tidy data set
* merged_data.txt & tidy_data.txt : The datasets obtained after running the above script

The original dataset included the following data files found in the UCI HAR Dataset folder:

* 'features.txt': List of all features.

* 'activity_labels.txt': List of class labels and their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'train/subject_train.txt': ID's of subjects in the training data

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'test/subject_test.txt': ID's of subjects in the training data

For how the original data has been converted into a tidy data set please refer to **CodeBook.md**