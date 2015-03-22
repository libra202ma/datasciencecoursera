##The assignment is to write a script 'run_analysis.R' to generate a tidy data set of the average values. 

## What does 'run_analysis.R do':
* Line 1-8: read in X,Y,subject data using read.table() function.
* Line 10-13: combine training and test data together using rbind() function.
* Line 15-20: extract features of "mean()" and "std()" in variable names using grep() function, and extract these columns out, name it "X_ext". I decided that this way the extracted columns are the ones which are measurements of the mean and std, instead of just extract features including "mean" and "std". The selected column index are stored in the "choice" vector.
* Line 22-23: set the name of the variables of the selected data to the feature with the same index from the "choice" vector.
* Line 25-31: Add descriptive activity names and Subject ID to X_ext. I take descriptive activity names as in the file "activity_lables.txt". Add Y data and subject ID as 2 new columns to the left of X_ext. Merge the activity lables with X_ext to attach the discriptive names of activity to the data. Delete the Y data collumn after the merge. Name the first column "Activity".
* Line 33-35: melt the data into tall skiny data set of "Activity" and "Subject.ID" vs. all measurements. dcast the melted dataset and calculate mean, resulted the desired final tidy data set cleanMean.
* Line 37-38: write the resulted cleanMean into txt file using write.table() function.


##The resulted tidy data set of the cleanMean is in the file "clean_mean.txt".

##The code book is "Code Book.md".
