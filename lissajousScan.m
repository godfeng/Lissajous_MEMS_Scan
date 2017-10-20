clear;close all;clc;
%% =====================程序说明=============================== %%
% 谐振式MEMS扫描振镜频率设定优化计算
% 型号：LM2120     设定电压，X（60V），Y（30V）
% Lissajous曲线特性：
%    封闭曲线条件：1). x向极点数与y向极点数之比
%                     等于频率之比
%                 2). 扫描轨迹均匀的前提是x(t) = 0时，
%                     y(t)分布线性
% time：2017-10-20 
% author：Godfeng
%% ============================================================%%

%% function 1 
% 计算有效的fps，满足条件：图像帧频是x和y频率的最大公约数
% warining：fps也可能是小数，这里不考虑
wxMin = 25900;              %查表得 x 的最大振动频率
wxMax = 25990;              %查表得 x 的最小振动频率
wyMin = 2060;               %查表得 y 的最大振动频率
wyMax = 2140;               %查表得 y 的最小振动频率
wx    = (wxMin+wxMax)/2;    %暂时设定x频率
wy    = (wyMin+wyMax)/2;    %暂时设定y频率
validFps = zeros(1,100);
validNum = 0;
for nf = 5:100
    fps    = nf;        %设定 帧频
    wx    = round(wx/fps)*fps;  %优化设定x频率
    wy    = round(wy/fps)*fps;  %优化设定y频率
    wf    = gcd(wx,wy);         %扫描频率
    if((fps==wf)&&(wx>wxMin)&&(wx<wxMax)&&(wy>wyMin)&&(wy<wyMax))
        validNum = validNum + 1;
        validFps(validNum) = fps;
    end
end

%% funciton 2 
% step 1：设定采样点数和扫描帧频
nSpots = 1280;      %设定 x 向采样点
nLine  = 1024;      %设定 y 向采样点
fps    = 24;        %设定 帧频
sT     = 1 / fps;   %得 扫描周期

% step 2：根据输入电压，查表得到扫描频率工作范围
wxMin = 25900;              %查表得 x 的最大振动频率
wxMax = 25990;              %查表得 x 的最小振动频率
wyMin = 2060;               %查表得 y 的最大振动频率
wyMax = 2140;               %查表得 y 的最小振动频率

% step 3:优化图像扫描频率和周期，满足周期的整数倍
wx    = (wxMin+wxMax)/2;    %暂时设定x频率
wy    = (wyMin+wyMax)/2;    %暂时设定y频率
wx    = round(wx/fps)*fps;  %优化设定x频率
wy    = round(wy/fps)*fps;  %优化设定y频率
wf    = gcd(wx,wy);         %验证扫描频率

xT = 1 / wx;                %对应 x 的振动周期
yT = 1 / wy;                %对应 y 的振动周期

nR = sT/yT;                 %y交叉扫描点数
nL = sT/xT;                 %y总扫描行数

t = linspace(0,sT,nSpots*nLine);

phi = 1/2 * pi;
x=cos(2*pi*wx*t);
y=sin(2*pi*wy*t + phi);
plot(x,y)