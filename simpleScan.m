clear;close all;clc;
Ax = 1;     %���
Ay = 1; 

wx = 130;     %Ƶ��
wy = 10;
wf = gcd(wx,wy);

deltaTheta = 1/2 * pi;    % ��λ��

t = linspace(0,2*pi/wf,10000);

x = Ax * cos(wx * t );
y = Ay * cos(wy * t + deltaTheta);

plot(x,y);