function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

J = (1/(2*m))*sum(((X*theta) - y).^2);

%J = (1/2*m)*(X*theta-y)'*(X*theta-y);

end
