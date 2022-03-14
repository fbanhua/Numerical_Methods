function R=approot(X,epsilon,f)
% P48?
Y = f(X);
yrange = max(Y)-min(Y);
epsilon2 = yrange*epsilon;
n = length(X);
m = 0;
X(n+1)=X(n);
Y(n+1)=Y(n);
for k=2:n
    if Y(k-1)*Y(k)<=0
        m=m+1;
        R(m) = (X(k-1)+X(k))/2;
    end
    s = (Y(k)-Y(k-1))*(Y(k+1)-Y(k));
    if (abs(Y(k))<epsilon2) & (s<=0)
        m = m+1;
        R(m)=X(k);
    end
end
