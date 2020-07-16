# KaggleTitanic
My first attempt at a Kaggle Machine Learning challenge! A machine learning programme to predict the death or survival of Titanic passengers from their data.

## Introduction
The features provided in the training and test raw data (train.csv and test.csv) include:
- Passenger name, including Title. e.g. Mrs, Ms, Dr, etc.
- Sex, male or female
- Age
- SibSp, the number of Siblings and Spouses travelling with them
- ParCh, the number of Parents and Children travelling with them
- Ticket number
- Ticket fare
- Cabin, defined by a letter for the deck followed by a number for the cabin, e.g. B45

The training data also includes a survival (1) or death (0) feature.

## Discussion of algorithm
As this is my first attempt at creating a machine learning algorithm from scratch, I chose to use a basic logistic regression model. Gradient descent is used to minimise the cost J.
I tested using polynomial features, however I found these did not improve the overall accuracy on the training set, so did not include them in the final model.

The general sequence of the algorithm is as follows:

ON THE TRAININ DATA:
1. Find correlation coefficients between features
2. Prepare the data (see discussion later)
3. Plot the data
4. For features whose values are discrete, e.g. SibSp, create new features for each discrete value and fill these with a value of 0 or 1. E.g. for a SibSp of 5, the new feature SibSp5 is created and filled with a 1. All other new SibSp features, SibSp0, SibSp1 etc. are filled with a zero for this training example. 
5. Feature scaling and mean normalisation. This majorly improves the programmes ability to minimise the cost function. 
6. Adding the interept term to the feature matrix. 
7. A hypothesis and cost function are calculated using an initial parameter matrix (theta) of zeros. 
8. Gradient descent implemented to find the parameters for which the cost function is minimised. 
9. Outcomes of survival or death are subsequently predicted using the optimised parameters. An accuracy on the training data is obtained.

ON THE TEST DATA:
10. Test data is prepared, using the same methods as with the training data.
11. Optimised parameters used to make survival or death predictions.


## Discussion of raw data



## Preparing the data

