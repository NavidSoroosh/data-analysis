function [w] = IRLS(X,y)

%initialisation
[n, d] = size(X);
X = [ones(length(X),1) X];
w = zeros(d+1 , 1);
t = 0;

while(t < 100)
p = exp(X*w)./(1+exp(X*w));
W = diag(p.*(1-p));
ystar = X*w + inv(W)*(y - p);

w = (X'*W*X)^(-1)*X'*W*ystar;
t = t+1;
end

% log-likelihood
%loglik = sum(y.*(X*w) - log(1 + exp(X*w)));
%fprintf(1, 'Iteration: %d loglik: %f \n