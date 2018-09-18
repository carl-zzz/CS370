clear all; close all;

%load in the data
load('data.mat');
figure(1);

x1 = cell2mat(x(1));
y1 = cell2mat(y(1));
for i=1:length(x1)
    plot(x1(i),y1(i),'o-.');
    hold on
end

x2 = cell2mat(x(2));
y2 = cell2mat(y(2));
for i=1:length(x2)
    plot(x2(i),y2(i),'o-.');
    hold on
end

x3 = cell2mat(x(3));
y3 = cell2mat(y(3));
for i=1:length(x3)
    plot(x3(i),y3(i),'o-.');
    hold on
end
title('Raw Data');
xlabel('X axis');
ylabel('Y axis');
axis(v);



figure(2);
x1 = cell2mat(x(1));
y1 = cell2mat(y(1));
for i=1:(length(x1)-1)
    plot([x1(i) x1(i+1)],[y1(i) y1(i+1)]);
    hold on
end

x2 = cell2mat(x(2));
y2 = cell2mat(y(2));
for i=1:(length(x2)-1)
    plot([x2(i) x2(i+1)],[y2(i) y2(i+1)]);
    hold on
end

x3 = cell2mat(x(3));
y3 = cell2mat(y(3));
for i=1:(length(x3)-1)
    plot([x3(i) x3(i+1)],[y3(i) y3(i+1)]);
    hold on
end
title('Piecewise Linear');
xlabel('X axis');
ylabel('Y axis');
axis(v);

% ******************** figure 3 **************

figure(3);
x1 = cell2mat(x(1));
y1 = cell2mat(y(1));
n = length(y1);
t = 1:n;
y_cs = csape(t,y1,'variational');
n = length(t);
tref = zeros(1,5*(n-1)+1);
for k = 1:n-1
    i = 5*(k-1)+1;
    dt = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/5;
    tref(i+2) = t(k)+2*dt/5;
    tref(i+3) = t(k)+3*dt/5;
    tref(i+4) = t(k)+4*dt/5;
end
tref(5*(n-1)+1) = t(n);
yy = ppval(tref,y_cs);

n = length(x1);
t = 1:n;
x_cs = csape(t,x1,'variational');
n = length(t);
tref = zeros(1,5*(n-1)+1);
for k = 1:n-1
    i = 5*(k-1)+1;
    dx = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/5;
    tref(i+2) = t(k)+2*dt/5;
    tref(i+3) = t(k)+3*dt/5;
    tref(i+4) = t(k)+4*dt/5;
end
tref(5*(n-1)+1) = t(n);
xx = ppval(tref,x_cs);
plot(xx,yy, 'r-', 'LineWidth',4);
hold on;

x1 = cell2mat(x(2));
y1 = cell2mat(y(2));
n = length(y1);
t = 1:n;
y_cs = csape(t,y1,'variational');
n = length(t);
tref = zeros(1,5*(n-1)+1);
for k = 1:n-1
    i = 5*(k-1)+1;
    dt = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/5;
    tref(i+2) = t(k)+2*dt/5;
    tref(i+3) = t(k)+3*dt/5;
    tref(i+4) = t(k)+4*dt/5;
end
tref(5*(n-1)+1) = t(n);
yy = ppval(tref,y_cs);

n = length(x1);
t = 1:n;
x_cs = csape(t,x1,'variational');
n = length(t);
tref = zeros(1,5*(n-1)+1);
for k = 1:n-1
    i = 5*(k-1)+1;
    dx = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/5;
    tref(i+2) = t(k)+2*dt/5;
    tref(i+3) = t(k)+3*dt/5;
    tref(i+4) = t(k)+4*dt/5;
end
tref(5*(n-1)+1) = t(n);
xx = ppval(tref,x_cs);
plot(xx,yy, 'r-', 'LineWidth',4);
hold on;

x1 = cell2mat(x(3));
y1 = cell2mat(y(3));
n = length(y1);
t = 1:n;
y_cs = csape(t,y1,'variational');
n = length(t);
tref = zeros(1,5*(n-1)+1);
for k = 1:n-1
    i = 5*(k-1)+1;
    dt = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/5;
    tref(i+2) = t(k)+2*dt/5;
    tref(i+3) = t(k)+3*dt/5;
    tref(i+4) = t(k)+4*dt/5;
end
tref(5*(n-1)+1) = t(n);
yy = ppval(tref,y_cs);

n = length(x1);
t = 1:n;
x_cs = csape(t,x1,'variational');
n = length(t);
tref = zeros(1,5*(n-1)+1);
for k = 1:n-1
    i = 5*(k-1)+1;
    dx = t(k+1)-t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/5;
    tref(i+2) = t(k)+2*dt/5;
    tref(i+3) = t(k)+3*dt/5;
    tref(i+4) = t(k)+4*dt/5;
end
tref(5*(n-1)+1) = t(n);
xx = ppval(tref,x_cs);
plot(xx,yy, 'r-', 'LineWidth',4);
hold on;


title('Cubic Spline');
xlabel('X axis');
ylabel('Y axis');
axis(v);

% ------------------figure 4---------------------

figure(4);
x1 = cell2mat(x(1));
y1 = cell2mat(y(1));
n = length(y1);
t = 1:n;
y_cs = csape(t,y1,'not-a-knot');
x_cs = csape(t,x1,'not-a-knot');
xx = ppval(t,x_cs);
yy = ppval(t,y_cs);
plot(xx,yy, 'r-', 'LineWidth',4);
hold on;
x1 = cell2mat(x(2));
y1 = cell2mat(y(2));
n = length(y1);
t = 1:n;
y_cs = csape(t,y1,'not-a-knot');
x_cs = csape(t,x1,'not-a-knot');
xx = ppval(t,x_cs);
yy = ppval(t,y_cs);
plot(xx,yy, 'r-', 'LineWidth',4);
hold on;
x1 = cell2mat(x(3));
y1 = cell2mat(y(3));
n = length(y1);
t = 1:n;
y_cs = csape(t,y1,'not-a-knot');
x_cs = csape(t,x1,'not-a-knot');
xx = ppval(t,x_cs);
yy = ppval(t,y_cs);
plot(xx,yy, 'r-', 'LineWidth',4);
hold on;
title('not-a-knot Cubic Spline');
xlabel('X axis');
ylabel('Y axis');

