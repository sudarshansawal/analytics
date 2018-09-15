#Regressions
#Linear----
    #Simple Linear Regression - Y ~ X1   ex: weight ~ height
    #Multiple Linear Regression - Y ~ X1,X2,....   ex: mpg ~ wt + hp + cyl + gear  
#Logistics----
     #Y = 0 or 1 ~ X1, X2,....   ex: placements ~ CGPA, Extracurr


#Simple Regression---- 
women
str(women)
cor(women$height, women$weight)   #correlation
cov(women$height, women$weight)   #covariance
plot(women$height, women$weight)
#create linear model(lm)

fit1= lm(weight ~ height, data=women)
summary(fit1)   #p-value if less than 0.05 then a lm exists
# weight = 3.45*height + (intercept)
fitted(fit1)
names(fit1)
cbind(women, fitted(fit1), residuals(fit1))
ndata1 = data.frame (height=c(62.5,63.5))
predict(fit1, newdata=ndata1)
cbind(ndata1, predictWt = predict(fit1, newdata=ndata1))




#Multiple Linear Regression----
mtcars
names(mtcars)

fit2 = lm(mpg ~ wt + hp, data=mtcars)
summary(fit2)
range(mtcars$wt)
range(mtcars$hp)
ndata2 = data.frame (wt= c(2,3), hp=c(320,233))
predict(fit2, newdata=ndata2)
cbind(ndata2, predictMPG=predict(fit2, newdata=ndata2))


#Logistic Regression : Predict Probability of Selection 

df =  read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")

## view the first few rows of the data
head(df)
sum(is.na(df))

## two-way contingency table of categorical outcome and predictors we want to make sure there are no empty cells
xtabs(~admit + rank, data = df)

str(df)
#convert rank into factors
df$rank = factor(df$rank)
df$admit = factor(df$admit)
fit3 = glm(admit ~ gre + gpa + rank, data=df,family="binomial")
summary(fit3)

#predict probabilities of original values
(prob=predict(fit3,type=c("response")))
head(cbind(df, prob))

#Test with new data
(newdata1 = data.frame(gre = mean(df$gre), gpa = mean(df$gpa), rank = factor(1)))
cbind(newdata1, predictProb=predict(fit3, newdata = newdata1, type="response"))
#if prob > 0.5, we say select = 1

#another set of data for prediction
range(df$gre); range(df$gpa);levels(df$rank)
(newdata2 = data.frame(gre = c(200, 300, 400, 500), gpa = c(2.5, 3, 3.3, 3.75), rank = factor(c(1,2,3,4))))
str(newdata2)
newdata2b = cbind(newdata2, predictProb2=predict(fit3, newdata = newdata2, type = "response"))
newdata2b




