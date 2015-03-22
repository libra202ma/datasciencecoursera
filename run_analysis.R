##read data
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt")

##combine train and test data
xdata <- rbind(xtrain,xtest)
ydata <- rbind(ytrain,ytest)
subdata <- rbind(subtrain,subtest)

##extract mean and standard deviation measurement
features <- read.table("UCI HAR Dataset/features.txt")
choice1 <- grep("mean\\(\\)",features$V2)
choice2 <- grep("std\\(\\)",features$V2)
choice <- sort(c(choice1,choice2))
X_ext <- xdata[,choice]

##set variable names
names(X_ext)<-features$V2[choice]

##add descriptive activity names
actlable <- read.table("UCI HAR Dataset/activity_labels.txt")
X_ext <- cbind(ydata,subdata,X_ext)
names(X_ext)[2] <- "Subject.ID"
X_ext <- merge(actlable,X_ext,by="V1")
X_ext <- X_ext[,2:ncol(X_ext)]
names(X_ext)[1]<-"Activity"

##reshape and calculate the mean
cleanMelt <- melt(X_ext,id=c("Activity","Subject.ID"), measure.vars = names(X_ext)[3:ncol(X_ext)])
cleanMean <- dcast(cleanMelt, Activity + Subject.ID ~ variable,mean)

##write resulted cleanMean into file
write.table(cleanMean,file="clean_mean.txt",row.name=FALSE)

