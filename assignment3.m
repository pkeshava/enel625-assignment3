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
%% Normal

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
options = optimset('LargeScale', 'off', 'HessUpdate', 'dfp');
%[b, fval, flag, output] = fminunc(@flikelihoodnormal, b0, options);
[b, fval, flag, output] = fminsearch(@flikelihoodnormal, b0, options);
%phat = mle(Y,'nloglf',@flikelihoodnormal,'start',b0);

a_normal = b(1);
b_normal = b(2);
c_normal = b(3);
mu_normal = b(4);
var_normal = b(5);


plot(X,Y);
hold on 
y_ad_normal = fmodel(b);
plot(X,y_ad_normal);
hold off
%%

clc

load('XYdata.mat');
global x;
global y;
x = X;
y = Y;

% Okay first I need to write a function that will model the output based on
% the estimated PDF parameters
% Now I need the log-liklihood function to maximize

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
%%
plot(X,Y);
hold on
plot(X,y_ad_chi);
plot(X,y_ad_normal);
plot(X,y_ad_gamma);
hold off
legend('Original','Chi', 'Normal', 'Gamma');
