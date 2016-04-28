function  S=CubicSplineInterp(x,y,v,u);
%clamped cubic spline
%Input:(x,y) are the given points
%       u is the x-values of interpolated points
%       v is the boundary condition(the first-order derivative value at the boundary points)
%Output:S is the interpolated function values corresponding to u

m=length(x);

%h(i)=x(i+1)-x(i)
a=x;
b=x;
a(1)=[];
b(end)=[];
h=a-b;        
%Establish matrix mu and lambda
mu=zeros(1,m-2);
lambda=zeros(1,m-2);
for i=1:m-2
    mu(i)=h(i)/(h(i)+h(i+1));
    lambda(i)=h(i+1)/(h(i)+h(i+1));
end
mu=[mu 1];
lambda=[1 lambda];

%First find f(x(i),x(i+1),x(i+2)), then get matrix d
F=zeros(length(x));
F(:,1)=y(:);
for i=2:m
 for j=2:i
     if(j<=3)
     F(i,j)=(F(i,j-1)-F(i-1,j-1))/(x(i)-x(i-j+1));
     end
 end
end
c=F(:,3);
c([1 2])=[];
d=6*c;
%Add do and dm to matrix d
e=6/h(1)*(F(2,2)-v(1));
f=6/h(end)*(v(2)-F(end,2));
d=[e;d;f];

%Establish the matrix A
A=eye(m)*2;
for j=2:m
   A(j,j-1)=mu(j-1);
   A(j-1,j)=lambda(j-1);
end

 %Get the second derivative values
M=A\d;

%First make a judgement about which x-interval u(k) belongs to
%then use the corresponding function to calculate the function value
%at x=u(k)
S=zeros(size(u));    
for k=1:length(u)
    judge=(x<u(k));% find which interval u belongs to 
                   % if using this way, x vector must be increasing.
    t=sum(judge);
    if t==0 t=1;
    elseif t==m t=m-1;  % if u(k) gets out of the given domain of x, let u(k) 
                        %take the cloest the interval's fitting function
    end
    S(k)=M(t)*(x(t+1)-u(k))^3/6/h(t)+M(t+1)*(u(k)-x(t))^3/6/h(t)+...
         (y(t)-M(t)*h(t)^2/6)*(x(t+1)-u(k))/h(t)+...
         (y(t+1)-M(t+1)*h(t)^2/6)*(u(k)-x(t))/h(t);    
end
end
        
    

    
