# Chapter 4: Classification

## Intro

+ Logistic Regression is used if Y \in [0, 1] ~ [No, Yes]

+ Can use Linear Regression if Y^ > 0.5 is Yes. 

+ Linear Regression can produce probability less than 0 or greater than 1. 
It's not a good estimate in probability. So, logistic regression will be more appropriate.

+ Can't use Linear Regression if a responsive variable Y^ has more than 3 possible values. Assigning numbers to categories arbitrarily seems a dangerous if using linear regression since (Y1, Y2) is the same as between (Y2, Y3). 

+ In slide 2, boxplots: The maximum hinge length is HL=1.5 x IQR (interquartile range = Q.75 - Q.25). Then the upper hinge is at Q.75 + HL, and the lower hinge Q.25th - HL. Any points beyond these hinges are marked individually, and considered outliers. However, if there are no points beyond the hinge, then the hinge is pulled back to the most extreme point on either side of the median.

**Quiz**
	
+ 1. Which of the following is the best example of a Qualitative Variable?
Answer: Color

+ 2. Judging from the plots on page 2 of the notes, which should be the better predictor of Default: Income or Balance?
	Answer: Balance

### Logistic Regression
	
+ p(x) = Pr(y=1 | x).

+ hypothesis: h(x) = b0 + b1.x

	p(x) = e^(h(x))/(1 + e^(h(x)))

	values of p(x) will be between 0 and 1.

	logit:

		log(p(x)/(1 - p(x))) = b0 + b1.x

+ How do we estimate the model from data? 
	
	The popular way is to use Maximum likelihood.

	L(b0, b) = Pi{i:yi=1} (p(xi)) Pi{i:yi=0}(1-p(xi))

	Given a data series of observed 0's and 1's, a model for probabilities. 
	The model involves parameters, b0 and b. For any values of the parameters,
	we can write the probability of the observed data, each observation is meant to be
	independent of each other one, the probability of observed data is the prob of observed string 
	0s and 1s. 

	L(b0, b) is a joint probability of observed string sequence 0s and 1s.

	In R, use the "glm" function to do so.

+ Making predictions:

	+ What is our estimated prob of DFT for someone with a balance of $1000 ?
		x = 1000

		h(x) = b0 + b1.x
		
		b0 = -10.6513 # coefficients
		
		b1 = 0.0055 # coefficients
		
		p(x) = e^(h(x)) / 1 + e^(h(x))
		
			 = 0.006

	+ With a balance of $2000?

		p(x) = 0.586

**Quiz**

+ Note: https://www.mathstat.dal.ca/~aarms2014/StatLearn/docs/

+ 1/ Using the model on page 8 of the notes, what value of Balance will give a predicted Default rate of 50%? (within 3 units of accuracy)
	Answer: 1936.6

		log(p(x)/(1 - p(x))) = b0 + b1.x

		Find x?

	We know that logit(.5) = β0+β1*Balance. Thus, Balance = (logit(.5) - β0)/β1 = (log(.5/(1-.5)) + 10.6513)/.0055 = 1936.6

## Multivariate Logistic Regression

**Quiz**

+ 1/ Suppose we collect data for a group of students in a statistics class with variables X1= hours studied, X2= undergrad GPA, and Y= receive an A. We fit a logistic regression and produce estimated coefficients β^o=−6,β^1=0.05,β^2=1.

	+ Estimate the probability that a student who studies for 40h and has an undergrad GPA of 3.5 gets an A in the class (within 0.01 accuracy):
		
		Answer: 

		p(x)?
		b0 = -6; b1= 0.05; b2=1

		x1=40
		
		x2=3.5

		p(x)=y?

		h(x) = b0 + b1.x1 + b2.x2 = -6 + 0.05*40 + 1*3.5 = -0.5

		p(x) = e^(h(x))/(1 + e^(h(x))) = e^(-0.5)/(1 + e^(-0.5))
			 = 0.377


+ 2/ How many hours would that student need to study to have a 50% chance of getting an A in the class?:

		Answer:

		p(x) = y = 0.5

		x2 = 3.5
		
		b0 = -6; b1= 0.05; b2=1
		
		x1?

		e^(h(x))/(1 + e^(h(x))) = 1/2

		=> 2 * e^(h(x)) = 1 + e^(h(x))
		
		=> e^(h(x)) = 1
		
		=> h(x) = log(1) = 0
		
		=> h(x) = b0 + b1.x1 + b2.x2 = 0
		
		=> -6 + 0.05*x1 + 1*3.5 = 0
		
		=> x1 = 2.5/0.05 = 50

## Logistic Regression - Case-Control Sampling and Multiclass

**Quiz**

+ 1/ In which of the following problems is Case/Control Sampling LEAST likely to make a positive impact?
	Answer:
		[x] Predicting a shopper's gender based on the products they buy correct

		[] Finding predictors for a certain type of cancer
		
		[] Predicting if an email is Spam or Not Spam


## Discriminant Analysis

**Quiz**

+ 1/ Suppose that in Ad Clicks (a problem where you try to model if a user will click on a particular ad) it is well known that the majority of the time an ad is shown it will not be clicked. What is another way of saying that?

	Answer: 
		[x] Ad Clicks have a low Prior Probability correct

		[] Ad Clicks have a high Prior Probability.
		
		[] Ad Clicks have a low Density.
		
		[] Ad Clicks have a high Density.

## Gaussian Discriminant Analysis - One Variable

**QuZzz**

+ Which of the following is NOT a linear function in x:

	[] f(x)=a+b2x

	[] The discriminant function from LDA
	
	[] δk(x)=xμkσ2−μk22σ2+log⁡(πk)
	
	[] logit(P(y=1|x)) where P(y=1|x) is as in logistic regression
	
	[x] P(y=1|x) from logistic regression

## Gaussian Discriminant Analysis - Many Variables

**Note** With thousands features/variables, so covariance will be of size thousands by thousands. 
Reconsidering other method over this. 

**QuZzz**

+ Why does Total Error keep going down on the graph on page 34 of the notes, even though the False Negative Rate increases?

	[] The False Negative Rate does not affect Total Error.

	[] A higher False Negative Rate generally decreases Total Error.

	[x] Positive responses are so uncommon that the *False Negatives* make up only a *small portion* of the Total Error 

	[] All of the above

## Quadratic Discriminant Analysis and Naive Bayes
			
**Naive Bayes** is useful for high-dimensional problems.

+ Logistic regression vs Linear Discriminant Analysis (LDA)

	[-] both have the same form,

	[+] Logistic Reg. uses the conditional likelihood based on Pr(Y|X) (known as discriminative learning)

	[+] LDA uses the full likelihood based on Pr(X,Y) (known as generative learning)

	[+] logistic reg. can also fit quadratic boundaries (i.e. QDA) by including quadratic term in the model.


**Quiz**

+ Which of the following statements best explains the relationship between Quadratic Discriminant Analysis and naive Bayes with Gaussian distributions in each class?

	[x] Quadratic Discriminant Analysis is a more flexible class of models than naive Bayes

	[] Quadratic Discriminant Analysis is a less flexible class of models than naive Bayes
	
	[] Quadratic Discriminant Analysis is an equivalently flexible class of models to naive Bayes
	
	[] For some problems Quadratic Discriminant Analysis is more flexible than naive Bayes, for others the opposite is true.
		
## R implementation

+ In ch4.R, line 13 is "attach(Smarket)." If that line was omitted from the script, which of the following lines would cause an error?:

	[x] line 15: mean(glm.pred==Direction) correct

	[] line 18: glm.fit = glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,data=Smarket,family=binomial, subset=train)
	
	[] line 22: Direction.2005=Smarket$Direction[!train]
	
	[] line 30: table(glm.pred,Direction.2005)
	 
## Quiz

+ 1/ Which of the following tools would be well suited for predicting if a student will get an A in a class based on the student's height, and parents’ income? Select all that apply:

	Answer:

		[x] Linear Discriminant Analysis

		[x] Linear Regression
		
		[x] Logistic Regression
		
		[] Random Guess
	
		



















