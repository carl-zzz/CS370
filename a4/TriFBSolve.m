function [ x ] = TriFBSolve( L,U,b )

n = length(L);
z = sparse(1,n);
x = sparse(1,n);

z(1)=b(1);
for i=2:n;
    z(i) = b(i)-L(i,i-1)*z(i-1);
end

x(n)=z(n);
for i=n-1:-1:1;
    x(i) = (z(i)-U(i,i+1)*x(i+1))/U(i,i);
end

end

