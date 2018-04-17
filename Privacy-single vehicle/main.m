aa=1;
bb=1;
cc=1;
%parametes of baseline tour

%x=round(newDARP(aa,bb,cc),3);
x=[0;1;0;0;0;1;0;0;0;0;0;0;0;1;0;0;0;0;0;1;0;0;0;0;1;0;0;0;0;0;0;0;1;0;1;0;13.5962560600000;13.2624055200000;14.8909345600000;0;7.82842712500000;3;12.6568542500000;23.4246831900000;18.2624055200000;29.5477888100000;45.0014128600000;0;2;1;3;1;2;0;0];
x=round(x,3);
[alpha,beta,gamma]=InvDARP(x);
tour=x;
p1=alpha;
p2=beta;
p3=gamma;

f=[x(1:36,1)',zeros(1,19)];  % single vehicle
%f=[1	0	0	0	0	0	0	1	0	0	0	0	0	0	1	0	0	0	1	0	0	0	0	0	0	0	1	0	0	0	0	0	1	1	0	1,zeros(1,19)]; 
% two vehicles

% s=1; %  # of fleet size

k=2; 
K=8;  %  # of tours
t=2;
% a1=zeros(1,10);
% b1=zeros(1,10);
% c1=zeros(1,10); % parameters of each tour
a1=alpha;
b1=beta;
c1=gamma;
U=zeros(55,1);
tourset=x;

while(t<=8)
   while(k<=10)
    x1=round(select(f),3);
    [alpha,beta,gamma]=InvDARP(x1);
    for i=1:36
        f(i)=f(i)+round(x1(i),0);
    end
% %         if(alpha==0&&beta==0&&gamma==0)
%             U=[U,tour(,j)];
%         else
%             if(~uniquetour(tour,x1))
%                 a1(t)=alpha;
%                 b1(t)=beta;
%                 c1(t)=gamma;
%                 tour=[tour,x1];
%                 t=t+1;
%             else
%              f=subtract(f,tour,j);
%                 U=[U,x1];
% %            tour(:,j)=[];
% %            p1(:,j)=[];
% %            p2(:,j)=[];
% %            p3(:,j)=[];  
%             end
%         end
    tour=[tour,x1];
    p1=[p1,alpha];
    p2=[p2,beta];
    p3=[p3,gamma];
    
% else
%     U=[U,x1];
%     for i=1:36
%         f(i)=f(i)+x1(i);
%     end
%     k=k-1;
%     U=(unique(U','rows'))';
% end

    k=k+1;  
  end
    




 

  for j=t:size(tour,2)
    if(p1(j)==0&&p2(j)==0&&p3(j)==0)
%         f=subtract(f,tour,j);
        U=[U,tour(:,j)];
%         tour(:,j)=[];
%         p1(:,j)=[];
%         p2(:,j)=[];
%         p3(:,j)=[];
%         k=k-1;
       
    else
        if(~uniquetour(tourset,tour(:,j)))
        a1(t)=p1(j);
        b1(t)=p2(j);
        c1(t)=p3(j);
        tourset=[tourset,tour(:,j)];
        t=t+1;
        else
%              f=subtract(f,tour,j);
           U=[U,tour(:,j)];
%            tour(:,j)=[];
%            p1(:,j)=[];
%            p2(:,j)=[];
%            p3(:,j)=[];  
        end
%         tourset=[tourset,tour(:,k)];
    end
%     if(k>=2)
%         for i=1:k
%            if(p1(k) 
%         end 
%     end
%     if(t>8)
%       break;
%     end
    
  end
 
  k=t;
  tour=tourset;
  p1=a1;
  p2=b1;
  p3=c1;
  
  
end


diff=diffuse(tour);

% U(:,1)=[];
% tourset(:,1)=[];
% 
% tourset=unique(tourset)