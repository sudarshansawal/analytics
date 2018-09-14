#Data Frames

#rollno, name, batch, gender, marks1, marks2

(rollno = 1:30)
(name = paste('Student',1:30,sep='-'))
(batch = sample(c(2016,2017,2018), size=30, replace=T))
table(batch)
(gender = sample(c('M','F'), size=30, replace=T))
table(gender)
(marks1 = rnorm(30, mean=65, sd=7))
(marks2 = rnorm(30, mean=60, sd=10))

#now put this info in data frame
df = data.frame(rollno, name, batch, gender, marks1, marks2, stringsAsFactors = F)
df
summary(df)
str(df) #structure
df$rollno
df$gender = factor(df$gender)
df$rollno = as.character(df$rollno)
str(df)
df$batch = factor(df$batch, ordered = T, levels=c('2016','2017','2018'))
str(df)
summary(df)
df


summary(df)
str(df)
head(df) #first few rows(by default is n=6)
tail(df) #last few rows(by default is n=6)
head(df, n=4)
dim(df)
nrow(df)
ncol(df)
names(df)  #names of cols


df[1,1:4]   # [rows,cols]
df[1:3, 1:4]
df[c(1,3), c(1,4,5,6)]
df[ df$gender=='M',] 
df[ df$gender=='M', 3:5]  #Males ; Display 3 to 5th col
df[ df$gender=='M' & df$marks1>70, ] 
nrow(df[df$gender=='M',]) #no. of males


   #sorting
sort(marks1)
order(marks1)    #this gives the position of sorted marks1

df[order(marks1),]

rev(sort(marks1))
df[order(gender, batch),]
df[order(gender, - batch),]

#summary/ aggregating
aggregate(marks1, by=list(batch), FUN=mean)
aggregate(marks1 ~ batch , data=df, FUN=mean)
aggregate(cbind(marks1,marks2) ~ batch , data=df, FUN=mean)
aggregate(cbind(marks1,marks2) ~ batch + gender, data=df, FUN=mean)
aggregate(cbind(marks1,marks2) ~ gender + batch, data=df, FUN=mean)
aggregate(cbind(marks1,marks2) ~ batch + gender, data=df, FUN=max)


df
write.csv(df, "./Data/bitsgoa.csv")

df2 = read.csv("./Data/bitsgoa.csv")
df2
df2 = df2[,-1] #deleting that extra column
df2
