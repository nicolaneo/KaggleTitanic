## Author: Nicola Neophytou <nicola-linux@nicolalinux-Inspiron-5559>
## Created: 2020-05-07

## A function to calculate cost J for logistic regression

function [J, grad] = CalculateCost (theta, h, X, y)

# define the number of training examples m
m = length(y);

# set initial cost to zero  
J = 0;

# set size of matrix of cost gradient to same size as theta
grad = zeros(size(theta));

# calcuate cost for logistic regression
J = (-(y'*log(h)) - ([ones(size(y))]-y)'*(log([ones(size(h))]-h)))/m;

# calculate cost gradient matrix
grad = ((h-y)'*X)/m;

endfunction
