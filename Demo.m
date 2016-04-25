clear all;clc;
x=[27.7 28 29 30];
y=[4.1 4.3 4.1 3.0];
u=27.7:0.01:30;
v=[3.0 -4.0];
w=CubicSplineInterp(x,y,v,u);
plot(x,y,'o',...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor',[.49 1 .63],...
                'MarkerSize',10)
hold on;
plot(u,w,'-m','LineWidth',2);
title('Cubic Spline Interpolation')
