# Chapter 7 Moving Beyon Linearity


## Polynomials and step functions

+ Polynomial regression

	+ yi = beta0 + beta1*xi + beta2*xi^2 + .. + epsilon_i

	+ to get confidence intervals, compute upper and lower bounds on **the logit scale**, and then invert to get on prob scale.

	+ Fit using: y ~ poly(x, degree=3)

	+ Knots or cutpoints can be problematic. Use splines for smoother alternatives. 

+ Quiz

	+ Which of the following can we add to linear models to capture nonlinear effects?

	[x] Spline terms

	[x] Polynomial terms

	[x] Interactions

	[] Arbitrary linear combinations of the variables
	
	[x] Step functions

	+ Explanation

		+ If we add any of these terms to our linear model, the model will be able to capture new nonlinear effects. The only exception is linear combinations of variables already in the model: any linear combination of those variables is already included in the model.


## Piecewise-polynomials and splines

+ Piecewise-polynomials
	
	+ Better to add constraints to the polynomials, i.e., continuity

	+ splines have the **maximum** amount of continuity.

+ Linear Splines: with knots at e_k where k = 1..K, is a piecewise linear polynomial continuous at each knot.

+ Cubic Splines: with knots at e_k where k=1..K, is a piecewise cubic polynomial with continuous derivatives up to order 2 at each knot.

+ Quiz

	+ 1/ Why are natural cubic splines typically preferred over global polynomials of degree d?

		[] Polynomials have too many degrees of freedom

		[x] Polynomials tend to extrapolate very badly
		
		[] Polynomials are not as continuous as splines
		
		+ Explanation

			+ Polynomials can oscillate wildly once they get outside the boundaries of the data set. Natural splines, on the other hand, always extrapolate linearly.

	+ 2/ Let 1{x≤t} denote a function which is 1 if x≤t and 0 otherwise.

		Which of the following is a basis for linear splines with a knot at t? Select all that apply:

		[v] 1,x,(x−t)1{x>t}

		[v] 1,x,(x−t)1{x≤t}
		
		[] 1{x>t},1{x≤t},(x−t)1{x>t}
		
		[v] 1,(x−t)1{x≤t},(x−t)1{x>t}
		
		+ Explanation

			+ Every function in the basis must be continuous at t, and we must be able to represent any piecewise linear function with a single knot at t as a linear combination of the functions in the basis.


## Smoothing splines

+ Choosing lambda
	
	+ In R: smooth.spline(age, wage, df=10)

+ Quiz

	+ In terms of model complexity, which is more similar to a smoothing spline with 100 knots and 5 effective degrees of freedom?

		[x] A natural cubic spline with 5 knots correct

		[] A natural cubic spline with 100 knots

## Generalized Additive models and local regression

+ Local regression
	
	+ In R: loess() function.

+ Generalized Additive Models (GAMs)

	+ Allows for flexible nonlinearities in several variables, but retains the additive structure of linear models.

		+ yi = beta0 + f1(xi1) + f2(xi2) + .. + fp(xip) + epsilon_i

	+ GAMs details: can fit a GAM simply using, natural splines:

		+ lm(wage ~ ns(year, df=5) + ns(age, df=5) + education)

	+ Smoothing splines or local regression

		+ gam(wage ~ s(year, df=5) + lo(age, span=.5) + education)

	+ GAMs for classification

		+ log(p(X)/(1-p(X))) = beta0 + f1(xi1) + f2(xi2) + ..

		+ gam(I(wage > 250) ~ year + s(age, df=5) + education, family = binomial)

+ Quiz

	True or False: In the GAM y∼f1(X1)+f2(X2)+e, as we make f1 and f2 more and more complex we can approximate any regression function to arbitrary precision.

		[] True

		[x] False correct
		 
## R nonlinear functions in R

## Quiz

+ Suppose we want to fit a generalized additive model (with a continuous response) for y against X1 and X2. Suppose that we are using a cubic spline with four knots for each variable (so our model can be expressed as a linear regression after the right basis expansion).

	Suppose that we fit our model by the following three steps:

	1) First fit our cubic spline model for y against X1, obtaining the fit f^1(x) and residuals ri=yi−f^1(Xi,1).

	2) Then, fit a cubic spline model for r against X2 to obtain f^2(x).

	3) Finally construct fitted values y^i=f^1(Xi,1)+f^2(Xi,2).

	Will we get the same fitted values as we would if we fit the additive model for y against X1 and X2 jointly?

	[] yes, no matter what

	[] only if X1 and X2 are uncorrelated

	[x] not necessarily, even if X1 and X2 are uncorrelated. correct
	 





































