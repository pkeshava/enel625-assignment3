%% ENEL 625 Assignment 3 Pouyan Keshavarzian Winter 2017
clear all
clc

load('XYdata.mat');
global x ;
global y ;
x = X;
y = Y;

% Okay first I need to write a function that will model the output based on
% the estimated PDF parameters
% Now I need the log-liklihood function to maximize

b0 = [3 2 2 4 4];
options = optimset('LargeScale', 'off', 'HessUpdate', 'bfgs');
[b, fval, flag, output] = fminunc(@flikelihoodgamma, b0, options);

a_gamma = b(1);
b_gamma = b(2);
c_gamma = b(3);
k_gamma = b(4);
theta_gamma = b(5);


plot(X,Y);
hold on 
y_ad_gamma = fmodel(b);
plot(X,y_ad_gamma);
hold off

% Calculating MSE
y_gamma_diff = y_ad_gamma-Y;
y_gamma_diff_squared = y_gamma_diff.^2;
MSE_gamma = sum(y_gamma_diff_squared)/size(Y,2);
%% Normal

clc
clear all
close all

load('XYdata.mat');
global x ;
global y ;
x = X;
y = Y;

% Okay first I need to write a function that will model the output based on
% the estimated PDF parameters
% Now I need the log-liklihood function to maximize

b0 = [3 2 2 4 4];
%options = optimset('LargeScale', 'off', 'HessUpdate', 'bfgs');
%[b, fval, flag, output] = fminunc(@flikelihoodnormal, b0, options);

options = optimset('LargeScale', 'off', 'HessUpdate', 'bfgs');
lb = [-Inf, 11.75,-Inf,-Inf,-Inf];
ub = [];

[b, fval, flag, output] = fmincon(@flikelihoodnormal, b0, [],[],[],[],lb,ub);

%options = optimset('LargeScale', 'off', 'HessUpdate', 'dfp', 'MaxFunEvals', 100000,'MaxIter', 100000);
%[b, fval, flag, output] = fminsearch(@flikelihoodnormal, b0, options);


a_normal = b(1);
b_normal = b(2);
c_normal = b(3);
mu_normal = b(4);
var_normal = b(5);
a_n_curve = 4.494e-9;
b_n_curve = 11.69;
c_n_curve = 2.441;
b_curve = [a_n_curve b_n_curve c_n_curve];

figure;
plot(X,Y);
hold on 
y_ad_normal = fmodel(b);
y_ad_norm_curve = fmodel(b_curve);
plot(X,y_ad_normal);
plot(X,y_ad_norm_curve);
hold off
figure;
xn = -50:0.5:50;
norm = normpdf(xn,mu_normal,sqrt(var_normal));
plot(xn,norm);

% Calculating MSE
y_norm_diff = Y-y_ad_normal;
y_norm_diff_squared = y_norm_diff.^2;
MSE_normal = sum(y_norm_diff_squared)/size(Y,2);
%%

clc

load('XYdata.mat');
global x;
global y;
x = X;
y = Y;

b0 = [3 2 2 4 4];
options = optimset('LargeScale', 'off', 'HessUpdate', 'bfgs');
[b, fval, flag, output] = fminunc(@flikelihoodchi, b0, options);

a_chi = b(1);
b_chi = b(2);
c_chi = b(3);
k_chi = b(4);

plot(X,Y);
hold on 
y_ad_chi = fmodel(b);
plot(X,y_ad_chi);
hold off

% Calculating MSE
y_chi_diff = Y-y_ad_chi;
y_chi_diff_squared = y_chi_diff.^2;
MSE_chi = sum(y_chi_diff_squared)/size(Y,2);

%% Plotting
plot(X,Y);
hold on
plot(X,y_ad_chi);
plot(X,y_ad_normal);
plot(X,y_ad_gamma);
hold off
legend('Original','Chi', 'Normal', 'Gamma');

