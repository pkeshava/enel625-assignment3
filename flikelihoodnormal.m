function fval = flikelihoodnormal(params)
global x;
global y;

a = params(1);
b = params(2);
c = params(3);
mu = params(4);
var = params(5);

eta = y - (a.*x+log(a)*x.^2+b*exp(c.*x));
n = size(eta,2);

fval = -(-n/2*log(2*pi)-n/2*log(var)-1/(2*var)*sum((eta-mu).^2));


end