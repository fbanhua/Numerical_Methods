function X=forsub(A,B)
n = length(B);
X = zeros(n,1);
X(1)=B(1)/A(1,1);
for k=2:n
    X(k)=(B(k)-A(k,1:k-1)*X(1:k-1))/A(k,k);
end