%% Script Information

% ME112 HW 1
% Author: Chunhui XU
% Date: 2024/03/01


%% Problem 1
clear; close all; clc;

r = 0.15; % annual interest rate
L = 50000; % loan amount in dollars

% Define the function and range
N = linspace(0.5, 20, 1000);
P = (r .* L .* (1 + r./12).^(12.*N)) ./ (12 .* ((1 + r./12).^(12.*N) - 1));

% Create the plot for monthly payment vs. number of years
figure;
plot(N, P, 'b');

% Add information for the graph
title('Monthly Payment vs. Number of Years'); % set title
xlabel('Number of Years (N)'); % set x label
ylabel('Monthly Payment (P)'); % set y label
grid on;

% Add my name to the plot using the "text" command
text(10, 1000, 'Chunhui XU');


%% Problem 2
clear; close all; clc;

% a. Create the matrix
A = [20 4 2 6; 6 37 2 3; 8 5 9 9]

% b. assign the first row of A to a vector called x1
x1 = A(1, :) % Selects the first row of A and assigns it to x1

% c. assign the last 2 rows of A to an array called y
y = A(2:end, :) % Selects the last 2 rows of A and assigns them to y

% d. assign the even-numbered columns of A to an array called B
B = A(:, 2:2:end) % Selects the even-numbered columns of A and assigns them to B

% e. assign the transpose of A to C
C = A.' % Transposes A, making it a 4-by-3 array, and assigns it to C

% f. compute the reciprocal of each element of A
reciprocal_A = 1 ./ A % Computes the reciprocal of each element of A

% g. change the number in column 2, row 3 of A to 100
A(3, 2) = 100 % Changes the value in column 2, row 3 of A to 100


%% Problem 3
clear; close all; clc;

t = linspace(0, 2 * pi, 1000);
y_max = sin(4 * t) .* cos(2 * t);

figure;
% XY plot
subplot(1,2,1); % create subplot 1
plot(t, y_max, 'b'); % cartesian coordinates
grid on;
legend('y_{max}^k = sin(4t)cos(2t)');

% Polar plot
subplot(1,2,2); % create subplot 2
polarplot(t, y_max, 'b'); % polar coordinates
rlim([0 1]);
text(0, 0, 'Chunhui XU', 'HorizontalAlignment', 'left');


%% Problem 4
clear; close all; clc;

% a.
% user_input = input('Enter a number: ');
user_input = 5;

% b.
cm_value = user_input * 2.54;
fprintf('%0.2f inches is %0.2f cm\n', user_input, cm_value);

% c.
mm_value = user_input * 25.4;
disp([num2str(user_input, '%0.2f') ' inches is also ' num2str(mm_value, '%0.2f') ' mm']);


%% Problem 5
clear; close all; clc;

N_R = logspace(4, 8, 1000);

% Define D/eps values
D_es = [20, 100, 1000, 10000, 100000];

% Define the Laminar flow
flow = logspace(2.8, 3.3, 1000);

figure;

% For each D/eps value
for i = 1:length(D_es)
    f = 0.25 ./ (log10(1./(3.7 * D_es(i)) + 5.7 ./ N_R.^0.9)).^2; % define the function
    loglog(N_R, f, 'DisplayName', ['D/', char(949), sprintf(' = %d', D_es(i))]);
    hold on; % hold the old graph
end

% Add the line for smooth pipes (f = 64/NR)
loglog(flow, 64./flow, 'DisplayName', 'Laminar flow');

% Add labels, title, and legend
xlabel('Reynolds Number N_R');
ylabel('Friction factor f');
title('Moody''s Diagram');
legend('Location', 'Southwest');
grid on;

% Set the display limit
xlim([10^4 10^8]);
ylim([0.008 0.1]);

% Set Name
text(10^7, 0.09, 'Chunhui XU');

% Set start position
axis([10.^2.8 10.^8 10.^-2.1 10.^-1])


%% Problem 6
clear; close all; clc;

% Define the range of x and y
x = -2:0.1:2;
y = -2:0.1:2;
[X, Y] = meshgrid(x, y);

% Define the function
f = 50 .* Y.^2 .* exp(-X.^2 - 0.5 .* Y.^2);

% Plot the function
figure;
surf(X, Y, f);

% Add information for the graph
title('Chunhui XU''s Plot');
xlabel('x');
ylabel('y');
zlabel('f(x,y) = 50y^2e^{-x^2-0.5y^2}');


%%
clear; close all; clc;
