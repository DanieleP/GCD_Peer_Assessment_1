# Code Book

## Introduction
This markdown file contains all the information related to the step5output.txt variables.

## Raw data
Raw data has been extracted from the [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following files have been loaded into the script:  
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The variables in these files come from a database of measurement from accelerometer
and gyroscope raw signals. These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Raw data variables:

	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag

Number of subjects in both test and training:  
30

Number of activities:  
6: WALKING - WALKING DOWNSTAIRS - WALKING UPSTAIRS - SITTING - STANDING - LAYING

## Output data in step5output.txt
To generate the tidy dataset, these changes have been applied:  
- train and test datasets have been merged
- subjects and activities have been binded to the X_train/X_test files
- only mean and standard deviation of the measures have been extracted
- variables names have been replaced with more descriptive names
- the dataset contains the mean of each variable for each activity and each subject
- the dataset have been ordered by subject and by activity

The final tidy data set "step5output.txt" contains 180 observations and 68 variables.

#### Observations
Each observation of the dataset is a combination of Subject and Activity (30 Subjects x 6 Activities).

#### Variables
The first two variables are Subject and Activity:  
Subject: an identifier of the subject that did the experiment (1:30)  
Activity: one of the six activities - WALKING - WALKING DOWNSTAIRS - WALKING UPSTAIRS - SITTING - STANDING - LAYING

	 [1] "Subject"                                          
     [2] "Activity"                                         

The remaining 66 variables are mean and standard deviation of all the measures on the 
X-Y-Z axis, splitted in time and frequency:

Measures:  
- BodyAcceleration
- GravityAcceleration
- BodyAccelerationJerk
- BodyGyroscope
- BodyGyroscopeJerk
- BodyAccelerationMagnitude
- GravityAccelerationMagnitude
- BodyAccelerationJerkMagnitude
- BodyGyroscopeMagnitude
- BodyGyroscopeJerkMagnitude
                                           
		 [3] "TimeBodyAcceleration Mean X"                              
		 [4] "TimeBodyAcceleration Mean Y"                              
		 [5] "TimeBodyAcceleration Mean Z"                              
		 [6] "TimeBodyAcceleration Standard Deviation X"                
		 [7] "TimeBodyAcceleration Standard Deviation Y"                
		 [8] "TimeBodyAcceleration Standard Deviation Z"                
		 [9] "TimeGravityAcceleration Mean X"                           
		[10] "TimeGravityAcceleration Mean Y"                           
		[11] "TimeGravityAcceleration Mean Z"                           
		[12] "TimeGravityAcceleration Standard Deviation X"             
		[13] "TimeGravityAcceleration Standard Deviation Y"             
		[14] "TimeGravityAcceleration Standard Deviation Z"             
		[15] "TimeBodyAccelerationJerk Mean X"                          
		[16] "TimeBodyAccelerationJerk Mean Y"                          
		[17] "TimeBodyAccelerationJerk Mean Z"                          
		[18] "TimeBodyAccelerationJerk Standard Deviation X"            
		[19] "TimeBodyAccelerationJerk Standard Deviation Y"            
		[20] "TimeBodyAccelerationJerk Standard Deviation Z"            
		[21] "TimeBodyGyroscope Mean X"                                 
		[22] "TimeBodyGyroscope Mean Y"                                 
		[23] "TimeBodyGyroscope Mean Z"                                 
		[24] "TimeBodyGyroscope Standard Deviation X"                   
		[25] "TimeBodyGyroscope Standard Deviation Y"                   
		[26] "TimeBodyGyroscope Standard Deviation Z"                   
		[27] "TimeBodyGyroscopeJerk Mean X"                             
		[28] "TimeBodyGyroscopeJerk Mean Y"                             
		[29] "TimeBodyGyroscopeJerk Mean Z"                             
		[30] "TimeBodyGyroscopeJerk Standard Deviation X"               
		[31] "TimeBodyGyroscopeJerk Standard Deviation Y"               
		[32] "TimeBodyGyroscopeJerk Standard Deviation Z"               
		[33] "TimeBodyAccelerationMagnitude Mean"                       
		[34] "TimeBodyAccelerationMagnitude Standard Deviation"         
		[35] "TimeGravityAccelerationMagnitude Mean"                    
		[36] "TimeGravityAccelerationMagnitude Standard Deviation"      
		[37] "TimeBodyAccelerationJerkMagnitude Mean"                   
		[38] "TimeBodyAccelerationJerkMagnitude Standard Deviation"     
		[39] "TimeBodyGyroscopeMagnitude Mean"                          
		[40] "TimeBodyGyroscopeMagnitude Standard Deviation"            
		[41] "TimeBodyGyroscopeJerkMagnitude Mean"                      
		[42] "TimeBodyGyroscopeJerkMagnitude Standard Deviation"        
		[43] "FrequencyBodyAcceleration Mean X"                         
		[44] "FrequencyBodyAcceleration Mean Y"                         
		[45] "FrequencyBodyAcceleration Mean Z"                         
		[46] "FrequencyBodyAcceleration Standard Deviation X"           
		[47] "FrequencyBodyAcceleration Standard Deviation Y"           
		[48] "FrequencyBodyAcceleration Standard Deviation Z"           
		[49] "FrequencyBodyAccelerationJerk Mean X"                     
		[50] "FrequencyBodyAccelerationJerk Mean Y"                     
		[51] "FrequencyBodyAccelerationJerk Mean Z"                     
		[52] "FrequencyBodyAccelerationJerk Standard Deviation X"       
		[53] "FrequencyBodyAccelerationJerk Standard Deviation Y"       
		[54] "FrequencyBodyAccelerationJerk Standard Deviation Z"       
		[55] "FrequencyBodyGyroscope Mean X"                            
		[56] "FrequencyBodyGyroscope Mean Y"                            
		[57] "FrequencyBodyGyroscope Mean Z"                            
		[58] "FrequencyBodyGyroscope Standard Deviation X"              
		[59] "FrequencyBodyGyroscope Standard Deviation Y"              
		[60] "FrequencyBodyGyroscope Standard Deviation Z"              
		[61] "FrequencyBodyAccelerationMagnitude Mean"                  
		[62] "FrequencyBodyAccelerationMagnitude Standard Deviation"    
		[63] "FrequencyBodyAccelerationJerkMagnitude Mean"              
		[64] "FrequencyBodyAccelerationJerkMagnitude Standard Deviation"
		[65] "FrequencyBodyGyroscopeMagnitude Mean"                     
		[66] "FrequencyBodyGyroscopeMagnitude Standard Deviation"       
		[67] "FrequencyBodyGyroscopeJerkMagnitude Mean"                 
		[68] "FrequencyBodyGyroscopeJerkMagnitude Standard Deviation"   