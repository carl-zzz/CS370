steps = 100;
timestep = 0.35;
position = [2; 0];
figure(1);
clf;
plot(position(1),position(2), 'o',  'MarkerSize',10, ...
    'MarkerEdgeColor','r', ...
    'LineWidth',4);
hold on;

%draw the vector field in the background
[x,y] = meshgrid(-24:1:24, -24:1:24);
u = -y;
v = x;
quiver(x,y,u,v); 

for i = 1:steps
   
   %uncomment one of these three lines to try different schemes
   %position = ForwardEulerCircle(position, timestep);
   %position = ImprovedEulerCircle(position, timestep);
   position = TrapezoidalCircle(position, timestep); 
   
   plot(position(1),position(2), 'o',  'MarkerSize',10, ...
    'MarkerEdgeColor','r',...
    'LineWidth',4);

   %axis([ -24 24 -24 24]); %zoomed out
   axis([ -5 5 -5 5]); %zoomed
   
   pause(0.1); %delay briefly for animation
end

   
