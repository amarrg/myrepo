#Read the x training data, there is no header
dtrainx <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)

#Read the y training data, there is no header
dtrainy <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE)

#Read the subject data for training
dtrainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

#Read the subject data for test
dtestsub <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)

#Read the x test data, there is no header
dtestx <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)

#Read the y test data, there is no header
dtesty <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE)

#Read the feature variables
df <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

#Read the activity labels
dact <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

#Merge the rows of training and testing data for X -> Point 1 of the instruction
dmerx <- rbind(dtrainx, dtestx)

#Remove the bracket characters from the feature variable names
#Make the feature variables as the column names of the merged data
colnames(dmerx) <- gsub("\\(\\)", "", df[,2])

#Extract only the columns containing the mean and standard deviation of the data
# -> Point 2 of the instruction
dext <- dmerx[,grep("mean|std",colnames(dmerx))]

#Merge the rows of training and testing data for Y, these contain the activities
dmery <- rbind(dtrainy,dtesty)

#Rename the column of the merged data as Activity
colnames(dmery) <- c("Activity")

#Merge the activity names with the merged X data
dmerz <- cbind(dmery,dext)

#The activities are indicated as numbers. For better readability, these
#should be actual activities. Replace all numbers with the appropriate activity names
# -> Point 3 and Point 4 of instruction
s <- dmerz$Activity
sapply(unique(as.character(dact$V1)) , function(i) {
  s[as.character(s) == i] <<- as.character(dact$V2[as.character(dact$V1) == i])
})
dmerz$Activity <- s

#Merge the training and testing subjects data
dsub <- rbind(dtrainsub, dtestsub)

#Name the column as Subject
colnames(dsub) <- c("Subject")

#Merge the subject data with the previous merged data
dfinal <- cbind(dsub,dmerz)

#Load reshape2 library to use melt and acast functions
library(reshape2)

#Melt the data according to Subject and Activity
dfin <- melt(dfinal, id=c("Subject","Activity"))

#Aggregate the data so that average of each mean and SD of data per activtiy
# per subject is calculated
dc <- acast(dfin,Subject ~ Activity ~ variable,mean)

#Remerge the Subject names with data
subjects <- data.frame(1:30)
colnames(subjects) <- c("Subject")
fin <- cbind(subjects,dc)
colnames(fin) <- gsub("\\.t", "-", colnames(fin))

#Write the data to a file
write.table(fin,"./output.txt")