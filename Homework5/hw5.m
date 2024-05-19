%% Script Information

% ME112 HW 5
% Author: Chunhui XU
% Date: 2024/04/17


%% Problem 1

clear; close all; clc;

f = @(x) (x + 1./x).^2;

a = 1;
b = 2;

syms x;
std_sol = int((x + 1/x)^2, x, a, b);
fprintf('True value is %.4f\n', std_sol);

for n = 1:4
    X = linspace(a, b, n+1);
    Y = f(X);
    trapz_res = trapz(X, Y);
    
    err = abs((std_sol - trapz_res) / std_sol);
    
    fprintf('For n = %d: \n', n);
    fprintf('Approximation: %.6f, error: %.6f%%\n', trapz_res, err * 100);
end



%% Problem 2

clear; close all; clc;

f = @(x) x.^2 .* exp(x);
a = 0; b = 3;

syms x_sym
std_sol = int(x_sym .^2 .* exp(x_sym), a, b);

n = 4;
X = linspace(a, b, n+1);
Y = f(X);
trapz_res = trapz(X, Y);

simpsons_res = simpson13_multiple(f, a, b, 4);

% Calculate percent relative errors
trapz_err = abs((std_sol - trapz_res) / std_sol) * 100;
simpsons_err = abs((std_sol - simpsons_res) / std_sol) * 100;

% Display results
fprintf('Analytical Result: %.6f\n', std_sol);
fprintf('Trapezoidal Result: %.6f, Error: %.6f%%\n', trapz_res, trapz_err);
fprintf('Simpson''s 1/3 Result: %.6f, Error: %.6f%%\n', ...
    simpsons_res, simpsons_err);

function I = simpson13_multiple(f, a, b, n)
    intervals = linspace(a, b , n+1);
    y = f(intervals);

    n1 = y(1) + y(n+1);
    n2 = 0; n3 = 0;
    for i=2:n
       if rem(i,2)==0
           n2 = n2 + 4*y(i);
       else 
           n3 = n3 + 2*y(i); 
       end
    end
    I=(b-a) * (n1+n2+n3) / (3*n);
end



%% Problem 3

clear; close all; clc;

a = 0; b = 10;

y_data = [0, 1, 3, 5, 7, 8, 9, 10];
H_data = [0, 1, 1.5, 3, 3.5, 3.2, 2, 0]; 
U_data = [0, 0.1, 0.12, 0.2, 0.25, 0.3, 0.15, 0];
H_pp = spline(y_data, H_data);
U_pp = spline(y_data, U_data);

H_f = @(x) ppval(H_pp, x);
U_f = @(x) ppval(U_pp, x);

% a.
disp('a.');

I_H = integral(H_f, a, b);
avg_depth = I_H / (b-a);
fprintf('Average Depth: %.4f m\n', avg_depth);


% b.
disp('b.');

Ac = I_H;
fprintf('Cross-sectional Area: %.4f m^2\n', Ac);


% c.
disp('c.');

avg_velocity = integral(U_f, a, b) / (b -a);
fprintf('Average Velocity: %.4f m/s\n', avg_velocity);

% d.
disp('d.');

dQ = @(x) ppval(U_pp, x) .* ppval(H_pp, x);
Q = integral(dQ, a, b);
fprintf('Flow Rate: %.4f m^3/s\n', Q);



%% Problem 4

clear; close all; clc;

t_data = [0 1 5.5 10 12 14 16 18 20 24];
c_data = [1 1.5 2.3 2.1 4 5 5.5 5 3 1.2];

a = 0; b = 24;

c_pp = spline(t_data, c_data);
c_f = @(x) ppval(c_pp, x);
Q_f = @(t) 20 + 10 .* sin(2.*pi./24.*(t-10));
dUp = @(x) c_f(x) .* Q_f(x);

I_res = integral(dUp, a, b) / integral(Q_f, a, b);

fprintf('Final result is %.6f\n', I_res);



%% Problem 5

clear; close all; clc;

% a. 
disp('a.');

t_data = [7.5 7.75 8 8.25 8.75 9.25];
R_data = [18 24 26 20 18 9].* (60/4);

n = length(R_data);

n1 = R_data(1) + R_data(n);
n2 = 0; n3 = 0;
for i=2:n-1
   if rem(i,2)==0
       n2 = n2 + 4*R_data(i);
   else 
       n3 = n3 + 2*R_data(i); 
   end
end

pass_total=(t_data(n)-t_data(1)) * (n1+n2+n3) / (3*(n-1));

fprintf('Total number is %.4f\n', pass_total);

% b.

disp('b.');

per_m = pass_total / ((t_data(n) - t_data(1)) * 60);

fprintf('Pass per minute is %.4f\n', per_m);


%% End

clear; close all; clc;


