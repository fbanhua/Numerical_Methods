function [p1,err,k,y]=secant(f,p0,p1,delta,epsilon,max1)
for k=1:max1
    p2=p1-feval(f,p1)*(p1-p0)/(feval(f,p1)-feval(f,p0));
    err=abs(p2-p1);
    relerr=2*err/(abs(p2)+delta);
    p0=p1;
    p1=p2;
    y=feval(f,p1);
    if(err<delta)|(relerr<delta)|(abs(y)<epsilon),break,end
end