load('yahoo.mat')

[p, it] = PageRank(G, 0.75);
[y I] = sort(p, 'descend');
for n = 1:min(length(I),10)
disp([num2str(n) ': ' U{I(n)}]);
end