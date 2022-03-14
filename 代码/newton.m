function [p0,err,k,y] = newton(f,df,p0,delta,epsilon,max1)
for k=1:max1
    p1=p0-feval(f,p0)/feval(df,p0);
    err=abs(p1-p0);
    relerr=2*err/(abs(p1)+delta);
    p0=p1;
    y=feval(f,p0);
    if(err<delta)|(relerr<err)|(abs(y)<epsilon),break,end
end