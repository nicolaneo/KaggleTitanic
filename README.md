# KaggleTitanic
My first attempt at a Kaggle Machine Learning challenge! A machine learning programme to predict the death or survival of Titanic passengers from their data.

## Introduction
The features provided in the training and test raw data (train.csv and test.csv) include:
- Passenger name, including Title. e.g. Mrs, Ms, Dr, etc.
- Sex, male or female
- Age
- PClass, passenger class, 1, 2 or 3. 1 is the highest, 3 is the lowest 
- SibSp, the number of Siblings and Spouses travelling with them
- ParCh, the number of Parents and Children travelling with them
- Ticket number
- Ticket fare
- Cabin, defined by a letter for the deck followed by a number for the cabin, e.g. B45
- Embarked, detailing location passenger embarked from

The training data also includes a survival (1) or death (0) feature.

## Discussion of algorithm
As this is my first attempt at creating a machine learning algorithm from scratch, I chose to use a basic logistic regression model. Gradient descent is used to minimise the cost J.
I tested using polynomial features, however I found these did not improve the overall accuracy on the training set, so did not include them in the final model.

The general sequence of the algorithm is as follows:

ON THE TRAINING DATA:
1. Prepare the data (see discussion later), for which correlation coefficients are found between different features.
2. Plot the data to visualise survival rates across the different features. 
3. Data is one-hot encoded. This means for features whose values are discrete, e.g. SibSp, create new features for each discrete value and fill these with a value of 0 or 1. E.g. for a SibSp of 5, the new feature SibSp5 is created and filled with a 1. All other new SibSp features, SibSp0, SibSp1 etc. are filled with a zero for this training example. 
4. Feature scaling and mean normalisation. This majorly improves the programmes ability to minimise the cost function. 
5. Adding the interept term to the feature matrix. 
6. A hypothesis and cost function are calculated using an initial parameter matrix (theta) of zeros. 
7. Gradient descent implemented to find the parameters for which the cost function is minimised. 
8. Outcomes of survival or death are subsequently predicted using the optimised parameters. An accuracy on the training data is obtained.

ON THE TEST DATA:
1. Test data is prepared, using the same methods as with the training data.
2. Optimised parameters used to make survival or death predictions.


## Discussion and preparation of raw data
The ideas discussed in this section were inspired by suggestions on the Kaggle forums/kernels of how to treat the data in order to improve the algorithm accuracy. Many more ammendments could be made to the data to further improve the accuracy, including the creation of additional useful features, however for my first attempt I stuck to only a few basic improvements.

In the raw training data, there are missing values for the following features:
- Age
- Cabin

The missing age values were filled by looking at the correlation data. The feature with highest correlation with passenger Age is PClass. So depending on the passenger class, the missing age is filled with the median passenger age in that class. 
There were much more missing Cabin values than actual available values, so filling these in using correlation coefficients would not produce as accurate results. So the missing values were put into their own category, "M" for missing.
Since there is so much missing Cabin data, the numbers are removed and the letter pertaining to the deck is kept, so they are just categorised by deck. Decks are then grouped based on their similar features. 

Passenger Titles extracted from the Name feature are assigned a value (for convenience, it's easier to work with numbers rather than strings in MatLab matrices). Some of the less frequent Titles are combined with more frequent based on their similarities. Decks occupied by first class passengers have higher survival rate than those occupied by 2nd and 3rd class passengers. 
- Decks A, B and c are grouped into ABC because they all contain first class passengers.
- Decks D, E and F, G are combined into DE and FG because they have similar passenger class distribution and survival rates.
- Deck M for the missing data is not similar to the others, and has the lowest survival rate, so is in its own group. 

Ticket number is dismissed as a feature, as their formats differ and it's assumed ticket number would not reflect probability of survival. 

With these ammendments, the final accuracy of this algorithm on the training data was around 83%, and 78.5% on the test data.

