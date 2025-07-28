function [pi, mu, Sigma] = train_lda(X, y)
% training of the classifier

K = length(unique(y));
[n, d] = size(X);

pi = zeros(K,1);
mu = zeros(K,d);
Sigma = cov(X);

for k=1:K
    
    nk = length( X( y==k,: ) );
    pi(k) = nk/n;
    
mu(k, :) = mean( X( y==k,:) );
    
end