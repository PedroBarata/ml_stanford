function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network

%Transforma o vetorzao de entrada em vetores Theta
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

%Como a hipotese h(theta) será de dimensao 5000x10 (numero de exemplos x numero de saidas possiveis)
%precisamos transformar o vetor y em uma matriz de mesma dimensao
y_matrix = eye(num_labels)(y,:);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
a1 = X;
%ADICIONA O BIAS NOS VALORES DE X
X = [ones(m, 1) X];

%CALCULA A "FUNCAO" Z2 = THETA 1 * A1 ONDE A1 SAO AS FEATURES E ENTRADA
z2 = X*Theta1';

%A FUNCAO DE ATIVACAO NA SEGUNDA LAYER
a2 = sigmoid(z2);

%ADICIONA O BIAS NO A2
a2 = [ones(m, 1) a2];

%CALCULA O VALOR DE Z3
z3 = a2*Theta2';

%CALCULA A FUNCAO DE ATIVACAO A3, QUE, COMO É A ULTIMA LAYER, É A HIPÓTESE
a3 = sigmoid(z3);

%Remove o bias (porém, as linhas da primeira coluna)
Theta1(:, 1) = 0;
Theta2(:, 1) = 0;

%Calcula o termo de regularização
reg_term = (lambda/(2*m))*((sum(sum(Theta1.^2))) + (sum(sum(Theta2.^2))));

%Calcula o termo J(theta)
J = (1/m)*sum(sum(-y_matrix.*log(a3) - (1 - y_matrix).*log(1-a3))) + reg_term;
%Calcula a matriz delta 3
d3 = a3 - y_matrix;

%calcula a matriz delta 2, removendo o BIAS do theta2
d2 = d3*Theta2(:,2:end).*sigmoidGradient(z2);

%calcula as duas matrizes do backprop. a partir dos deltas
D1 = d2' * X;
D2 = d3' * a2;
Theta1_grad = ((1/m)*D1) + ((lambda/m)*Theta1);
Theta2_grad = ((1/m)*D2) + ((lambda/m)*Theta2);
% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
