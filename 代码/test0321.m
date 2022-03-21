L = zeros(20,20);
for i=1:20
    for j=1:20
        if i>=j
            L(i,j)=i+j;
        end
    end
end
B = zeros(20,1);
for i=1:20
    B(i)=i;
end
forsub(L,B)