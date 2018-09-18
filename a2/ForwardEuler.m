function y = ForwardEuler(t0, tfinal, N, y0)
h = (tfinal - t0)/N;
t = t0:(tfinal-t0)/N:tfinal;
y = [ y0 ];
for i = 1:N,
y = [y, y(i)+h*Dynamics(t(i),y(i))];
end
return
