function ymodel = fmodel(params)
global x;

a = params(1);
b = params(2);
c = params(3);

for i =1:10000
    ymodel(i) = a.*x(i) + log10(a).*x(i)^2+b*exp(c.*x(i));
end

end