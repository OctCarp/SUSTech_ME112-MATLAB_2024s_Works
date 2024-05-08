%% Script Information

% ME112 HW 4
% Author: Chunhui XU
% Date: 2024/04/09


%% Problem 1

clear; close all; clc;

% Problem 1a
A = [2 1; 3 -9];
b = [5; 7];
x = A\b; % Solve for x using matrix inversion
disp('1.a:');
fprintf('x = %.6f, y = %.6f\n', x(1), x(2));

% b
A = [-8 -5; -2 7];
b = [4; 10];
x = A\b;
disp('1.b:');
fprintf('x = %.6f, y = %.6f\n', x(1), x(2));

% c
A = [12 -5 0; -3 4 7; 6 2 3];
b = [11; -3; 22];
x = A\b;
disp('1.c:');
fprintf('x = %.6f, y = %.6f, x3 = %.6f\n', x(1), x(2), x(3));

% d
A = [6 -3 4; 12 5 -7; -5 2 6];
b = [41; -26; 16];
x = A\b;
disp('1.d:');
fprintf('x = %.6f, y = %.6f, x3 = %.6f\n', x(1), x(2), x(3));



%% Problem 2

clear; close all; clc;

% a.
disp('a.');

%{
A(BC + A) = B
BC + A = A^{-1}B
BC = A^{-1}B - A
C = B^{-1}(A^{-1}B - A)
%}
disp('$C = B^{-1}(A^{-1}B - A)$');

% b.
disp('b.');

A = [7 9; -2 4;];
B = [4 -3; 7 6;];

C = B \ (A\B - A);
disp('C is')
disp(C);

%% Problem 3

clear; close all; clc;

% a.
disp('a.');

syms x y
eqn1 = -2*x + y == -5;
eqn2 = -2*x + y == 3;
sol = solve([eqn1, eqn2], [x, y]);
if isempty(sol.x)
    disp('No solution');
end

% b.
disp('b.');

syms x y
eqn1 = -2*x + y == 3;
eqn2 = -8*x + 4*y == 12;

disp('x=');
disp(solve([eqn1, eqn2], x));
fprintf('Infinity solutions, one of the solution is:\n')

% c.
disp('c.');

syms x y
eqn1 = -2*x + y == -5;
eqn2 = -2*x + y == -5.00001;
sol = solve([eqn1, eqn2], [x, y]);
if isempty(sol.x)
    disp('No solution')
end

% d.
disp('d.');

syms x1 x2 x3 x4
eqn1 = x1 + 5*x2 - x3 + 6*x4 == 19;
eqn2 = 2*x1 - x2 + x3 - 2*x4 == 7;
eqn3 = -x1 + 4*x2 - x3 + 3*x4 == 30;
eqn4 = 3*x1 - 7*x2 - 2*x3 + x4 == -75;
sol = solve([eqn1, eqn2, eqn3, eqn4], [x1, x2, x3, x4]);

fprintf('x1 = %.6f, x2 = %.6f, x3 = %.6f, x4 = %.6f\n', ...
    sol.x1, sol.x2, sol.x3, sol.x4);


%% Problem 4

clear; close all; clc;

% Define symbolic variables and constants
syms x y z c

% Define the system of equations
eq1 = x - 5*y - 2*z == 11*c;
eq2 = 6*x + 3*y + z == 13*c;
eq3 = 7*x + 3*y - 5*z == 10*c;

% Solve the system of equations for x, y, and z
sol = solve([eq1, eq2, eq3], [x, y, z]);

% Extract the solutions
x_sol = sol.x;
y_sol = sol.y;
z_sol = sol.z;

disp('x =');
disp(x_sol);
disp('y =');
disp(y_sol);
disp('z =');
disp(z_sol);

% Define the range for the parameter c
c_range = -10:0.01:10;

% Evaluate solutions for x, y, and z over the range of c
x_values = subs(x_sol, c, c_range);
y_values = subs(y_sol, c, c_range);
z_values = subs(z_sol, c, c_range);

% Plot the solutions for x, y, and z versus c
plot(c_range, x_values);
hold on;
plot(c_range, y_values);
plot(c_range, z_values);
xlabel('c');
ylabel('Value');
title('Solutions for x, y, and z versus c');
legend('x', 'y', 'z');
grid on;

%% Problem 5

clear; close all; clc;

theta1_tf = 43; theta1_0 = -19;
theta2_tf = 151; theta2_0 = 44;
tf = 2;

syms a1 a2 a3 b1 b2 b3

t = tf;

%{
For t == tf:
a1*t^3 + a2*t^4 + a3*t^5 = theta1(t)-theta1(0);
a1*3*t^2 + a2*4*t^3 + a3*5*t^4 = 0;
a1*6*t + a2*12*t^2 + a3*20*t^3 = 0;
%}
eqn1 = [t^3 t^4 t^5; 3*t^2 4*t^3 5*t^4; 6*t 12*t^2 20*t^3;] * ... 
    [a1; a2; a3;] == [theta1_tf-theta1_0; 0; 0;];

%{ 
For t == tf:
b1*t^3 + b2*t^4 + b3*t^5 = theta2(t)-theta2(0);
b1*3*t^2 + b2*4*t^3 + b3*5*t^4 = 0;
b1*6*t + b2*12*t^2 + b3*20*t^3 = 0;
%}
eqn2 = [t^3 t^4 t^5; 3*t^2 4*t^3 5*t^4; 6*t 12*t^2 20*t^3;] * ... 
    [b1; b2; b3;] == [theta2_tf-theta2_0; 0; 0;];

% b.
disp('b.');

sol1 = solve(eqn1, [a1 a2 a3]);
sol2 = solve(eqn2, [b1 b2 b3]);

a1r = sol1.a1; a2r = sol1.a2; a3r = sol1.a3;
fprintf('a1 = %.4f, a2 = %.4f, a3 = %.4f\n', a1r, a2r, a3r);
b1r = sol2.b1; b2r = sol2.b2; b3r = sol2.b3;
fprintf('b1 = %.4f, b2 = %.4f, b3 = %.4f\n', b1r, b2r, b3r);


%
disp('c.');

L1 = 4;
L2 = 3;

ts = 0:0.01:2;
theta1_t = theta1_0 + (a1r.*ts.^3 + a2r.*ts.^4 + a3r.*ts.^5);
theta2_t = theta2_0 + (b1r.*ts.^3 + b2r.*ts.^4 + b3r.*ts.^5);

X = L1.*cosd(theta1_t) + L2.*cosd(theta1_t + theta2_t);
Y = L1.*sind(theta1_t) + L2.*sind(theta1_t + theta2_t);

figure;

plot(X, Y);
grid on;
xlabel('x(ft)');
ylabel('y(ft)');
title('Trace');

%% Problem 6

clear; close all; clc;

R1 = 0.036;
R2 = 4.01;
R3 = 0.408;
R4 = 0.038;

T_i = 20;
T_o = -10;

syms T1 T2 T3 q
eqn1 = (T_i - T1)/R1 == (T1 - T2)/R2;
eqn2 = (T1 - T2)/R2 == (T2 - T3)/R3;
eqn3 = (T2 - T3)/R3 == (T3 - T_o)/R4;
eqn4 = q == (T3 - T_o)/R4;

sol = solve([eqn1, eqn2, eqn3, eqn4], [T1, T2, T3, q]);
fprintf('T1 = %.4f °C, T2 = %.4f °C, T3 = %.4f °C\n q = %.4f W\n', ...
    sol.T1, sol.T2, sol.T3, sol.q);

