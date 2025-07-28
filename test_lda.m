function [yhat, Prob] = test_lda(X, pi, mu, Sigma)

% prediction using lda classifier
[n, ~] = size(X);
K = length(pi);

Prob = zeros(n,K);

for k=1:K

    Prob(:,k) = pi(k)*mvnpdf(X, mu(k,:), Sigma);
end

[~, yhat] = max(Prob, [], 2);

end