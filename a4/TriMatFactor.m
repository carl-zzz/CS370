function [L,U] = TriMatFactor(A)

n = length(A);
L = sparse(n,n);
U = sparse(n,n);
B= A; %copy of A

L(1,1)=1;
U(1,1)=A(1,1);
for i=2:n;
    L(i,i)=1;
    U(i-1,i)=B(i-1,i);
    
    L(i,i-1)=B(i,i-1)/B(i-1,i-1);
    B(i,i)=B(i,i)-L(i,i-1)*B(i-1,i);
    U(i,i)=B(i,i);
end

% disp('LU='); disp(L*U);

end

