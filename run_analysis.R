setwd("/Users/alvinau/Documents/School/Coursera/Cleaning_Data/Course_Project/UCI_HAR_Dataset")

#reading data in test set
subject.test<-read.table("./test/subject_test.txt",sep=" ")
X.test<-read.table("./test/X_test.txt")
y.test<-read.table("./test/y_test.txt")

#reading data in train set
subject.train<-read.table("./train/subject_train.txt",sep=" ")
X.train<-read.table("./train/X_train.txt")
y.train<-read.table("./train/y_train.txt")

#read in features 
features<-read.table("./features.txt")

#read in activity_labels
activity<-read.table("./activity_labels.txt")

#renaming the activity column
RenameActivity<-function(x){
    if(x==1){
        x=activity$V2[1] 
    }else if (x==2){
        x=activity$V2[2] 
    }else if (x==3){
        x=activity$V2[3] 
    }else if (x==4){
        x=activity$V2[4] 
    }else if (x==5){
        x=activity$V2[5] 
    }else{
        x=activity$V2[6] 
    }
}

#applying the renaming function
y.test.renamed<-sapply(y.test[,1],RenameActivity)
y.train.renamed<-sapply(y.train[,1],RenameActivity)

##grabbing the columns with the means and standard deviations
mean.index<-grep("mean()",features[,2],fixed=TRUE)
std.index<-grep("std()",features[,2])
#important columns in X test and X train
X.test.imp<-X.test[,c(mean.index,std.index)]
X.train.imp<-X.train[,c(mean.index,std.index)]

#forming the test and train data frames
subject.test<-as.factor(subject.test[,1])
subject.train<-as.factor(subject.train[,1])

test<-data.frame(X.test.imp,subject.test,y.test.renamed)
train<-data.frame(X.train.imp,subject.train,y.train.renamed)

#getting and fixing the column names to remove brackets and "-"s
X.names<-as.character(features$V2[c(mean.index,std.index)])
X.names<-gsub(pattern="-",replacement="",X.names)
X.names<-gsub(pattern="()",replacement="",X.names,fixed=TRUE)
X.names<-gsub(pattern="mean",replacement="Mean",X.names,fixed=TRUE)
X.names<-gsub(pattern="std",replacement="Std",X.names,fixed=TRUE)
X.names<-sub(pattern="^t",replacement="Time",X.names)
X.names<-sub(pattern="^f",replacement="Frequency",X.names)

names(test)<-c(X.names,"Subject","Activity")
names(train)<-c(X.names,"Subject","Activity")

#merged data set
merged<-rbind(test,train)

#forming the tidy data set
with(merged,tapply(merged[,2],list("Subject"=merged$Subject,"Activity"=merged$Activity),mean))

aggdata <-aggregate(merged[,-c(67,68)], by=list("Subject"=merged$Subject,"Activity"=merged$Activity),FUN=mean, na.rm=TRUE)

#saving the tidy data set to a file
write.table(aggdata,file="tidyData.txt",col.names=TRUE)

