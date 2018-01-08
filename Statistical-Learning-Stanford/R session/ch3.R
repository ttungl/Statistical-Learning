library(MASS) # dataset
library('ISLR') # Note: use command "install.packages('ISLR')" to get dataset of the book. Src: https://stackoverflow.com/a/30838301/2881205
### Simple linear regression
names(Boston)
?Boston
plot(medv~lstat,Boston) # median values and lower state
fit1=lm(medv~lstat,data=Boston) # linear model
fit1
summary(fit1)
abline(fit1,col="red") # add linear model fit1 to the plot.
names(fit1)
confint(fit1) # confident interval of coefficients.
predict(fit1,data.frame(lstat=c(5,10,15)),interval="confidence")

### Multiple linear regression
fit2=lm(medv~lstat+age,data=Boston)
summary(fit2)
fit3=lm(medv~.,Boston) # ~. means use all data in Boston, except medv.
summary(fit3)
par(mfrow=c(2,2)) # 2 by 2 subfigs
plot(fit3)
# "twiddle: ~" means nothing in the left, use the same response. 
#"." means whatever in fit, replace by dot. 
#"minus -" means remove item after minus.
fit4=update(fit3,~.-age-indus) 
summary(fit4)

### Nonlinear terms and Interactions
fit5=lm(medv~lstat*age,Boston)
summary(fit5)
fit6=lm(medv~lstat +I(lstat^2),Boston); summary(fit6)
attach(Boston)
par(mfrow=c(1,1))
plot(medv~lstat)
points(lstat,fitted(fit6),col="red",pch=20)
fit7=lm(medv~poly(lstat,4)) # median val polynomial
points(lstat,fitted(fit7),col="blue",pch=20)
plot(1:20,1:20,pch=1:20,cex=2)

###Qualitative predictors
fix(Carseats)
names(Carseats)
summary(Carseats)
fit1=lm(Sales~.+Income:Advertising+Age:Price,Carseats) # "+" means add more features.
summary(fit1)
contrasts(Carseats$ShelveLoc) # how quantitative variables put in linear model.
###Writing R functions
regplot=function(x,y){
  fit=lm(y~x) # fit the model
  plot(x,y) # plot
  abline(fit,col="red") # 
}
attach(Carseats)
regplot(Price,Sales)
regplot=function(x,y,...){ # "..." means unnamed arguments, allow to add extra arguments.
  fit=lm(y~x)
  plot(x,y,...)
  abline(fit,col="red")
}
regplot(Price,Sales,xlab="Price",ylab="Sales",col="blue",pch=20)




