function fval = flikelihoodchi(params)
global x;
global y;

a = params(1);
b = params(2);
c = params(3);
k = params(4);


eta = y - (a.*x+log(a)*x.^2+b*exp(c.*x));
fval = -(sum(log(eta.^(k/2-1))) - sum(eta/2)-log(2^(k/2))-log(gamma(k/2)));


end