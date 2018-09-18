t = [0, 0.5,1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4, 4.5];
y = [ 1.0000, 1.0000, 1.1000, 0.7500, 0.8750, 0.9000, 1.1000, 1.0000, 1.0000, 1.1000];
[ a,b,c,d ] = NaturalSpline( t,y );

subplot(2,1,1);
plot(t,y);

subplot(2,1,2);
n=length(t);
tref = zeros(1,6*(n-1)+1);
for k = 1:n-1
    i = 6*(k-1)+1;
    dt = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/6;
    tref(i+2) = t(k)+2*dt/6;
    tref(i+3) = t(k)+3*dt/6;
    tref(i+4) = t(k)+4*dt/6;
    tref(i+5) = t(k)+5*dt/6;
end
tref(6*(n-1)+1) = t(n);
Cvals = pwCEval(a,b,c,d,t,tref);
plot(tref,Cvals,'Linewidth',2);
