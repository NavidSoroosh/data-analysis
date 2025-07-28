function [Pi, Mu, Sigma, Tau] = EM(X, K)

%initialisation

[n, d] = size(X);

Pi = zeros(K,1);
[y,Mu] = kmeans(X,K);
Sigma = zeros(d,d,K);
q=0;

for k=1:K
    
    nb = length( X( y==k,: ) );
    Pi(k) = nb/n;
    X = X(y==k);
    Sigma(:,:,k) = cov( X( y==k,:) );
    
end

Tau=zeros(n,k);
i=0;

while i<100
    %Etape E
    for k=1:K
        pikn = Pi(k)*mvnpdf(X, Mu(k,:), Sigma(:,:,k));
        den=0;
        for l=1:K
            den=den+Pi(l)*mvnpdf(X, Mu(l,:), Sigma(:,:,l));
        end
        Tau(:,k)=pikn./den;
    end
    
    %Etape M
    for k=1:K
        nk=sum(Tau(:,k));
        Pi(k)=nk/n;
        Mu(k,:)=(1/nk)*sum(Tau(:,k)*ones(1,d).*X,1);
        
    end
    i = i + 1;
end