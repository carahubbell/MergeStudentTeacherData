#This code merges spreadsheets from Scantron data and the Accountability radar to indicate
#  homeroom teacher and whether a ST has completed their test or not.

#Require packages
sapply(c("dplyr","data.table"), require, character.only=TRUE)

#Teacher data is already in wd. Download scantron data and save as tested.csv in wd.

#Load data into R.
teachers<-read.csv("teachers.csv", header=TRUE)
hrteachers<-select(teachers,User.ID, Current.Homeroom.Teacher)
names(hrteachers)<-gsub("User.ID", "Student.ID", names(hrteachers))

tested<-read.csv("tested.csv",header=TRUE)

#Merge data frames.
combined<-merge(tested, hrteachers, by="Student.ID")
combined<-arrange(combined, Student)


#Write new file called scantron to wd.
write.csv(combined, file="scantron.csv")