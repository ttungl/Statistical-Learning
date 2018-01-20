# Chapter 3: Linear regression

#### 3.1 Simple Linear Regression

**LR for the advertising data**

+ How strong the relationship between Budget vs Sales?

+ which media contributes to sales?

+ Predict future sales and relationship linear?

+ synergy among advertising media?

**Estimation of parameters by least squares**

+ ^yi = ^b0 + ^b1.xi be the prediction for Y based on the ith value of X.
	Then ei = yi - ^yi is i-th residual.

+ Residual sum of squares (RSS) = e1^2 + e2^2 + e3^3 + .. + en^2

+ RSS = (y1 - ^b0 - ^b1.x1)^2 + (y2 - ^b0 - ^b1.x2)^2 +..+ (yn - ^b0 - ^b1.xn)^2

**Assessing the accuracy of the coefficient estimates**

+ standard error of an estimator reflects how it varies under repeated sampling. 

	SE(^b1)^2 = theta^2 / sum{i=1..n} (xi - /x)^2

	theta^2 = Variance(e) = Var(e)

+ These standard errors can be used to compute "confidence intervals".
	A 95% CI is defined as a range of values such that with 95% probability, 
	the range will contain the true unknown value of the parameter:

		^b1 +/- 2 * SE(^b1)

+ Confidential Intervals:
	That us, there is approximately a 95% chance that the interval

	[ ^b1 - 2 * SE(^b1), ^b1 + 2 * SE(^b1)]

	will contain the true value of b1 (under a scenario where we got repeated samples like the present sample)

	i.e. for the advertising data, the 95% CI for b1 is [0.042, 0.053].

**Quizzes** [+] selected; [-] not selected;

+ 3.1 Why is linear regression important to understand? Select all that apply:
	
	[-] The linear model is often correct
	
	[+] Linear regression is very extensible and can be used to capture nonlinear effects

	[+] Simple methods can outperform more complex ones if the data are noisy

	[+] Understanding simpler methods sheds light on more complex ones

+ 3.2 Which of the following are true statements? Select all that apply:

	[+] A 95% confidence interval is a random interval that contains the true parameter 95% of the time

	[-] The true parameter is a random value that has 95% chance of falling in the 95% confidence interval

	[-] I perform a linear regression and get a 95% confidence interval from 0.4 to 0.5. There is a 95% probability that the true parameter is between 0.4 and 0.5.

	[+] The true parameter (unknown to me) is 0.5. If I sample data and construct a 95% confidence interval, the interval will contain 0.5 95% of the time.

#### 3.2 Hypothesis Testing and Confidence Intervals

**Hypothesis testing**

+ standard errors can also be used to perform hypothesis test on the coefficients. 

+ if null hypothesis test fails (reject hypothesis test), b1 is not 0, 
CI will not contain 0. However, if hypothesis test does not reject, 
its slope maybe is 0, CI for that parameter will contain 0.


**Residual Standard Error**

RSE = sqrt((1/(n-2))*RSS) = sqrt((1/(n-2))* sum{1..n}(yi-^yi))^2

where RSS (residual sum of squares).


+ R-squared: fraction of variance:

	R^2 = 1 - RSS/TSS

	where TSS = sum{1..n}(yi - /y)^2 is the total sum of squares.

**Quizzes**

+ 1. We run a linear regression and the slope estimate is 0.5 with estimated standard error of 0.2. What is the largest value of b for which we would NOT reject the null hypothesis that β1=b? (assume normal approximation to t distribution, and that we are using the 5% significance level for a two-sided test; need two significant digits of accuracy)

	answer: 0.9

	explain: [ref: https://www.reddit.com/r/HomeworkHelp/comments/41d7kl/intro_statistical_learning_cant_solve_hypothesis/]

		B1 - 2 x SE(B1)

		0.5 - 2 x 0.2 = 0.1

		B1 + 2 x SE(B1)

		0.5 + 2 x 0.2 = 0.9

		so, max = 0.9


+ 2. Which of the following indicates a fairly strong relationship between X and Y?

	answer: R^2=0.9

#### 3.3 Multiple linear regression:

**Model**

Y = b0 + b1x1 + b2x2 + .. + bnxn + e

We interpret bj as the average effect on Y of a one unit increase in Xj,
holding all other predictors fixed. 

In the advertising example, the model becomes:

	sales = b0 + b1 x TV + b2 x radio + b3 x newspaper + e

**Quizzes**

Suppose we are interested in learning about a relationship between X1 and Y, which we would ideally like to interpret as causal.

True or False? The estimate β^1 in a linear regression that controls for many variables (that is, a regression with many predictors in addition to X1) is usually a more reliable measure of a causal relationship than β^1 from a univariate regression on X1.

answer: False 


#### 3.4 Important questions

**Quizzes**
Reference: net.pku.edu.cn/~course/cs410/2015/slide/20150412-lab.pptx

+ 1. According to the balance vs ethnicity model, what is the predicted balance for an Asian in the data set? (within 0.01 accuracy)

answer: 512.31

For an Asian, the predicted balance is the intercept plus the Asian ethnicity effect.


+ 2. What is the predicted balance for an African American? (within .01 accuracy)

answer: 531

For an African American, the predicted balance is just the intercept.
Note that despite the differing predictions, this difference is not statistically significant.


#### 3.5 Extensions of the linear model

**Quizzes**

+ 1. According to the model for sales vs TV interacted with radio, what is the effect of an additional $1 of radio advertising if TV=$50? (with 4 decimal accuracy)

	Answer: .0839


+ 2. What if TV=250 units?
	Answer: .3039
	EXPLANATION
	The effect of an additional unit of radio is .0289 plus .0011 times TV.


#### 3.6 Linear regression in R

#### Chapter 3 Quiz

**Quiz**

+ Which of the following statements are true?

	[+] In the balance vs. income * student model plotted on slide 44, the estimate of beta3 is negative.

	[-] One advantage of using linear models is that the true regression function is often linear.

	[-] If the F statistic is significant, all of the predictors have statistically significant effects.

	[-] In a linear regression with several variables, a variable has a positive regression coefficient if and only if its correlation with the response is positive.























