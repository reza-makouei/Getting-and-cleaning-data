run_analysis <- function() {
    # Merge the training and the test sets to create one data set.
    features <- read.table('features.txt')
    activities <- read.table('activity_labels.txt')
    subject_train <- read.table('subject_train.txt')
    subject_test <- read.table('subject_test.txt')
    y_train <- read.table('y_train.txt')
    y_test <- read.table('y_test.txt')
    activities_test <- merge(activities, y_test, by.x = 'V1', by.y = 'V1', all = T)
    activities_train <- merge(activities, y_train, by.x = 'V1', by.y = 'V1', all = T)
    x_train <- read.table('X_train.txt', col.names = features$V2)
    x_test <- read.table('X_test.txt', col.names = features$V2)
    fulldata <- rbind(x_train, x_test)
    
    # Extract only the measurements on the mean and standard deviation for each measurement. 
    mean_index <- grep('mean()', features$V2)
    std_index <- grep('std()', features$V2)
    index <- c(mean_index, std_index)
    data <- fulldata[, index]
    
    # Use descriptive activity names to name the activities in the data set
    labels <- rbind(activities_train, activities_test)
    subjects <- rbind(subject_train, subject_test)
    data$activity <- labels$V2
    data$subject <- subjects$V1
    
    # Appropriately labels the data set with descriptive variable names. 
    # This is done at the time of loading the data
    
    # Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
    library(plyr)
    library(reshape2)
    melted <- melt(data, id.vars = c('activity', 'subject'))
    casted <- dcast(melted, subject + activity ~ variable, mean)    
    
    write.table(casted, 'tidydata.txt')
}
