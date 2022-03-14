function [k,p,err,P]=fixpt(g,p0,tol,max)
P(1)=p0;
for k=2:max
    P(k)=feval(g,P(k-1)); %将P(k-1)作为自变量输入函数g计算结果
    err=abs(P(k)-P(k-1));
    relerr=err/(abs(P(k))+eps);
    p=P(k);
    if (err<tol)|(relerr<tol),break;end
end
if k==max
    disp("exceeded")
end
P=P';