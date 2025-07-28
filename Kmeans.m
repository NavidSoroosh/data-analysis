clear

load('fisheriris.mat');

% Kmeans

[n, K] = size(unique(meas));

[idx, C] = kmeans(meas, K);

figure, gscatter(meas(:,1), meas(:,2), idx)
hold on;
scatter(C(:,1), C(:,2), 'h', 'c');

n = 4;
d = 4;
Pi = [0.2, 0.3, 0.1, 0.4];
Mu = [[-2, 2] ; [-2, 4] ; [2, 5] ; [4, 3]];
Sigma = [[1, 0 ; 0, 1] ; [0.5, 0 ; 0, 1] ; [1, 0 ; 0, 0.5] ; [1, 0 ; 1, 0]];
X = zeros(n, d);
Z = zeros(n, d);

for i=1:n
    zik = mnrnd(1, Pi);
    
    zi = find(zik==1);
    
    X(i,:) = mvnrnd(Mu(zi,:), Sigma(:,:,zi));
    Z(i) = zi;
end

figure, gscatter(X(:,1), X(:,2), Z);

[Pi, Mu, Sigma, Tau] = EM(X,k);
[~, yhat] = max(Prob, [], 2);


