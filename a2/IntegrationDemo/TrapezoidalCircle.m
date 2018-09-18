function [ position ] = Trapezoidal_lagrangian( position, dt )

A = [1 dt/2; -dt/2 1];
rhs = [position(1) - dt/2*position(2); dt/2*position(1)+position(2)];

position = A\rhs;

end

