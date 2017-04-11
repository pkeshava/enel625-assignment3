function fval = flikelihoodgamma(params)
global x;
global y;

a = params(1);
b = params(2);
c = params(3);
k = params(4);
theta = params(5);

eta = y - (a.*x+log(a)*x.^2+b*exp(c.*x));
fval = -((k-1)*sum(log(eta)) - sum(eta)/theta - size(eta,2)*k*log(theta) - size(eta,2)*log(gamma(k)));

% for i = 1:1000
%     term1(i) = log(y(i));
% end
% term1 = (params(3)-1)*sum(term1);
% term2 = y/params(4);
% term2 = sum(term2);
% 
% term3 = 10000*params(3)*log(params(4));
% term4 = 10000*log(gamma(params(3)));
% 
% fval = - (term1 - term2 - term3 - term4);
end