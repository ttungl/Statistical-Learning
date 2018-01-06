# Chap2: Overview of statistical learning

### Notes:

**2.2 Dimensionality and structured models**

	+ In the curse of dimensionality, it's hard to find near neighborhoods in high dimensions and stay local.
	+ A linear model f(x) = b0 + b1.x gives a reasonable fit, and a quadratic model fq(x) = b0 + b1.x + b2.x^2 fits slightly better (polynomial).

	+ Trade-offs:
		
		+ Prediction accuracy vs interpretability: linear models are easy to intepret; thin-plate splines (TPS) are not.
		
		+ Good fit vs over-fit or under-fit: how do we know when the fit is just right?

		+ Parsimony vs black-box: prefer a simpler model to a black-box.

		The interpretability vs flexibility.
		Subset selection (lasso) >> least squares >> generalized additive model (Trees) >> bagging,boost >> SVM.

		+ Quiz 3: 
			
			+ The boundary of the hypercube is xj in [0, 0.05] and [0.95, 1]. What proportion of the points in a hypercube of dimension 50 are in the boundary. 

			+ The volume of the interior boundary of the hypercube is 0.9^50 = 0.005, so the volume of the boundary is 1-0.005 = 0.995

**2.3 Model Selection and Bias-Variance Tradeoff**

	+ Assessing model accuracy.
		
		MSE = Avg(y - f(x))^2


	+ bias variance tradeoff

		E(y0 - f(x0))^2 = Var(f(x0)) + [bias(f(x0))]^2 + Var(e)

		* E averages over the Var of y0 awa Var in Training. [bias(f(x0))] = E[\f(x0)] - f(x0)

		* Flexibility of /f increases, its variance increases (~ its bias decreases). 
		
		* Choosing the flexibility based on avg test error amounts to a bias-variance trade-off.

	+ Quiz:

		* False: A fitted model with more predictors will necessarily have a lower Training Set Error than a model with fewer predictors. 

		* While doing a homework assignment, you fit a Linear Model to your data set. You are thinking about changing the Linear Model to a Quadratic one. Which of the following is most likely true: [Using the Quadratic Model will decrease the Bias of your model.]

**2.4 Classification problems**

	+ The response variable Y is "qualitative" - e.g. email is one C = {spam, ham} where ham is a good email. Digit C is from {1-9}. The goal is to build a classifier C(x) that assigns a class label from C to a future unlabeled observation x. Assess the uncertainty in each classification. Understand the roles of the different predictors among x={x1, x2, .., xp}


**Quizzes**
	
	+ 2.Q.1: For each of the following parts, indicate whether we would generally expect the performance of a flexible statistical learning method to be better or worse than an inflexible model.

			The sample size n is extremely large, and the number of predictors p is small:

 		correct: Flexibility is better 

	+ 2.Q.2: The number of predictors p is extremely large, and the sample size n is small:

		correct: Flexibility is worse   
	
	+ 2.Q.3: The relationship between the predictors and response is highly non-linear:

		correct: Flexibility is better   

	+ 2.Q.4: The variance of the error terms, i.e. σ2=Var(ϵ), is extremely high:

		correct: Flexibility is worse























