function [y] = RK2(t0,tfinal,N,y0)
h = (tfinal-t0)/N;
y = [y0];
t = t0:(tfinal-t0)/N:tfinal;
for i=1:N,
y1 = y(i)+h*Dynamics(t(i),y(i));
y2 = y1+h*Dynamics(t(i)+h,y1);
y = [y,(y(i)+y2)/2];
end
return
