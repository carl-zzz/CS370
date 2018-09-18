function [ a,b,c,d ] = NaturalSpline( t,x )

n=length(x);
deltay=zeros(1,n-1);
deltat=zeros(1,n-1);
dt=zeros(1,n-1);

T=sparse(n,n);

for i=1:n-1;
   deltay(i)=x(i+1)-x(i);
   deltat(i)=t(i+1)-t(i);
   dt(i)=deltay(i)/deltat(i);
end

r = zeros(1,n);
r(1)=3/2*dt(1);
r(n)=3/2*dt(n-1);

for i=2:n-1;
    r(i)=3*(deltat(i)*dt(i-1)+deltat(i-1)*dt(i));
end

T(1,1)=1;
T(1,2)=1/2;
T(n,n)=1;
T(n,n-1)=1/2;

for i=2:n-1;
    T(i,i-1)=deltat(i);
    T(i,i)=2*(deltat(i-1)+deltat(i));
    T(i,i+1)=deltat(i-1);
end

[L,U] = TriMatFactor(T);
[ s ] = TriFBSolve(L,U,r);
disp(s);
a=zeros(1,n-1);
b=zeros(1,n-1);
c=zeros(1,n-1);
d=zeros(1,n-1);

for i=1:n-1;
    a(i)=x(i);
    b(i)=s(i);
    c(i)=(3*dt(i)-2*s(i)-s(i+1))/deltat(i);
    d(i)=(s(i)+s(i+1)-2*dt(i))/(deltat(i)*deltat(i));
end

end


