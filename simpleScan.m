clear;close all;clc;
Ax = 1;     %Õñ·ù
Ay = 1; 

wx = 130;     %ÆµÂÊ
wy = 10;
wf = gcd(wx,wy);

deltaTheta = 1/2 * pi;    % ÏàÎ»²î

t = linspace(0,2*pi/wf,10000);

x = Ax * cos(wx * t );
y = Ay * cos(wy * t + deltaTheta);

plot(x,y);