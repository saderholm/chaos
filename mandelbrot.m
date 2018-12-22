%% Mandelbrot set graphing
close all;clear all;
% Create complex plane from -2 to 2 and -2i to 2i
iter = 10000;
lim = 500;
real = linspace(-2,2,iter);
imagin = linspace(-2,2,iter);

c = zeros(iter);
f = zeros(iter);
fpre = zeros(iter);
flag = zeros(iter);

for j = 1:iter % imaginary axis
    for r = 1:iter % real axis
        its = 0;
        c(r,j) = complex(real(r),imagin(j));
        while abs(f(r,j)) < 2 && its < lim
            f(r,j) = fpre(r,j)^2 + c(r,j);
            fpre(r,j) = f(r,j);
            its = its + 1;
        end
        flag(j,r) = its;
    end 
end

figure(1)
%imagesc([-2 2],[-2 2],flag);
imagesc(flag);
colorbar

