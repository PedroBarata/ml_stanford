function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

%theta = pinv(X'*X)*X'*y Solução normalizada!

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %







    % ============================================================

    %Save the cost J in every iteration
    %Forma vetorial, internet
    %delta = (theta' * X'-y')*X;
    %theta = theta - alpha/m*delta';

    %Forma vetorial (baseado nos slides)
    theta = theta - alpha/m*sum((X*theta - y).*X)';
   
   %De forma não-vetorial
   %theta1 = theta(1,1) - alpha/m*sum(((theta(1,1) + theta(2,1)*X(:,2) + theta(3,1)*X(:,3)) - y).*X(:,1));
   %theta2 = theta(2,1) - alpha/m*sum(((theta(1,1) + theta(2,1)*X(:,2) + theta(3,1)*X(:,3)) - y).*X(:,2));
   %theta3 = theta(3,1) - alpha/m*sum(((theta(1,1) + theta(2,1)*X(:,2) + theta(3,1)*X(:,3)) - y).*X(:,3));
   %theta(1,1) = theta1;
   %theta(2,1) = theta2;
   %theta(3,1) = theta3;
   J_history(iter) = computeCost(X, y, theta);

 
end
fprintf('J_history value: %f\n',  J_history(num_iters));
end
