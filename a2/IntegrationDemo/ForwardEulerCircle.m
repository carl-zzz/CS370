function [ position ] = ForwardEulerCircle( position, dt )

    position = position + dt*[-position(2); position(1)];

end

