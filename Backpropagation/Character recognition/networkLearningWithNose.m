netn = net; % продолжение обучения 
netn.trainParam.goal = 0.6; % предельная среднеквадратичная погрешность  
netn.trainParam.epochs = 500; % максимальное количество циклов (эпох) обучения
T = [targets targets targets targets]; 
for pass = 1 : 10  
    P = [alphabet, alphabet, (alphabet  +  randn(R,Q) *0.1),(alphabet + randn(R,Q) * 0.2)]; 
    [netn,tr] = train (netn, P,T); 
end