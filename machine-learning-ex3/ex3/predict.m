function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);

%ADICIONA O BIAS NOS VALORES DE X
X = [ones(m, 1) X];
% You need to return the following variables correctly 

%INICIALIZA O VETOR DE PREDICAO
p = zeros(size(X, 1), 1);

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

%PEGA O INDICE DE CADA VALOR MÁXIMO ENCONTRADO (1 A 10)
[val p] = max(a3, [], 2);
p
pause;
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%









% =========================================================================


end
