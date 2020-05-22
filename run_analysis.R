a <- rbind(test,train)
b <- rbind(testactivs, trainactivs)
subjects <- rbind(subject_test, subject_train)
alldata <- cbind(subjects, a, b)

dataextract <- alldata %>% select(subject, activityid, contains("mean"), contains("std"))

dataextract$activityid <- activs[dataextract$activityid, 2]

names(dataextract) <- tolower(names(dataextract))
dataextract <- rename(dataextract, activity = activityid)
names(dataextract)<-gsub("acc", "accelerometer", names(dataextract))
names(dataextract)<-gsub("gyro", "gyroscope", names(dataextract))
names(dataextract)<-gsub("bodybody", "body", names(dataextract))
names(dataextract)<-gsub("mag", "magnitude", names(dataextract))
names(dataextract)<-gsub("^t", "time", names(dataextract))
names(dataextract)<-gsub("^f", "frequency", names(dataextract))

tidydata <- dataextract %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

write.table(tidydata, "tidydata.txt", row.names = FALSE)
