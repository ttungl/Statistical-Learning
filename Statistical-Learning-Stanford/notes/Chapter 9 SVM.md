# Chapter 9 SVM

## Optimal Separating Hyperplanes

* Note: In page 3, Looks like β1 should be 0.6, and β2 should be 0.8

SVM: Try to find a plane that separates the classes in feature space.

* Quiz:

	If β is not a unit vector but instead has length 2, then ∑j=1pβjXj is


	[x] twice the signed Euclidean distance from the separating hyperplane ∑j=1pβjXj=0
	
	[]half the signed Euclidean distance from X to the separating hyperplane
	
	[]exactly the signed Euclidean distance from the separating hyperplane
	

	Explain:
		We know β′= 1/2 * β has length 1, so it is a unit vector in the same direction as β. Therefore, ∑j=1pβjXj=2∑j=1pβj′Xj, where ∑j=1pβj′Xj is the Euclidean distance.

## SVC
	
* Quiz

	If we increase C (the error budget) in an SVM, do you expect the standard error of β to increase or decrease?
		[]Increase
		[x] Decrease

## Feature extension and SVM

* non-linearities in SVC through the use of Kernels

* What is the role of inner products in SVC ? 

	+ <xi, xi'> = sum{j=1, p} xij xi'j

* Kernel functions:

	K(xi, xi') = (1+sum{j=1 to p}xij xi'j)^d

	computes inner-products needed for d dim-polynomials.

* Radial Kernel for non-linear SVM.

	K(xi, xi') = exp(-gamma * sum{j=1 to p}(xij - xi'j)^2)

	f(x) = beta0 + sum{i in S} K(x, xi)

* Quiz

	+ 1/ True or False: If no linear boundary can perfectly classify all the training data, this means we need to use a feature expansion.

		[] True
		[x] False correct

		Explain:
			As in any statistical problem, we will always do better on the training data if we use a feature expansion, but that doesn't mean we will improve the test error. Not all regression lines should perfectly interpolate all the training points, and not all classifiers should perfectly classify all the training data.

	+ 2/ True or False: The computational effort required to solve a kernel support vector machine becomes greater and greater as the dimension of the basis increases.

		[] True
		[x] False correct

		Explain:
			The beauty of the "kernel trick" is that, even if there is an infinite-dimensional basis, we need only look at the n^2 inner products between training data points.

## Examples:
	
* Quiz

	Recall that we obtain the ROC curve by classifying test points based on whether f^(x)>t, and varying t.

	How large is the AUC (area under the ROC curve) for a classifier based on a completely random function f^(x) (that is, one for which the orderings of the f^(xi) are completely random)?

	Answer: 0.5
		Explain:
		If f^(x) is completely random, then f^(xi) (and therefore the prediction for yi) has nothing to do with yi. Thus, the true positive rate and the false positive rate are both equal to the overall positive rate, and the ROC curve hugs the 45-degree line.

## R SVMs

+ In this problem, you will use simulation to evaluate (by Monte Carlo) the expected misclassification error rate given a particular generating model.  Let yi be equally divided between classes 0 and 1, and let xi∈R10 be normally distributed.

	Given yi=0, xi∼N10(0,I10).  Given yi=1, xi∼N10(μ,I10) with μ=(1,1,1,1,1,0,0,0,0,0).

+ Now, we would like to know the expected test error rate if we fit an SVM to a sample of 50 random training points from class 1 and 50 more from class 0.  We can calculate this to high precision by 1) generating a random training sample to train on, 2) evaluating the number of mistakes we make on a large test set, and then 3) repeating (1-2) many times and averaging the error rate for each trial.

+ Aside: in real life don't know the generating distribution, so we have to use resampling methods instead of the procedure described above.

+ For all of the following, please enter your error rate as a number between zero and 1 (e.g., 0.21 instead of 21 if the error rate is 21%).

+ 9.R.1

	Use svm in the e1071 package with the default settings (the default kernel is a radial kernel). What is the expected test error rate of this method (to within 10%)?

	0.16350
	correct  0.16350

+ 9.R.2

	Now fit an svm with a linear kernel (kernel = "linear"). What is the expected test error rate to within 10%?


	0.15791
	  correct  0.15791
	0.15791 
	Explanation

	An svm with a linear kernel does a little better here, since the best decision boundary is truly linear.

+ 9.R.3

	What is the expected test error for logistic regression? (to within 10%)

	(Don't worry if you get errors saying the logistic regression did not converge.)

	0.15
	correct  0.15750
	
	Explanation

		Logistic regression is similar to SVM with a linear kernel.

## Quizzes

+ 1/ Suppose that after our computer works for an hour to fit an SVM on a large data set, we notice that x4, the feature vector for the fourth example, was recorded incorrectly (say, one of the decimal points is obviously in the wrong place).

	However, your co-worker notices that the pair (x4,y4) did not turn out to be a support point in the original fit. He says there is no need to re-fit the SVM on the corrected data set, because changing the value of a non-support point can't possibly change the fit.

	Is your co-worker correct?

	Yes
	No correct

	+ Explanation

		When we change x4, the fourth example might become a support point; if so, the fit may change. However, we could check whether x4,y4 is still not a support point even after correcting the value. If so, then we really don't need to re-fit the model.

	



































