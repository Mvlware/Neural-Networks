netn.trainParam.goal = 0.1; % ���������� ������������������ �����������  
netn.trainParam.epochs = 500; % ������������ ���������� ������ ��������  
netn.trainParam.show = 5; % ������� ������ ����������� �� ����� 
[netn,tr] = train(netn,P,T); 