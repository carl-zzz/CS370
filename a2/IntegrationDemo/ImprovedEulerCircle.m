function [ position ] = ImprovedEulerCircle( position, dt )

pos_forward = ForwardEulerCircle(position, dt);
position = position + dt/2*([-position(2); position(1)] + [-pos_forward(2); pos_forward(1)]);

end

