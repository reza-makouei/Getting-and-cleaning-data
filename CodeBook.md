Getting-and-cleaning-data
=========================

Reza Makouei - 22/06/2014  

=========================

## Tidy Data (tidydata.txt)
The tidydata.txt includes the mean of each variable for each subject and each activity.  
- Data is loaded from the given data set
- test and train data are merged using rbind to build a full dataset
- mean() and std() related features are selected using grep() function, checking if the feature name includes the patterns 'mean()' or 'std()'. 
- labels are loaded for the activities.
- data is melted to create wide dataset by activity by subject
- data is casted to create a tidy data showing the average of each variabe for each subject and each activity


## R Script (run_analysis.R)
Includes the run_analysis() function which loads the data and runs the transformation process. All data files are assumed to be in the working directory.
