nSpots = 1280;      %�趨 x �������
nLine  = 1024;      %�趨 y �������

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

fps = 26;
