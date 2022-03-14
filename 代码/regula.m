function [c,err,yc]=regula(f,a,b,delta,epsilon,max1)
ya=feval(f,a);
yb=feval(f,b);

if ya*yb>0
    return;
end

for k=1:max1
    dx=yb*(b-a)/(yb-ya);
    c=b-dx;
    ac=c-a;
    yc=feval(f,c);
    
    if yc==0,break;
    elseif yb*yc>0
        b=c;
        yb=yc;
    else
        a=c;
        ya=yc;
    end
    
    dx=min(abs(dx),ac);
    
    if abs(dx)<delta,break,end
    if abs(yc)<epsilon,break,end
end
c;
err=abs(b-a)/2;
yc=feval(f,c);