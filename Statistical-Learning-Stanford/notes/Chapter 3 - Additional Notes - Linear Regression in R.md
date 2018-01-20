# Chapter 3 Additional Notes: Linear Regression in R 

**Quiz** What is the difference between lm(y ~ x*z) and lm(y ~ I(x*z)), when x and z are both numeric variables?

Answer: The first one includes an interaction term between x and z, whereas the second uses the product of x and z as a predictor in the model. correct