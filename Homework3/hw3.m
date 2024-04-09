%% Script Information

% ME112 HW 3
% Author: Chunhui XU
% Date: 2024/03/24


%% Problem 1
clear; close all; clc;

t = 60 * 24 * 3600;
T_s = -15;
T_i = 20;
T = 0;
alpha = 1.38e-7;

f = @(x) (erf(x / (2 * sqrt(alpha * t))) - ((T - T_s) / (T_i - T_s)));

x = fzero(f, 1); % search from 1 depth

fprintf('Water main should be buried %.2f meters deep to prevent freezing.\n', x);


%% Problem 2
clear; close all; clc;

t = [0 3.15 6.2 10 18.3 30.8 43.8];
C = [0.1039 0.0896 0.0776 0.0639 0.0353 0.0207 0.0101];

% C(t) = C_1*e^(-k*t)
% ln(C) =  -kt + C_1

lnC = log(C);

p1 = polyfit(t, lnC, 1);

fprintf("The value of K is %.5f", -p1(1));

fit = polyval(p1, t);

figure;
hold on;
plot(lnC, fit);

%% Problem 3
clear; close all; clc;

time = [1 2 3 4 5 6 7 8 9 10];
pressure = [26.1 27.0 28.2 29.0 29.8 30.6 31.1 31.3 31.0 30.5];

% Fit first-degree polynomial
p1 = polyfit(time, pressure, 1);
fit1 = polyval(p1, time);

% Fit second-degree polynomial
p2 = polyfit(time, pressure, 2);
fit2 = polyval(p2, time);

% Fit third-degree polynomial
p3 = polyfit(time, pressure, 3);
fit3 = polyval(p3, time);

% R
y_total = sum((pressure-mean(pressure)).^ 2);

rsq_1 = 1 - (sum((pressure - fit1) .^ 2) ./ y_total);
rsq_2 = 1 - (sum((pressure - fit2) .^ 2) ./ y_total);
rsq_3 = 1 - (sum((pressure - fit3) .^ 2) ./ y_total);

% Plot the curve fits
figure;
plot(time, pressure, 'o', 'MarkerSize', 8);
hold on;
plot(time, fit1, 'r');
plot(time, fit2, 'g');
plot(time, fit3, 'b');
legend('Data Points', 'First-Degree Fit', 'Second-Degree Fit', ...
    'Third-Degree Fit', 'Location','northwest');
xlabel('Time (sec)');
ylabel('Pressure (psi)');
title('Polynomial Curve Fitting');

fprintf('Predicted pressure at t = 11 sec:\n');
fprintf('1st-Degree Fit: %.2f psi, R^2 = %.4f\n', polyval(p1, 11), rsq_1);
fprintf('2nd-Degree Fit: %.2f psi, R^2 = %.4f\n', polyval(p2, 11), rsq_2);
fprintf('3rd-Degree Fit: %.2f psi, R^2 = %.4f\n', polyval(p3, 11), rsq_3);

fprintf(['Cruve 3 is more reliable, ' ...
    'it have largest coefficients of determination and the residuals'])


%% Problem 4
clear; close all; clc;

% X Y data
X = [0, 0.25, 0.75, 1.25, 1.5, 1.75, 1.875, 2, 2.125, 2.25];
Y = [1.2, 1.18, 1.1, 1, 0.92, 0.8, 0.7, 0.55, 0.35, 0];

X_entire = 0:0.001:2.25;

% Fit the data by interp1 function
Y_entire = interp1(X, Y, X_entire, 'linear');


plot(X, Y, 'o', X_entire, Y_entire, '-');
legend('Original Data Points', 'Interpolated Fender Curve');
xlabel('X (ft)');
ylabel('Y');
title('Interpolated Fender Shape');


%% Problem 5
clear; close all; clc;

T = [0 8 16 24 32 40];
o = [14.621 11.843 9.870 8.418 7.305 6.413];

o_linear = interp1(T, o, 27, 'linear');

p = polyfit(T, o, length(T)-1);
o_newton = polyval(p, 27);

spline = spline(T, o);
o_spline = interp1(T, o, 27, 'spline');

% Display the results
fprintf('Linear Interpolation: %.4f mg/L\n', o_linear);
fprintf('Newton''s Interpolating Polynomial: %.4f mg/L\n', o_newton);
fprintf('Cubic Splines: %.4f mg/L\n', o_spline);
fprintf('Exact Result:7.986 mg/L\n');


%% Problem 6
clear; close all; clc;

t = linspace(0, 2*pi, 8);
f = sin(t).^2;

p = polyfit(t, f, 7);
t_interp = linspace(0, 2*pi, 1000);
f_interp = polyval(p, t_interp);

figure;
plot(t, f, 'o', t_interp, f_interp);
title('Seventh-order interpolating polynomial fit');
legend('Original data', 'Interpolating polynomial');

spline_fit = spline(t, f, t_interp);

figure;
plot(t, f, 'o', t_interp, spline_fit);
title('Cubic spline fit');
legend('Original data', 'Cubic spline');

%% Problem 7

% handdata.m start
close all
clear; clc
x=[0.586031175059952;0.608213429256595;0.623800959232614;0.638788968824940;
    0.650779376498801;0.673561151079137;0.670563549160672;0.675359712230216;
    0.674760191846523;0.660371702637890;0.623800959232614;0.609412470023981;
    0.599220623501199;0.590827338129497;0.575239808153477;0.568645083932854;
    0.565647482014389;0.560851318944844;0.560851318944844;0.563249400479616;
    0.560851318944844;0.562050359712230;0.553657074340528;0.544064748201439;
    0.516486810551559;0.511690647482014;0.511091127098321;0.508693045563549;
    0.506294964028777;0.503896882494005;0.497302158273381;0.486510791366907;
    0.470323741007194;0.463129496402878;0.460731414868106;0.455935251798561;
    0.440347721822542;0.420563549160672;0.410971223021583;0.396582733812950;
    0.380995203836931;0.372002398081535;0.380995203836931;0.398381294964029;
    0.401978417266187;0.413968824940048;0.426558752997602;0.423561151079137;
    0.416966426858513;0.407374100719425;0.393585131894484;0.380395683453237;
    0.361810551558753;0.348621103117506;0.335431654676259;0.322242206235012;
    0.318645083932854;0.325839328537170;0.345023980815348;0.367206235011990;
    0.379796163069544;0.376199040767386;0.361810551558753;0.337829736211031;
    0.317446043165468;0.294664268585132;0.264688249400480;0.244304556354916;
    0.236510791366907;0.240107913669065;0.263489208633094;0.314448441247002;
    0.339628297362110;0.360011990407674;0.365407673860911;0.390587529976019;];
y=[0.160640495867769;0.218491735537190;0.288739669421488;0.335227272727273;
    0.412706611570248;0.474690082644628;0.537706611570248;0.576962809917355;
    0.606921487603306;0.614152892561984;0.586260330578512;0.533574380165289;
    0.464359504132231;0.438533057851240;0.447830578512397;0.509814049586777;
    0.556301652892562;0.584194214876033;0.674070247933884;0.731921487603306;
    0.760847107438017;0.820764462809917;0.868285123966942;0.889979338842975;
    0.892045454545455;0.835227272727273;0.763946280991736;0.704028925619835;
    0.630681818181818;0.592458677685950;0.579028925619835;0.571797520661157;
    0.608987603305785;0.643078512396694;0.698863636363636;0.731921487603306;
    0.779442148760331;0.864152892561984;0.894111570247934;0.909607438016529;
    0.905475206611570;0.885847107438017;0.821797520661157;0.733987603305785;
    0.678202479338843;0.624483471074380;0.552169421487603;0.543904958677686;
    0.559400826446281;0.612086776859504;0.668904958677686;0.709194214876033;
    0.807334710743802;0.838326446280992;0.840392561983471;0.822830578512397;
    0.805268595041322;0.746384297520661;0.642045454545455;0.555268595041322;
    0.501549586776860;0.472623966942149;0.474690082644628;0.505681818181818;
    0.531508264462810;0.563533057851240;0.616219008264463;0.625516528925620;
    0.601756198347107;0.567665289256198;0.505681818181818;0.430268595041322;
    0.363119834710744;0.302169421487603;0.258780991735537;0.151342975206612;];

%handdata.m end

% Define t from 1 to 76
t = 1:76;

% Interpolate x and y with respect to t
x_interpolated = interp1(t, x, t, 'spline');
y_interpolated = interp1(t, y, t, 'spline');

% Plot interpolated curve
figure;
plot(x,y,'o');
hold on;
plot(x_interpolated, y_interpolated);

xlabel('x');
ylabel('y');
title('Interpolated Curve of Hand Data');

%% End

clc, close all;
clear;