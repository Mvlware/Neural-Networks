netn.trainParam.goal = 0.1; % предельная среднеквадратичная погрешность  
netn.trainParam.epochs = 500; % максимальное количество циклов обучения  
netn.trainParam.show = 5; % частота вывода результатов на экран 
[netn,tr] = train(netn,P,T); 