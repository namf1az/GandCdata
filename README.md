GandCdata
=========

Contains final project for "Getting and Cleaning Data"

The script "run_analysis.R" takes a single argument which is the location of the directory "UCI HAR Dataset" that's created by
"unzipping" the file located at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". For
example, here's the sequence:

	1) Download https://d3...zip to x.zip
	2) unzip x.zip
	3) source("run_analysis.R")
	4) run_analysis("UCI HAR Dataset")
	5) The output file "project.txt" is created and contains the results

The columns in project.txt are:

	"subject" "activity" "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" "tBodyAcc-std()-Y"
	"tBodyAcc-std()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tGravityAcc-std()-X"
	"tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z"
	"tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y"
	"tBodyGyro-mean()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-mean()-X"
	"tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y"
	"tBodyGyroJerk-std()-Z" "tBodyAccMag-mean()" "tBodyAccMag-std()" "tGravityAccMag-mean()" "tGravityAccMag-std()"
	"tBodyAccJerkMag-mean()" "tBodyAccJerkMag-std()" "tBodyGyroMag-mean()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-mean()"
	"tBodyGyroJerkMag-std()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAcc-std()-X"
	"fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z"
	"fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y"
	"fBodyGyro-mean()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyAccMag-mean()"
	"fBodyAccMag-std()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-mean()"
	"fBodyBodyGyroMag-std()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

Aside from the first and second columns which are the subject identifier (1 - 30) and the activity being performed
(WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING), the remaining columns are "features" and
described in the file "features_info.txt.

Here's the header and first row from "project.txt:

	"subject" "activity" "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" "tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" "tBodyAccMag-mean()" "tBodyAccMag-std()" "tGravityAccMag-mean()" "tGravityAccMag-std()" "tBodyAccJerkMag-mean()" "tBodyAccJerkMag-std()" "tBodyGyroMag-mean()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-mean()" "tBodyGyroJerkMag-std()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" "fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyAccMag-mean()" "fBodyAccMag-std()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroMag-std()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"
	"1" "STANDING" "0.278917629056604" "-0.0161375901037736" "-0.110601817735849" "-0.995759901509434" "-0.973190056415094" "-0.979775876981132" "0.942952000377358" "-0.272983832264151" "0.0134905823226415" "-0.99376298509434" "-0.981225957924528" "-0.976324063584906" "0.0753766542264151" "0.00797573092830189" "-0.00368524954709434" "-0.994604542264151" "-0.98564873245283" "-0.992251177358491" "-0.0239877347979245" "-0.0593972209811321" "0.074800751" "-0.987191946603774" "-0.98773444" "-0.980645626981132" "-0.0996092129056604" "-0.0440627877924528" "-0.0489505466716981" "-0.992945106981132" "-0.995137917358491" "-0.992108467169811" "-0.984278207358491" "-0.981942928867925" "-0.984278207358491" "-0.981942928867925" "-0.992367790566038" "-0.993096209433962" "-0.976493792830189" "-0.978690028679245" "-0.994966790566038" "-0.994733238679245" "-0.995249932641509" "-0.977070847735849" "-0.985297098679245" "-0.99602834509434" "-0.972293102075472" "-0.977937259622642" "-0.994630797358491" "-0.985418704528302" "-0.990752166037736" "-0.995073759245283" "-0.987018226792453" "-0.992349818113208" "-0.986386786037736" "-0.988984455849057" "-0.980773122830189" "-0.987497128679245" "-0.987107727735849" "-0.98234533" "-0.985356361132075" "-0.982313804716981" "-0.99254247754717" "-0.992536003396226" "-0.984617623396226" "-0.978466072075472" "-0.994815376981132" "-0.994671123207547"

Here's some more background on the column data:

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person
	performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
	(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear
	acceleration and 3-axial angular velocity at a constant rate of 50Hz.

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in
	fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which
	has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration
	and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz
	cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time
	and frequency domain.
