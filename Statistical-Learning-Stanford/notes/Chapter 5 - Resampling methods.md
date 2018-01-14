# Chapter 5 - Resampling methods

--
## Cross-Validation

+ We're going to sample from a data set in order to learn about the quantity of interest. 

+ The cross validation and the bootstrap are both ways of resampling from the data.

+ The main thing we use the cross validation for is to get an idea of the test set error of our model. We review the concept of training error which is too optimistic. The more we fit to the data, the lower the training error. But the test error can get higher if we overfit. So, we use cv to get the idea of the test set error of the model.

+ Bootstrap is the most useful to get an idea of the variability or standard deviation of an estimate and its bias.

+ Distinction btw test error and training error:

	+ The test error is the average error that results from using a statistical learning method to predict the response on a new observation, one that was not used in training the method.
	
	+ In contrast, the training error can be easily calculated by applying the statistical learning method to the observations used in its training.
	
	+ But the training error rate often is quite different from the test error rate, and in particular the former can dramatically underestimate the latter.

**Quiz**

	1/ When we fit a model to data, which is typically larger?
		[x] Test Error 
		[] Training Error
 
 	2/ What are reasons why test error could be LESS than training error?
		[x] By chance, the test set has easier cases than the training set.
		[] The model is highly complex, so training error systematically overestimates test error
		[] The model is not very complex, so training error systematically overestimates test error


## K-fold Cross-Valdiation

	
	** K fold cross validation: Quiz **

		Suppose we want to use cross-validation to estimate the error of the following procedure:
		Step 1: Find the k variables most correlated with y
		Step 2: Fit a linear regression using those variables as predictors
		We will estimate the error for each k from 1 to p, and then choose the best k.

			[True]: a correct cross-validation procedure will possibly choose a different set of k variables for every fold.


	** Cross validation: right vs wrong: quiz **

		Suppose that we perform forward stepwise regression and use cross-validation to choose the best model size.

		Using the full data set to choose the sequence of models is the WRONG way to do cross-validation (we need to redo the model selection step within each training fold). If we do cross-validation the WRONG way, which of the following is true?

			[x] The selected model will probably be too complex correct
			[] The selected model will probably be too simple


	** Bootstrap **

		1/ One way of carrying out the bootstrap is to average equally over all possible bootstrap samples from the original data set (where two bootstrap data sets are different if they have the same data points but in different order). Unlike the usual implementation of the bootstrap, this method has the advantage of not introducing extra noise due to resampling randomly. (You can use "^" to denote power, as in "n^2")

		To carry out this implementation on a data set with n data points, how many bootstrap data sets would we need to average over?

		Answer:
			n^n


		2/ If we have n data points, what is the probability that a given data point does not appear in a bootstrap sample?

		Answer: 
			(1-1/n)^n

	** Resamplin in R **

		1/ Download the file 5.R.RData and load it into R using load("5.R.RData"). Consider the linear regression model of y on X1 and X2. What is the standard error for β1? 

		answer: use summary(lm(y~., data=Xy))
				β1 = 0.02593

			Output:
				Call:
				lm(formula = y ~ ., data = Xy)

				Residuals:
				     Min       1Q   Median       3Q 
				-1.44171 -0.25468 -0.01736  0.33081 
				     Max 
				 1.45860 

				Coefficients:
				            Estimate Std. Error t value
				(Intercept)  0.26583    0.01988  13.372
				X1           0.14533    0.02593   5.604
				X2           0.31337    0.02923  10.722
				            Pr(>|t|)    
				(Intercept)  < 2e-16 ***
				X1          2.71e-08 ***
				X2           < 2e-16 ***
				---
				Signif. codes:  
				  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’
				  0.1 ‘ ’ 1

				Residual standard error: 0.5451 on 997 degrees of freedom
				Multiple R-squared:  0.1171,	Adjusted R-squared:  0.1154 
				F-statistic: 66.14 on 2 and 997 DF,  p-value: < 2.2e-16


		2/ Next, plot the data using matplot(Xy,type="l"). Which of the following do you think is most likely given what you see?


			[] Our estimate of s.e.(β^1) is too high.
			[x] Our estimate of s.e.(β^1) is too low. 
			[] Our estimate of s.e.(β^1) is about right.

		3/ Now, use the (standard) bootstrap to estimate s.e.(β^1). To within 10%, what do you get?
			reference: https://github.com/kjy/StatisticalLearning_classstuff/blob/master/HW_TheBootstrap.R

			answer: 0.02873965

				When we do the i.i.d. bootstrap, we are relying on the original sampling having been i.i.d. That is the same assumption that screwed us up when we used lm.

					> library(boot)
					> alpha=function(x,y){
					+     vx=var(x)
					+     vy=var(y)
					+     cxy=cov(x,y)
					+     (vy-cxy)/(vx+vy-2*cxy)
					+ }
					> alpha(Xy$X1, Xy$y)
					[1] 0.4167192
					> alpha.fn=function(data, index){
					+     with(data[index,],alpha(X,Y))
					+ }
					> alpha.fn<-function(data, index) {
					+     fit1<-lm(y~., data=Xy[index,])
					+     coefficients(fit1)[['X1']]
					+ }
					> set.seed(1)
					> alpha.fn (Xy,sample(1:100,100,replace=TRUE))
					[1] 0.1059068
					> boot.out=boot(Xy,alpha.fn,R=1000)
					> boot.out

					ORDINARY NONPARAMETRIC BOOTSTRAP


					Call:
					boot(data = Xy, statistic = alpha.fn, R = 1000)


					Bootstrap Statistics :
					     original       bias    std. error
					t1* 0.1453263 0.0001885914  0.02873965

		4/ Finally, use the block bootstrap to estimate s.e.(β^1). Use blocks of 100 contiguous observations, and resample ten whole blocks with replacement then paste them together to construct each bootstrap time series. For example, one of your bootstrap resamples could be:

			new.rows = c(101:200, 401:500, 101:200, 901:1000, 301:400, 1:100, 1:100, 801:900, 201:300, 701:800)

			new.Xy = Xy[new.rows, ]

			To within 10%, what do you get?

			Answer: 0.2; ?!
			The block bootstrap does a better job of mimicking the original sampling procedure, because it preserves the autocorrelation.

## Quiz

	1/
	If we use ten-fold cross-validation as a means of model selection, the cross-validation estimate of test error is:


		[] biased upward
		[] biased downward
		[] unbiased
		[x] potentially any of the above correct

	2/ Why can't we use the standard bootstrap for some time series data?

		[x] The data points in most time series aren't i.i.d.
		[] Some points will be used twice in the same sample
		[x] The standard bootstrap doesn't accurately mimic the real-world data-generating mechanism
		










