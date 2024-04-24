%% Script Information

% ME112 ICE Linear Equations
% Author: Chunhui XU
% Date: 2024/04/10


%% Problem 1
clear; close all; clc;

syms x y z

eqn1 = 7*x + 9*y - 9*z == 22;
eqn2 = 3*x + 2*y - 4*z == 12;
eqn3 = x + 5*y - z == -2;

disp('No unique solution, we can assume z is already known:')
sol = solve([eqn1, eqn2, eqn3], [x, y]);
disp(sol);

disp('Assume z = 0, we have:')
sol = solve([eqn1, eqn2, eqn3], [x, y, z]);
fprintf('x = %.4f, y = %.4f, z = %.4f\n', sol.x, sol.y, sol.z);


%% Problem 2
clear; close all; clc;

% a.
disp('a.');

syms a b c

eqn1 = a + b + c == 4;
eqn2 = 16*a + 4*b + c == 73;
eqn3 = 25*a + 5*b + c == 120;

sol = solve([eqn1, eqn2, eqn3], [a, b, c]);

fprintf('a = %.4f, b = %.4f, c = %.4f\n', sol.a, sol.b, sol.c);


% b.
clear;
disp('b.');

syms a b c d

eqn1 = a + b + c + d == 4;
eqn2 = (4^3)*a + (4^2)*b + 4*c + d == 73;
eqn3 = (5^3)*a + (5^2)*b + 5*c + d == 120;

sol = solve([eqn1, eqn2, eqn3], [a, b, c]);
disp('No unique solution, we can assume d is already knwon:');
disp(sol);

sol = solve([eqn1, eqn2, eqn3], [a, b, c,d]);
disp('Assume d = 0, we have:')
fprintf('a = %.4f, b = %.4f, c = %.4f, d = %.4f\n', ...
    sol.a, sol.b, sol.c, sol.d);


%% Problem 3
clear; close all; clc;

syms T1 T2 T3 T4

eqn1 = T1 == (1/3) * (150 + T2 + T3);
eqn2 = T2 == (1/2) * (T1 + T4);
eqn3 = T3 == (1/2) * (T1 + T4);
eqn4 = T4 == (1/3) * (T2 + T3 + 20);

sol = solve([eqn1, eqn2, eqn3, eqn4], [T1, T2, T3, T4]);
fprintf('T1 = %.4f, T2 = %.4f, T3 = %.4f, T4 = %.4f\n', ...
    sol.T1, sol.T2, sol.T3, sol.T4);


%% Problem 4
clear; close all; clc;

syms T1 T2 T3 T4 T5 T6 T7 T8 T9

eqn1 = 150 - T1 == (T1 - T4) + (T1 - T2);
eqn2 = T1 - T2 == (T2 - T3) + (T2 - T5);
eqn3 = T2 - T3 == T3 - T6;
eqn4 = T1 - T4 == (T4 - T5) + (T4 - T7);
eqn5 = (T2 - T5) + (T4 -T5) == (T5 - T6) + (T5 - T8);
eqn6 = (T3 - T6) + (T5 - T6) == T6 - T9;
eqn7 = T4 - T7 == T7 - T8;
eqn8 = (T7 - T8) + (T5 -T8) == T8 - T9;
eqn9 = (T6 - T9) + (T8 - T9) == T9 - 20;

sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7, eqn8, eqn9], ...
    [T1, T2, T3, T4, T5, T6, T7, T8, T9]);

fprintf('T1 = %.4f, T2 = %.4f, T3 = %.4f\n', sol.T1, sol.T2, sol.T3);
fprintf('T4 = %.4f, T5 = %.4f, T6 = %.4f\n', sol.T4, sol.T5, sol.T6);
fprintf('T7 = %.4f, T8 = %.4f, T9 = %.4f\n', sol.T7, sol.T8, sol.T9);

%% Problem 5
clear; close all; clc;

% a.
disp('a.:');

A = [6 2 10; 3 5 2];
b = [35; 40];

rank_A = rank(A);
rank_Ab = rank([A b]);

disp('Rank A = 2, do not have solution.');

r_Ab = rref([A b]);

x_coef = -r_Ab(1,3);
x_b = r_Ab(1,4);
y_coef = -r_Ab(2,3);
y_b = r_Ab(2,4);

disp('Consider z is costant, then:');
fprintf('x = %.4fz + %.4f\n', x_coef, x_b);
fprintf('y = %.4fz + %.4f\n', y_coef, y_b);


% b.
disp('b.:');

z_min = 0;
z_max = x_b / -x_coef;
x_min = 0;
x_max = x_b;
y_min = y_b;
y_max = z_max * y_coef + y_b;

fprintf('%.4f <= x <= %.4f\n', x_min, x_max);
fprintf('%.4f <= y <= %.4f\n', y_min, y_max);
fprintf('%.4f <= z <= %.4f\n', z_min, z_max);


%c.
disp('c.:');

f = @(z) -(200*(x_coef*z+x_b)+300*(y_coef*z+y_b)+100*z);

z_tar=fminbnd(f, z_min,z_max);
fprintf('Max profit = %.4f\n', f(z_tar));

%% Problem 6
clear; close all; clc;

syms f1 f2 f3 f4 f5 f6 f7
eqn1 =  f1 + f3 == 300; 
eqn2 = f1 + 300 == f2 + f4; 
eqn3 = f2 + f5 == 600; 
eqn4 = f3 + f6 == 400; 
eqn5 = f4 + f7 == f6 + 200;
eqn6 = f5 + f7 == 600;

disp('No unique solution, rank 5 for 7 unknwon f');
disp('Need 2 more f, assmue we know f6 and f7:');

symb_sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], ...
    [f1, f2, f3, f4, f5]);
disp(symb_sol);