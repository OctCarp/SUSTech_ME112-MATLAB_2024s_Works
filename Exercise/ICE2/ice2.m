%% Problem 1
clear; close all; clc;

M = [1 4 5 6 7: 4 5 6 7 8: 2 4 5 5 6: 5 3 4 5 6: 3 7 8 4 3];
N = even_index(M)

function out= even_index(A)
    out = A(2:2:end, 2:2:end); % get the target
end

%% Problem 2
clear; close all; clc;

v = [3 5 6 8 9 0 2 4];
w = flip_it(v)

function out = flip_it(A)
    n = length(A);
    out = zeros(1, n);
    for i=1:n
        out(i)=A(n+1-i);
    end
end

%% Problem 3
clear; close all; clc;

function subarray = top_right(N, n)
    [rows, cols] = size(N);
    
    subarray = zeros(n, n);
    for i = 1:n
        for j = 1:n
            subarray(i, j) = N(i, cols - n + j);
        end
    end
end

% Example usage
N = [1, 2, 3, 4; 
     5, 6, 7, 8; 
     9, 10, 11, 12; 
     13, 14, 15, 16];

n = 2;
result = top_right(N, n);
disp(result);


%% Problem 4
clear; close all; clc;

function res = peri_sum(A)
    res = sum(A(1,:) + A(end,:) + A(:,1)' + A(:,end)') - (A(1,1) + A(1,end) + A(end,1) + A(end,end));
end

A = [1 2 3; 4 5 6; 7 8 9];
result = peri_sum(A);
disp(result); % Display the result


%% Problem 5
clear; close all; clc;


%% Problem 6
clear; close all; clc;

function height = bounce(init_h, times)
    g = 9.8;
    v = sqrt(2 * g * init_h);
    for i = 1:times
        v = 0.85 * v;
    end
    height = v^2 / (2 * g);
end

res = bounce(2, 8);
fprintf('Height after the 8th bounce: %.2f m\n', res);


%% Problem 7
clear; close all; clc;

% Constants
n = 1;
T = 300;
R = 0.08206;
a = 1.39;
b = 0.039;

% Volume range
V = linspace(0.08, 6, 100);

% Calculate pressure using the ideal gas law
P_ideal = n * R * T ./ V;

% Calculate pressure using the van der Waals equation
P_vdw = n * R * T ./ (V - n * b) - n^2 * a ./ V.^2;

% Plotting
figure;
plot(V, P_ideal, 'b', V, P_vdw, 'r');
xlabel('Volume (L)');
ylabel('Pressure (atm)');
title('Pressure vs. Volume');
legend('Ideal Gas Law', 'Van der Waals Equation');
grid on;


%% Problem 8
clear; close all; clc;

x = 10*rand(ceil(10*rand)+2,1);

mysum = 0;
mysum2 = 0;
n = length(x);

for i = 1:n
    mysum = mysum + x(i);
end

cnt = 1;
while(cnt <= n)
    mysum2 = mysum2 + x(cnt);
    cnt = cnt + 1;
end

official_sum = sum(x);

if mysum == official_sum
    disp('Congratulations!!, you did it right')
    load handel;sound(y,Fs)
else
    fprintf('Sorry，.2f ~= %.2f. Please try again. \n' , mysum , sum (x))
end

if mysum2 == official_sum
    disp('Congratulations!!, you did it right for while loop')
else
    fprintf('Sorry，.2f ~= %.2f. Please try while loop again. \n' , mysum , sum (x))
end

%% End
clear; close all; clc;