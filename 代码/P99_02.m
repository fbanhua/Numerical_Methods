A = zeros(7,7);
A(1,1) = 1;
for i=1:7
    A(2,i) = 1;
end
for i=3:7
    A(i,1) = 1;
    for j=2:7
        A(i,j) = (i-1)^(j-1);
    end
end
B = [1;3;2;1;3;2;1];
X = uptrbk(A,B);
result = X';
A;
result_use = zeros(1,7);
for i=1:7
    result_use(1,i) = result(1,7-i+1);
end
result
result_use
X_draw = 0:0.1:6;
Y_draw = polyval(result_use,X_draw);
plot(X_draw,Y_draw)
xt = [0 1 2 3 4 5 6];
yt = [1 3 2 1 3 2 1];
str={'(0,1)','(1,3)','(2,2)','(3,1)','(4,3)','(5,2)','(6,1)'};
text(xt,yt,'*','color','r')
% text(xt,yt,str)
