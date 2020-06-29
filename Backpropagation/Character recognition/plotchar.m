function plotchar(c)
%PLOTCHAR Plot a 30 element vector as a 5x6 grid.
%  
%  PLOTCHAR(C)
%  C - a 10800 element vector.
%  C's elements are plotted as a 5x6 grid.

% Mark Beale, 12-15-93
% Copyright 1992-2002 The MathWorks, Inc.

% DEFINE BOX
x1 = [-0.5 -0.5 +0.5 +0.5 -0.5];
y1 = [-0.5 +0.5 +0.5 -0.5 -0.5];

% DEFINE BOX WITH X
x2 = [x1 +0.5 +0.5 -0.5];
y2 = [y1 +0.5 -0.5 +0.5];

newplot;
plot(x1*5.6+2.5,y1*6.6+3.5,'r');
axis([-1.5 6.5 -0.5 7.5]);
axis('equal')
axis off
hold on

for i = 1 : length(c)
  x = rem(i-1,5)+.5;
  y = 6-floor((i-1)/5); %можно убрать
  plot(x2*c(i)+x,y2*c(i)+y);
end
hold off