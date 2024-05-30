%% Script Information

% ME112 HW 6
% Author: Chunhui XU
% Date: 2024/05/19


%% Problem 1

clear; close all; clc;

syms x y z a b

% 1.

eq1 = 3*x^2 + 7*x*y + 4 == 0;
eq2 = a*y + b*x == z;
eq3 = x - 2*y + 2*z == 0;

% 2.
disp('2. Solve for X');

sol_eq1 = solve(eq1, x);
sol_eq2 = solve(eq2, x);
sol_eq3 = solve(eq3, x);

disp('Two solutions for equation 1 x:');
disp(sol_eq1);
disp('Solution for equation 2 x:');
disp(sol_eq2);
disp('Solution for equation 3 x:');
disp(sol_eq3);

% 3.
disp('3. Solve the system of equations:');

[sol_x, sol_y, sol_z] = solve([eq1, eq2, eq3], [x, y, z]);

disp('Solution 1 for x, y, z respectively:');
disp(sol_x(1));
disp(sol_y(1));
disp(sol_z(1));

disp('Solution 2 for x, y, z respectively:');
disp(sol_x(2));
disp(sol_y(2));
disp(sol_z(2));

% 4.
disp('4. Substitute values');
sol_x_subs = subs(sol_x, [a, b], [4, 0.3]);
sol_y_subs = subs(sol_y, [a, b], [4, 0.3]);
sol_z_subs = subs(sol_z, [a, b], [4, 0.3]);

disp('Solution 1 for x, y, z respectively:');
disp(sol_x_subs(1));
disp(sol_y_subs(1));
disp(sol_z_subs(1));

disp('Solution 2 for x, y, z respectively:');
disp(sol_x_subs(2));
disp(sol_y_subs(2));
disp(sol_z_subs(2));

% 5.
disp('5. Decimal solutions:');

sol_x_decimal = double(sol_x_subs);
sol_y_decimal = double(sol_y_subs);
sol_z_decimal = double(sol_z_subs);

disp('Solution 1 for x, y, z respectively:');
disp(sol_x_decimal(1));
disp(sol_y_decimal(1));
disp(sol_z_decimal(1));

disp('Solution 2 for x, y, z respectively:');
disp(sol_x_decimal(2));
disp(sol_y_decimal(2));
disp(sol_z_decimal(2));


%% Problem 2

clear; close all; clc;

% 1.
coefficients = [0.3, 0, 0, -3, 4.1, -5];

syms x;
polynomial = poly2sym(coefficients, x);

first_derivative = diff(polynomial, x);
second_derivative = diff(first_derivative, x);
integral_function = int(polynomial, x);

% 2.

x_values = linspace(-4, 4, 1000);

y_polynomial = double(subs(polynomial, x, x_values));
y_first_derivative = double(subs(first_derivative, x, x_values));
y_second_derivative = double(subs(second_derivative, x, x_values));
y_integral = double(subs(integral_function, x, x_values));

figure;

subplot(2,2,1);
ezplot(polynomial, [-4, 4]);
title('Polynomial:');

subplot(2,2,2);
ezplot(first_derivative, [-4, 4]);
title('First Derivative');

subplot(2,2,3);
ezplot(second_derivative, [-4, 4]);
title('Second Derivative');

subplot(2,2,4);
ezplot(integral_function, [-4, 4]);
title('Integral');

% Add your name to one of the subplots
subplot(2,2,1);
text(0,0,'Chunhui XU');


%% Problem 3

clear; close all; clc;

% Import data from dotData.txt
data = importdata('dotData.txt');

% Create a figure
figure;
hold on;

% Plot circles at each x,y coordinate with diameter equal to size value
for i = 1:size(data, 1)
    rectangle('Position', ...
        [data(i,1)-data(i,3)/2, data(i,2)-data(i,3)/2, data(i,3), data(i,3)], ...
        'Curvature', [1, 1], 'FaceColor', 'k', 'EdgeColor', 'k');
end

% Hide the numbers around the perimeter of the plot
axis off;

% Add your name to the figure
text(0, 0, 'Chunhui XU', 'FontSize', 12);

% Set aspect ratio to equal for circles to appear round
axis equal;

hold off;



%% Problem 4

clear; close all; clc;

% 1.

x = 0:10:360;
y = sind(x);
theta = 0;

figure;

h = plot(x, y);

xlim([0, 360]);
ylim([-1, 1]);

% Hold the axis
hold on;

while theta <= 720
    y_plot = y .* sind(theta);
    set(h, 'YData', y_plot);
    text(300, 0.8, 'Chunhui XU', 'FontSize', 12);
    pause(0.1);
    theta = theta + 10;
end

hold off;

% 2.

% x = 0:10:360;
% y = sind(x);
% h = plot(x, y);
% xlim([0, 360]);
% ylim([-1, 1]);


theta_values = 0:10:720;
step_num = length(theta_values);
frames(step_num) = struct('cdata',[],'colormap',[]);

hold on;
for i = 1:step_num
    theta = theta_values(i);
    y_plot = y .* sind(theta);
    set(h, 'YData', y_plot);
    text(300, 0.8, 'Chunhui XU', 'FontSize', 12);
    frames(i) = getframe(gcf);
end

hold off;

mov = VideoWriter('p42.avi');
open(mov);
writeVideo(mov, frames);
close(mov);

gif_path = 'p42.gif';

for i = 1:10
    image = frame2im(frames(i));
    [X, cmap] = rgb2ind(image, 256);
    if i == 1
        imwrite(X, cmap, gif_path, 'DelayTime', 0.1, 'LoopCount', inf);
    else
        imwrite(X, cmap, gif_path, 'DelayTime', 0.1, 'WriteMode', 'append');
    end
end

%% Problem 5

clear; close all; clc;

user_input = 30;
while user_input < 20 || user_input > 100
    user_input = input('Enter a value between 20 and 100: ');
end

frame_num = user_input - (5-1);
frames(frame_num) = struct('cdata',[],'colormap',[]);

k = 5;
increase = true; 
i = 1;

figure;

while true
    plot(fft(eye(k)));
    axis equal;
    axis([-1 1 -1 1]);
    set(gca, 'XTick', [], 'YTick', []);
    frames(i) = getframe(gcf);
    pause(0.05);

    if increase
        k = k + 2;
        if k >= user_input
            k = user_input;
            increase = false;
        end
    else
        k = k - 2;
        if k <= 5
            k = 5;
            increase = true;
        end
    end

    if k == 5 && increase
        break;
    end

    i = i + 1;
end


mov = VideoWriter('p5.avi');
open(mov);
writeVideo(mov, frames);
close(mov);

%% End

clear; close all; clc;


