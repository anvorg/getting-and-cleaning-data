# Unzipped data directory name
home <- "UCI HAR Dataset"


# The following script does the following
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names
# 5. From the data set in step 4, creates a second, independently tidy data set with the average 
#    of each variable for each ativity and each subject.
run_analysis <- function() {
    # Download the raw data files
    download_files()
    
    # Merges the training and the test sets to create one data set
    data_features_names <- read.table(file.path(home, "features.txt"), header = FALSE)
    data <- get_merged_data(data_features_names)
    
    # Extracts only the measurements on the mean and standard deviation for each measurement
    data <- subset_mean_std_deviation(data, data_features_names)
    
    # Uses descriptive activity names to name the activities variable names
    data <- set_activity_names(data)
    
    # Appropriately labels the data set with descriptive variable names
    data <- set_variable_names(data)
    
    # Creates a second data set with the average of each variable for each activity and each subject
    avg_data <- average_data(data)
    write.table(avg_data, file = "activity_data.txt", row.names = FALSE)
    
    message("done!")
    message("the result data can be found at 'activity_names.txt'")
    
    # for Code book
    write(names(avg_data), file = "activity_names.txt", ncolumns = 1)
}

# Download and unzip data files used to run the analysis
download_files <- function() {
    if (!file.exists(home)) {
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        path <- file.path(getwd(), "run_analysis_data.zip")
        download.file(url, path, mode = "wb")
        unzip("run_analysis_data.zip")
    }
}



# Merges all the training and test data in a single data set
get_merged_data <- function(data_features_names) {
    message("read test data")
    data_activity_test <- read.table(file.path(home, "test", "Y_test.txt"), header = FALSE)
    data_subject_test <- read.table(file.path(home, "test", "subject_test.txt"), header = FALSE)
    data_features_test <- read.table(file.path(home, "test", "X_test.txt"), header = FALSE)
    
    message("read train data")
    data_activity_train <- read.table(file.path(home, "train", "Y_train.txt"), header = FALSE)
    data_subject_train <- read.table(file.path(home, "train", "subject_train.txt"), header = FALSE)
    data_features_train <- read.table(file.path(home, "train", "X_train.txt"), header = FALSE)
    
    message("concatenate train and test data")
    data_subject <- rbind(data_subject_train, data_subject_test)
    data_activity <- rbind(data_activity_train, data_activity_test)
    data_features <- rbind(data_features_train, data_features_test)
    
    message("set subject and activity variable names")
    names(data_subject) <- c("subject")
    names(data_activity) <- c("activity")
    names(data_features) <- data_features_names$V2
    
    message("merges all data frames in one")
    temp <- cbind(data_subject, data_activity)
    data <- cbind(temp, data_features)

    data
}



# Subset the original data set to consider only the mean and standard deviation measures
subset_mean_std_deviation <- function(data, data_features_names) {
    message("filter mean and standard deviation features")
    relevant_var_names <- data_features_names$V2[grep(".*-mean.*|.*-std.*", data_features_names$V2)]
    selected_names <- c("subject", "activity", as.character(relevant_var_names))
    subset_data <- subset(data, select = selected_names)
    
    subset_data
}



# Substitute the activity numbers by its correspondents labels
set_activity_names <- function(data) {
    message("read activity labels")
    activity_labels <- read.table(file.path(home, "activity_labels.txt"), header = FALSE)

    message("substitute the activity ids for its labels")    
    id = 1
    for (activity in activity_labels$V2) {
        data$activity <- gsub(id, activity, data$activity)
        id <- id + 1
    }
    
    data   
}


# Changes the variable names with more readable ones
set_variable_names <- function(data) {
    message("improve variable names")
    names(data) <- gsub("^t", "time", names(data))
    names(data) <- gsub("^f", "frequency", names(data))
    names(data) <- gsub("Acc", "Acceleration", names(data))
    names(data) <- gsub("Gyro", "AngularVelocity", names(data))
    names(data) <- gsub("Mag", "Magnitude", names(data))
    names(data) <- gsub("BodyBody", "Body", names(data))

    data
}


# Average each measure for each subject and activity
average_data <- function(data) {
    message("average the measures for each subject and activity")
    avg_data <- aggregate(. ~subject + activity, data, mean)
    avg_data <- avg_data[order(avg_data$subject, avg_data$activity),]
    avg_data
}