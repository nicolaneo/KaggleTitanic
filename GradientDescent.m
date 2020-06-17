## Author: Nicola Neophytou
## Created: 2020-05-07

# A function to perform gradient descent to minimise the cost function J

function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
  
# Initialize useful values
J_history = zeros(num_iters, 1);
[m,n] = size(X);
Features = zeros(m,n-1);
stepTheta = zeros(n,1);

# perform gradient descent for number of given iterations
for iter = 1:num_iters

    # Calculate hypothesis h, and the difference h-y
    h=X*theta;
    diff=h-y;
   
   # Create matrix of features except the intercept term 
   for i=1:(n-1)
     # copy features from X into Features matrix
     Features(:,i) = X(:,(i+1));
   end
   
   # Differentiate cost J with respect to theta0
   stepTheta(1) = (sum(diff))/m;
    
   # Differentiate cost J with respect to other theta parameters 
   Xdiff = Features'*diff;
   for j=1:(n-1)
     stepTheta(j+1) = Xdiff(j)/m;
   end
    
    # Update theta matrix
    theta = theta - alpha*stepTheta;

    # Save the cost J in every iteration    
    [J_history, grad] = calculateCost(theta, h, X, y);
    fprintf('Cost value (should be falling): \n');
    fprintf(' %f \n', J_history);
    
end

endfunction
