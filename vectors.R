#vector

x = c(1,2,3)
x1 = 1:10000000
length(x1)
x
x1
x2 = seq(10, 100, 2)
x2
?seq
x3 = seq(from=10,to=100,by=3)
x3


#numeric vector----

marks = rnorm(n=30, mean=60, sd=10)
marks
(marks = rnorm(n=30, mean=60, sd=10))     #only learning and not in practice
mean(marks)
median(marks)
mode(marks)  #no mode
sd(marks)
var(marks)
summary(marks)
range(marks)

  #Properties of DS
length(marks)
str(marks)
class(marks)
hist(marks)
plot(density(marks))



#character vector----

names = c('Ram', 'Shyam', 'Robin')
names
length(names)
mean(names) #no mean
class(names)
summary(names)

gender = c('M', 'F', 'M')
summary(gender)
genderF = factor(gender)
summary(genderF)


grades = c('A', 'B', 'C', 'D', 'A', 'D', 'D')
gradesF = factor(grades, ordered=T)
summary(gradesF)
gradesF

gradesF1 = factor(grades, ordered=T, levels=c('D','B','A','C'))
summary(gradesF1)
gradesF1

gradesF2 = factor(grades, ordered=T, levels=c('D','A','C')) #not giving B an order gives an NA in output
summary(gradesF2)
gradesF2

table(gradesF1)
table(gender)

barplot(table(gradesF1))
pie(table(gradesF1))
mean(gradesF1)  #mean and median will give error



#logical vector----

married = c(TRUE, FALSE, T, T, F, T, F)
married
sum(married)
table(married)
class(married)
summary(married)




#Subset of marks----
marks
trunc(marks); round(marks,1); floor(marks); ceiling(marks)  #trunc will remove the decimals
marks1 = trunc(marks)
marks1
marks1[1]
marks1[22]   #Square bracket gives the nth value of that data
marks1[1:5]
marks1[-2]   #Minus will not show the nth value in output, here the 2nd
marks1[c(1,5,10,30)] #display only the provided values
marks1[-c(10:15,17)]
mean(marks1[-c(10:15,17)])
marks1 > 60
marks1[marks1 > 60]
marks1[marks1 > 60 & marks1 < 80]


#Example of sample of random Gender
set.seed(1234)      #To keep the same pattern again even after doing many outputs
gender2 = sample(c('M','F'), size=1000000, replace=T, prob=c(.6,.4))
gender2
table(gender2)
prop.table(table(gender2))
