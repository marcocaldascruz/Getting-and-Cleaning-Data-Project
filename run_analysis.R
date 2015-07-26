# Load the Features Table.
features <- read.table("features.txt")

# Make the vector with only the std/mean values.
features_columns_selected <- grep("std|mean", features[,2])
features_names <- features[features_columns_selected, 2]

# Load the Activities Labels.
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(act_labels) <- c("ActivityId", "ActivityName")

# Load the Train Measure Data with only the features selected.
# Load the Activities asociated of the Train Set.
# Load Subjects.
train_mea_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_mea_data <- train_mea_data[,features_columns_selected]
train_act_data <- read.table("UCI HAR Dataset/train/y_train.txt")
train_sbj_data <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load the Test Measure Data with only the features selected.
# Load the Activities asociated of the Test Set.
# Load Subjects.
test_mea_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_mea_data <- test_mea_data[,features_columns_selected]
test_act_data <- read.table("UCI HAR Dataset/test/y_test.txt")
test_sbj_data <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Make the full Data.
vector_measure <- rbind(train_mea_data, test_mea_data)
vector_activity <- rbind(train_act_data, test_act_data)
vector_subject <- rbind(train_sbj_data, test_sbj_data)

# Names.
colnames(vector_measure) <- features_names
colnames(vector_activity) <- c("ActivityId")
colnames(vector_subject) <- c("SubjectId")

# Merge train_data with test_data
full_data <- data.frame(vector_measure, vector_activity, vector_subject)
# Tidy Data (group by Activity Id, SubjectId)
tidy_data <- aggregate(full_data, FUN=mean, by=list(full_data$ActivityId, full_data$SubjectId))

# Prepare the Final Presentation
final_full_data <- merge(full_data, act_labels, by="ActivityId")
final_tidy_data <- merge(tidy_data, act_labels, by="ActivityId")
final_full_data$ActivityName <- as.character(final_full_data$ActivityName)
final_tidy_data$ActivityName <- as.character(final_tidy_data$ActivityName)

# Output File.
write.table(final_tidy_data, file = "tidy_data.txt", row.names=FALSE)
