## Author: Nicola Neophytou
## Created: 2020-05-08

## A function to mean normalise the data

function [X_norm] = featureNormalise (X)

  # calculate mean mu
  mu = mean(X);
  X_norm = bsxfun(@minus, X, mu);

  # calculate standard deviation
  sigma = std(X_norm);
  X_norm = bsxfun(@rdivide, X_norm, sigma);

endfunction
