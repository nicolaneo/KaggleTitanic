## Author: Nicola Neophytou <nicola-linux@nicolalinux-Inspiron-5559>
## Created: 2020-05-08

## A function to predict survival outcomes using optimised parameters and threshold 

function [p] = predictOutcomes (X, theta, threshold)

m = size(X,1);
p = zeros(m,1);

# calculate hypothesis function h
[h] = calculateHypothesis (X, theta);

# loop over training examples
for i = 1:m
  # predict survival if survival probability greater than threshold value
  if h(i)>=threshold
    p(i) = 1;
  else
    # otherwise predict death
    p(i) = 0;
  end
end

endfunction
