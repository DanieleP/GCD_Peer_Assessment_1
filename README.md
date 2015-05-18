# Getting and Cleaning Data Course Project

## Introduction
The purpose of this project is to elaborate and tidy up a dataset 
on [Human Activity Recognition Using Smartphones] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description of the variables can be found in the [CodeBook] (https://github.com/DanieleP/GCD_Peer_Assessment_1/blob/master/CodeBook.md)

[Here] (https://github.com/DanieleP/GCD_Peer_Assessment_1/blob/master/run_analysis.R) you can find the full script that elaborates and tides the dataset.

## Run Analysis Script
Run Analysis Script does the following:  
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for 
each activity and each subject.

### Script specifics
#### Merges the training and the test sets to create one data set
At first run_analysis.R loads the dplyr package and reads all the documents needed for
the final output.

	require(dplyr)
	activity_labels <- read.table ("./UCI HAR Dataset/activity_labels.txt")
	features <- readLines ("./UCI HAR Dataset/features.txt")
	ytest <- read.table ("./UCI HAR Dataset/test/y_test.txt")
	ytrain <- read.table ("./UCI HAR Dataset/train/y_train.txt")
	subject_test <- read.table ("./UCI HAR Dataset/test/subject_test.txt")
	subject_train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")
	Xtest <- read.table ("./UCI HAR Dataset/test/X_test.txt")
	Xtrain <- read.table ("./UCI HAR Dataset/train/X_train.txt")
	
Then it merges the Xtest by column with ytest and subject test, Xtrain by column with
ytrain and subject train, and finally merges the two datasets by row.
The final data.frame is then ordered by Subject and by Activity.

	XtestFormatted <- cbind(subject_test, ytest, Xtest)
	XtrainFormatted <- cbind(subject_train,ytrain,Xtrain)
	RawOutput <- rbind(XtestFormatted,XtrainFormatted)
	colnames(RawOutput) <- c("Subject","Activity", features)
	Output <- arrange(RawOutput,Subject, Activity)

#### Extracts only the measurements on the mean and standard deviation for each measurement
run_analysis finds the variables with "std" or "mean" in the label, looking into features
document that contains the variables' names. Filter contains the indexes of all the
variables containing "mean" and "std", and excludes the variables containing "meanFreq".
Output is the new data.frame that extracts only the measurements on the mean and std.

	MeanStd <- grep("mean|std",features)
	NoMeanFreq <- grep("meanFreq",features)
	Filter <- setdiff(MeanStd,NoMeanFreq)
	Filter <- Filter + 2
	Output <- select(Output,1:2,Filter)	
	
#### Uses descriptive activity names to name the activities in the data set
Activity column is converted in character and replaced by the activity names contained
in activity_labels.txt.	
	
	Output$Activity <- as.character(Output$Activity)
	activity_labels <- as.vector(activity_labels[,2])
	for (i in 1:6){
	    Output$Activity[Output$Activity == i] <- activity_labels[i]
	}

#### Appropriately labels the data set with descriptive variable names
The following script edits the variables' labels. It removes brackets, numbers, replaces 
symbols and shortenings with descriptive nouns.

	names(Output)<-gsub("\\()","",names(Output))
	names(Output)<-gsub("-"," ",names(Output))
	names(Output)<-gsub("mean","Mean",names(Output))
	names(Output)<-gsub("correlation","Correlation",names(Output))
	names(Output)<-gsub(" std"," Standard Deviation",names(Output))
	names(Output)<-gsub(" t", "Time", names(Output))
	names(Output)<-gsub(" f", "Frequency", names(Output))
	names(Output)<-gsub("([Aa]cc)", "Acceleration", names(Output))
	names(Output)<-gsub("([Mm]ag)", "Magnitude", names(Output))
	names(Output)<-gsub("(gravity)","Gravity",names(Output))
	names(Output)<-gsub("([Gg]yro)", "Gyroscope", names(Output))
	names(Output)<-gsub("BodyBody","Body",names(Output))
	names(Output)<-gsub("[0-9]", "", names(Output))

#### Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
To generate the new data.frame, run_analysis uses the dplyr package's aggregate
function, that combines Subjects and Activities and calculates their mean on each variable.

	Output2 <- aggregate(. ~Subject + Activity, Output, mean)
	Output2 <- arrange(Output2, Subject, Activity)
	
### Data export
Output from step 5 is exported into step5output.txt.

	write.table(Output2, file = "step5output.txt", row.names = FALSE)
