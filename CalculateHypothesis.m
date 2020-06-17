## Author: Nicola Neophytou
## Created: 2020-05-07

## Calculates hypothesis function using the sigmoid function
function [h] = calculateHypothesis (X, theta)
# create variable z 
z = X*theta;

# create matrix for h
h = zeros(size(z));

# matrix of exponentials
Expos = exp(-z);

# calculate denominator of sigmoid function
Denom = ones(size(z)) + Expos;

# hypothesis
h = 1./Denom;

endfunction
