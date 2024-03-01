% In-Class Exercise – Variables and Arrays
clear; close all; clc;
format compact;

%% Problem 1
disp('Problem 1');
M12 = ones(5, 6);
M12 = 12 .* M12;
M12


%% Problem 2
disp('Problem 2');

%%% a
disp('a.:');
A = rand(randi(9)+1,randi(9)+1);
A


%%% b
disp('b.:');
[rows, cols] = size(A);
rows
cols

%%% c
disp('c.:');
w = A(end, end - 1);
w


%% Problem 3
disp('Problem 3');

%%% a
% clc;

%%% b
% OctCarp HW1, Problem 3

%%% c
disp('c.:');
y = magic(5);
y

%%% d
disp('d.:');
ra = y + 16;
ra

%%% e
disp('e.:');
rd = sqrt(exp(x));
rd
