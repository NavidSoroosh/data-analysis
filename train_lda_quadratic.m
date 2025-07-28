function [pi, mu, sigmak] = train_lda_quadratic(X, y)

% training of the classifier

K = length(unique(y));
[n, d] = size(X);

pi = zeros(K,1);
mu = zeros(K,d);
sigmak = zeros(d,d,K);

for k=1:K
    
    nk = length( X( y==k,: ) );
    pi(k) = nk/n;
    mu(k, :) = mean( X( y==k,:) );
    sigmak(:,:,k) = cov( X( y==k,:) );
    
end