netn = net; % ����������� �������� 
netn.trainParam.goal = 0.6; % ���������� ������������������ �����������  
netn.trainParam.epochs = 500; % ������������ ���������� ������ (����) ��������
T = [targets targets targets targets]; 
for pass = 1 : 10  
    P = [alphabet, alphabet, (alphabet  +  randn(R,Q) *0.1),(alphabet + randn(R,Q) * 0.2)]; 
    [netn,tr] = train (netn, P,T); 
end