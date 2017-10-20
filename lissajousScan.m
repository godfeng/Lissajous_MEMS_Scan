clear;close all;clc;
%% =====================����˵��=============================== %%
% г��ʽMEMSɨ����Ƶ���趨�Ż�����
% �ͺţ�LM2120     �趨��ѹ��X��60V����Y��30V��
% Lissajous�������ԣ�
%    �������������1). x�򼫵�����y�򼫵���֮��
%                     ����Ƶ��֮��
%                 2). ɨ��켣���ȵ�ǰ����x(t) = 0ʱ��
%                     y(t)�ֲ�����
% time��2017-10-20 
% author��Godfeng
%% ============================================================%%

%% function 1 
% ������Ч��fps������������ͼ��֡Ƶ��x��yƵ�ʵ����Լ��
% warining��fpsҲ������С�������ﲻ����
wxMin = 25900;              %���� x �������Ƶ��
wxMax = 25990;              %���� x ����С��Ƶ��
wyMin = 2060;               %���� y �������Ƶ��
wyMax = 2140;               %���� y ����С��Ƶ��
wx    = (wxMin+wxMax)/2;    %��ʱ�趨xƵ��
wy    = (wyMin+wyMax)/2;    %��ʱ�趨yƵ��
validFps = zeros(1,100);
validNum = 0;
for nf = 5:100
    fps    = nf;        %�趨 ֡Ƶ
    wx    = round(wx/fps)*fps;  %�Ż��趨xƵ��
    wy    = round(wy/fps)*fps;  %�Ż��趨yƵ��
    wf    = gcd(wx,wy);         %ɨ��Ƶ��
    if((fps==wf)&&(wx>wxMin)&&(wx<wxMax)&&(wy>wyMin)&&(wy<wyMax))
        validNum = validNum + 1;
        validFps(validNum) = fps;
    end
end

%% funciton 2 
% step 1���趨����������ɨ��֡Ƶ
nSpots = 1280;      %�趨 x �������
nLine  = 1024;      %�趨 y �������
fps    = 24;        %�趨 ֡Ƶ
sT     = 1 / fps;   %�� ɨ������

% step 2�����������ѹ�����õ�ɨ��Ƶ�ʹ�����Χ
wxMin = 25900;              %���� x �������Ƶ��
wxMax = 25990;              %���� x ����С��Ƶ��
wyMin = 2060;               %���� y �������Ƶ��
wyMax = 2140;               %���� y ����С��Ƶ��

% step 3:�Ż�ͼ��ɨ��Ƶ�ʺ����ڣ��������ڵ�������
wx    = (wxMin+wxMax)/2;    %��ʱ�趨xƵ��
wy    = (wyMin+wyMax)/2;    %��ʱ�趨yƵ��
wx    = round(wx/fps)*fps;  %�Ż��趨xƵ��
wy    = round(wy/fps)*fps;  %�Ż��趨yƵ��
wf    = gcd(wx,wy);         %��֤ɨ��Ƶ��

xT = 1 / wx;                %��Ӧ x ��������
yT = 1 / wy;                %��Ӧ y ��������

nR = sT/yT;                 %y����ɨ�����
nL = sT/xT;                 %y��ɨ������

t = linspace(0,sT,nSpots*nLine);

phi = 1/2 * pi;
x=cos(2*pi*wx*t);
y=sin(2*pi*wy*t + phi);
plot(x,y)