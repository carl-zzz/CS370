function [Y,drop] = Compress(X,tol)
F = im2double(X);
fun1 = @(block_struct) fft2(block_struct.data);
F = blockproc(F,[8 8],fun1);
fun2 = @(block_struct) abs(block_struct.data);
F = blockproc(F,[8 8],fun2);
global count;
global countdrop;
count = 0;
countdrop = 0;

fun = @(block_struct) myfun(block_struct.data,tol);
F = blockproc(F,[8 8],fun);

drop = countdrop/count;

fun3 = @(block_struct) ifft2(block_struct.data);
Y = blockproc(F,[8 8],fun3);
Y = im2uint8(Y);
imshow(Y);

return

function [data] = myfun(f,tol)
global count;
global countdrop;
    Fmax = max(max(f));
    for j=1:numel(f),
        if f(j) ~= 0
            count = count+1;
        end;
        if f(j)<=Fmax*tol && f(j) ~= 0
            f(j) = 0;
            countdrop = countdrop+1;
        end;
    end
    data = f;
return
