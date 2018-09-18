close all;clear all;
G=sparse(7,7);
G(2,1)=1;
G(3,1)=1;
G(3,2)=1;
G(1,4)=1;
G(4,2)=1;
G(2,6)=1;
G(2,7)=1;
G(3,7)=1;
G(5,3)=1;
G(6,5)=1;
G(7,6)=1;
G(4,6)=1;
G(4,5)=1;
G(6,7)=1;
subplot(2,1,1);
spy(G);
title('sparsity pattern of G');

[p, it] = PageRank(G, 0.75);

subplot(2,1,2);
bar(p);
xlabel('Page');
ylabel('Rank Score');