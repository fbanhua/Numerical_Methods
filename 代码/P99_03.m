N = 11;
A = zeros(N,N);
for i=1:N
    for j=1:N
        A(i,j) = i^(j-1);
    end
end
B = zeros(N,1);
B(1,1) = N;
for i=2:N
    B(i,1) = (i^N-1)/(i-1);
end
uptrbk(A,B)
