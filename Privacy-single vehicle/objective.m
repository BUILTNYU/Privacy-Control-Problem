function y=objective(x)
global n;
z=zeros(1,n);
for i=1:n
z(i)=x(i)*log(x(i)+realmin);
end
y=sum(z(1:n));