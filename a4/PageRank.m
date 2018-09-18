function [p, it] = PageRank(G, alpha)

n=length(G);
d=zeros(1,n);
e=ones(n,1);
et=ones(1,n);
for j=1:n;
    count=0;
    for i=1:n;
        if G(i,j)==1;
            count=count+1;
        end
    end
    
    if count==0;
       d(j)=1;
    end
    
    for i=1:n;
        if G(i,j)==1;
            G(i,j)=G(i,j)/count;
        end
    end
end

M=sparse(n,n);
M=alpha*(G+1/n*e*d)+(1-alpha)/n*e*et;

p=e/n;

it = 0;
while max(abs(M*p-p))>=10^(-7)
    it=it+1;
    p=M*p;
end
p=M*p;
it=it+1;


