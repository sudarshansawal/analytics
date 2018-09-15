marry=sample(c('Yes',"No"), size=100, replace=T)
selfGender=sample(c('M',"F"), size=100, replace=T)
selfAge=ceiling(runif(100, 23,30))
selfEdn=sample(c(1,2,3,4), size=100, replace=T, prob=c(.1,.3,.4,.2))
spouseAge=ceiling(rnorm(100, mean=26,sd=5))
spouseEdn=sample(c(1,2,3,4), size=100, replace=T, prob=c(.1,.3,.4,.2))
spouseSiblings=sample(c(0,1,2,3), size=100, replace=T, prob=c(.2,.3,.3,.2))
spouseCity=sample(c('Rural',"Urban"), size=100, replace=T)
spouseSalary= ceiling(runif(100, 0,100000))

df = data.frame(marry, selfGender, selfAge, selfEdn, spouseAge, spouseEdn, spouseSiblings, spouseCity, spouseSalary )

head(df)

library(rpart)

dtree1 = rpart(marry ~ . , data=df)
dtree1
library(rpart.plot)
rpart.plot(dtree1)

df[spouseSalary < 12e+3 & spouseSalary < 63e+3 & selfAge <30 & marry=='Yes',c('spouseSalary','selfAge', 'marry')]


dtree2 = rpart(marry ~ . , data=df, cp=-1)
dtree2
rpart.plot(dtree2)

printcp(dtree2)
ptree2 = prune(dtree2, cp=.02)
rpart.plot(ptree2)

ndata1 = data.frame(selfGender='M', selfAge=27, selfEdn=3, spouseAge=29, spouseEdn=4, spouseSiblings=4, spouseCity='Rural', spouseSalary=45000)
predict(dtree1, newdata = ndata1, type="class")
predict(dtree1, newdata = ndata1, type="prob")



#GRE Example 

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
df$rank = factor(df$rank)
df$admit = factor(df$admit)
dim(df)
library(rpart)
library(rpart.plot)
dtree3 = rpart(admit ~ gre +gpa +rank , data=df )
dtree3
rpart.plot(dtree3)
printcp(dtree3)

ptree3 = prune(dtree3, cp=0.023)
ptree3
rpart.plot(ptree3)
ndata2 = data.frame(gre=600, gpa=3.6 , rank=factor(c(1,2,3)))
predict(ptree3, newdata=ndata2, class="prob")
