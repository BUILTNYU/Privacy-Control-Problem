function [diff,obj]=diffuse(tour)
% global n;
n=size(tour,2);
t1=tour(37,:);
t2=tour(38,:);
t3=tour(39,:);
one=ones(1,n);
zero=zeros(1,n);
for i=1:21
  delta(i)=0.05*i-0.05;  
end
diff=[1,zeros(1,n-1)]';
for i=1:21
Ad=[t1-t1(1)-delta(i)*t1(1);
   -t1+t1(1)-delta(i)*t1(1);
    t2-t2(1)-delta(i)*t2(1);
   -t2+t2(1)-delta(i)*t2(1);
   t3-t3(1)-delta(i)*t3(1);
   -t3+t3(1)-delta(i)*t3(1);];
 bd=[0,0,0,0,0,0]';
 Adeq=one;
 bdeq=1;
 ub=one';
 lb=zero';
 x00=[1,zeros(1,n-1)]';
 
 %fun=@(x)x(1)*log(x(1)+realmin)+x(1)*log(x(1)+realmin)+
 options=optimset('LargeScale','off','MaxFunEvals',30000);
 
[x,fval]=fmincon(@objective,x00,Ad,bd,Adeq,bdeq,lb,ub,[],options);
obj(i)=objective;
diff=[diff,x];


end
% output=diffusion;
diff(:,1)=[];

traveltime=[t1*diff;t2*diff;t3*diff];
