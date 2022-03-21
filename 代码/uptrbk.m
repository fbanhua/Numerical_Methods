function X = uptrbk(A,B)
[N N] = size(A);
X = zeros(N,1);
C = zeros(1,N+1);

Aug = [A,B];

for p=1:N-1
    [Y,j] = max(abs(Aug(p:N,p)));%求出矩阵中当前行到最后一行的最大元素,Y为每列最大的元素,j为每列最大元素的行索引
    C = Aug(p,:);                %将当前行,即第p行赋值给C
    Aug(p,:) = Aug(j+p-1,:);     %
    Aug(j+p-1,:)=C;              %将当前行与系数绝对值的行进行交换
    if Aug(p,p)==0
        'A was singular. NO=o unique solution'
        break
    end                          %判断进行完上述操作之后除数是否会为0
    for k=p+1:N                  %从第p+1行到最后一行,消去第p个
        m = Aug(k,p)/Aug(p,p);
        Aug(k,p:N+1)=Aug(k,p:N+1)-m*Aug(p,p:N+1);
    end
end
X = backsub(Aug(1:N,1:N),Aug(1:N,N+1));%将使用高斯消元法后得到的上三角矩阵放进回代法进行求解
    