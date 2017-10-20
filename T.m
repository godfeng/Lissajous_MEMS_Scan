nSpots = 1280;      %设定 x 向采样点
nLine  = 1024;      %设定 y 向采样点

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

fps = 26;
