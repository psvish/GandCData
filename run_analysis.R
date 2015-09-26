## run_analysis.R code for G&CData Course Project
## by P S Vishwanath
## Based on downloaded data files in UCI HAR Dataset directory
## under /train and /test folders
library(dplyr)
## read and combine train and test data sets for measurements
train_test <- rbind(read.table("train/X_train.txt", sep = ""), read.table("test/X_test.txt", sep = ""))
## combine subject data sets
subj_tt <- rbind(read.table("train/subject_train.txt", sep = ""), read.table("test/subject_test.txt", sep = ""))
## combine activities data sets
activ_tt <- rbind(read.table("train/y_train.txt", sep = ""), read.table("test/y_test.txt", sep = ""))
## read list of features and use it as colnames for combined data set
features_tt <- read.table("features.txt", sep = "")
## 2nd col has the needed feature names; apply that to the measurements data set
colnames(train_test) <- features_tt[ , 2]
## subset data to get only columns with mean or std values
## selecting only those that have mean() or std() in the names and
## not the ones that might have just 'mean' or 'std' embedded in the name
## as a result, this will give 66 measurement cols
mean_std <- c('mean\\(', 'std\\(')
meanstd_tt <- train_test[,grepl(paste0(mean_std, collapse = "|"), colnames(train_test))]
## add colnames to subjects and activities data
colnames(subj_tt) <- "Test_Subjects"
colnames(activ_tt) <- "Activity_Num"
## replace activity # with descriptive names
### merge() - do NOT use as it reorders while merging
activ_names <- data.frame(Act_Num = 1:6, Activ_Name = c("Walking", "Walking_Up", "Walking_Down", "Sitting", "Standing", "Laying"))
activ_tt <- data.frame(Activity_Name = activ_names$Activ_Name[activ_tt$Activity_Num])
## Change colnames to descriptive variable names
## created a text file with descriptive variable names from
## the original features.txt
## refer to codebook and readme for additional details
Desc_labels <- read.table("Descriptive_Var_Names.txt")
colnames(meanstd_tt) <- Desc_labels[ , 1]
## add the activity and subject data to get complete data set
meanstd_complete <- cbind(subj_tt, activ_tt, meanstd_tt)
## calculate means for each variable [cols 3:68] 
## by activity and subjects [cols 1:2]
tidy_data <- aggregate(meanstd_complete[, 3:68], meanstd_complete[, 1:2], FUN = mean)
tidy_data_final <- write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)