#############################################################################

# Machine Learning algorithm to predict survival or death of Titanic passengers
# Classification problem with y=0 for death, y=1 for survival
# I have chosen to solve this problem using a basic logistic regression model

# Initialization
clear ; close all; clc

#############################################################################
#-------------------SECTION 1: TRAINING DATA--------------------------------#
#############################################################################

# load only features with numerical data to observe correlations
correlation_data = load('train_correlations.txt');

# calculate correlation coefficients between all the numerical data 
[R] = FindCorrelations(correlation_data);

# Find median Age of passengers in each Class
[MedAges] = MedAge(correlation_data, 2, 3);
fprintf('\n The missing Age data have now been filled with appropriate values: \n');
fprintf('\n Age %f for 1st class passengers, \n', MedAges(1));
fprintf('\n Age %f for 2nd class passengers, \n', MedAges(2));
fprintf('\n Age %f for 3rd class passengers. \n', MedAges(3));

# Load training data 
data = load('train_plotting.txt');

# Plot data 
PlotData(data);

# Features X are in columns 2 to 9
X = data(:, [2, 3, 4, 5, 6, 7, 8, 9]); 

# Group decks together based on similar features 
[X] = GroupDecks(X, 7);

# Set number of rows and columns 
[m,n] = size(X);

# Assign values to passenger data based on their Titles
fid = fopen('PassengerNames.txt');
[Titles] = AssignTitle(fid, m);

# Combine the Titles feature with the other features 
X = [X Titles];
fprintf('\nTitles added to features.\n');

# Separate data pertaining to features with discrete values into separate features
[X] = SeparateVariables(X);
[m, n] = size(X);
fprintf('\n Discrete variables separated, X now has %f columns.\n', n);
fprintf('\nThere are no entries with a SibSp value of 6 or 7, so these columns will be deleted.\n');
X(:,14)=[];
X(:,14)=[];

# Add feature scaling and mean normalisation (before adding intercept)
[X] = FeatureNormalise(X);
fprintf('\nFeatures now normalised.\n');

% Add intercept column term to X
X = [ones(m, 1) X];
[m,n] = size(X);
fprintf('\n X now has %f columns, intercept term added.\n', n);

# survival indicator is in column 1 of data
y = data(:, 1);

fprintf('\nAll features are organised: ready to calculate initial hypothesis. Press to continue.\n');
pause;

# Calculate hypothesis h(x) with an initial theta (with new n+1)
initialTheta = zeros(n, 1);
[h] = CalculateHypothesis(X, initialTheta);

# Calculate cost J and gradient with initial theta
[J, grad] = CalculateCost(initialTheta, h, X, y);
fprintf('Cost at initial theta (zeros): %f\n', J);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

fprintf('Initial cost value obtained. Ready to perform gradient descent. Press to continue.\n');
pause;

# Minimise cost J with gradient descent
iterations = 1500;
alpha = 0.004;

# This gives optimized parameters theta 
Theta = GradientDescent(X, y, h, initialTheta, alpha, iterations);

fprintf('Optimised parameters theta: \n');
fprintf(' %f \n', Theta);

% Compute accuracy on our TRAINING set, as sanity check
p = PredictOutcomes(X, Theta, 0.65);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\n Press to load test data. \n');
pause;


#############################################################################
#----------------------SECTION 2: TEST DATA---------------------------------#
#############################################################################


# load only the numerical features for getting correlations 
correlation_data = load('test_correlations.txt');

# calculate correlation coefficients between all the numerical features 
[R] = FindCorrelations(correlation_data);

# Find median Age of each passenger Class
[MedAges] = MedAge(correlation_data, 1, 2);
fprintf('\n The missing Age data have now been filled with appropriate values: \n');
fprintf('\n Age %f for 1st class passengers, \n', MedAges(1));
fprintf('\n Age %f for 2nd class passengers, \n', MedAges(2));
fprintf('\n Age %f for 3rd class passengers. \n', MedAges(3));

# Read in test data
data = load('test_final.txt');

# Process test data into matrix
X_test = data(:, [1, 2, 3, 4, 5, 6, 7, 8]); 

# Add column of ones again as intercept terms on test data
[m,n] = size(X_test);

# Group decks together based on similar features 
[X_test] = GroupDecks(X_test, 7);

# Assign passengers values based on their Titles
fid = fopen('test_PassengerNames.txt');
[Titles] = AssignTitle(fid, m);

# combine the Titles feature with the other features 
X_test = [X_test Titles];

# Separate variables with discrete values into separate features.
[X_test] = SeparateVariables(X_test);
fprintf('\nDiscrete variables separated, X now has %f columns.\n', n);
fprintf('\nThere are no entries with a SibSp value of 6 or 7, so these columns will be deleted.\n');
X_test(:,14)=[];
X_test(:,14)=[];

# Feature normalises the test data also, before adding intercept term
[X_test] = FeatureNormalise(X_test);

# Add intercept term
X_test = [ones(m, 1) X_test];
[m,n] = size(X_test);

# Test these parameters on test data, by calculating hypothesis matrix
# using the optimized parameters theta
p = PredictOutcomes(X_test, Theta, 0.65);
fprintf('Predicted survival outcomes: \n');
p

# Format results for submission 
data = load('test_passengerid.txt');

# load all passenger IDs into a matrix
PassId = data(:);

# merge passenger IDs with predicted survival outcomes 
submission = [PassId p];

# Output to csv file
csvwrite('submission7.txt',submission);

#############################################################################