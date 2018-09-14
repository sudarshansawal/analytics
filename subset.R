#Subset

mtcars
newdata = subset(mtcars, mpg >= 20 & mpg <30, select=c(mpg,disp))
newdata


mtcars
newdata = subset(mtcars, cyl== 6 & disp > 150, select=mpg:wt)
newdata
