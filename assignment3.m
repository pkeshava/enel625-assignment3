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
[b, fval, flag, output] = fminunc(@flikelihood, b0, options);

plot(X,Y);
hold on 
y_ad = fmodel(b);
plot(X,y_ad);


