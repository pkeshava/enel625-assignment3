
load('XYdata.mat');
figure(1);
plot(X,Y);
figure(2);
histogram(Y);

%%
clc
figure(1);
pd_n = fitdist(Y','Normal');
y_n = pdf(pd_n, X');
plot(X,y_n,'LineWidth',2)

figure(2);
pd_g = fitdist(Y','Gamma');
y_g = pdf(pd_g, X');
plot(X,y_g,'LineWidth',2)

figure(3);
hold on
plot(X,Y)
plot(X,y_n,'LineWidth',2)
plot(X,y_g,'LineWidth',2)
hold off
% figure(3);
% pd = fitdist(Y','Chi-square');
% y = pdf(pd, X');
% plot(X,y,'LineWidth',2)

%%
param = mle(Y);
mu = param(1);
sigma = param(2);
Y = normpdf(X,mu,sigma);
