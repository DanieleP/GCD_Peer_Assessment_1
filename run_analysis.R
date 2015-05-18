## Load libraries
require(dplyr)

## Read text files
activity_labels <- read.table ("./UCI HAR Dataset/activity_labels.txt")
features <- readLines ("./UCI HAR Dataset/features.txt")
ytest <- read.table ("./UCI HAR Dataset/test/y_test.txt")
ytrain <- read.table ("./UCI HAR Dataset/train/y_train.txt")
subject_test <- read.table ("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table ("./UCI HAR Dataset/test/X_test.txt")
Xtrain <- read.table ("./UCI HAR Dataset/train/X_train.txt")

## Pre-process
XtestFormatted <- cbind(subject_test, ytest, Xtest)
XtrainFormatted <- cbind(subject_train,ytrain,Xtrain)

## Merge
XtestFormatted <- cbind(subject_test, ytest, Xtest)
XtrainFormatted <- cbind(subject_train,ytrain,Xtrain)
RawOutput <- rbind(XtestFormatted,XtrainFormatted)
colnames(RawOutput) <- c("Subject","Activity", features)

## Order
Output <- arrange(RawOutput,Subject, Activity)

## Extracts only the measurements on the mean and standard deviation 
## for each measurement
MeanStd <- grep("mean|std",features)
NoMeanFreq <- grep("meanFreq",features)
Filter <- setdiff(MeanStd,NoMeanFreq)
Filter <- Filter + 2
Output <- select(Output,1:2,Filter)

## Uses descriptive activity names to name the activities in the data set
Output$Activity <- as.character(Output$Activity)
activity_labels <- as.vector(activity_labels[,2])
for (i in 1:6){
    Output$Activity[Output$Activity == i] <- activity_labels[i]
}

## Appropriately labels the data set with descriptive variable names.
names(Output)<-gsub("\\()","",names(Output))
names(Output)<-gsub("-"," ",names(Output))
names(Output)<-gsub("mean","Mean",names(Output))
names(Output)<-gsub("correlation","Correlation",names(Output))
names(Output)<-gsub(" std"," Standard Deviation",names(Output))
names(Output)<-gsub("^t", "Time", names(Output))
names(Output)<-gsub("^f", "Frequency", names(Output))
names(Output)<-gsub("([Aa]cc)", "Acceleration", names(Output))
names(Output)<-gsub("([Mm]ag)", "Magnitude", names(Output))
names(Output)<-gsub("(gravity)","Gravity",names(Output))
names(Output)<-gsub("([Gg]yro)", "Gyroscope", names(Output))
names(Output)<-gsub("BodyBody","Body",names(Output))

## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
Output2 <- aggregate(. ~Subject + Activity, Output, mean)
Output2 <- arrange(Output2, Subject, Activity)

## Export Output 2
write.table(Output2, file = "step5output.txt", row.names = FALSE)