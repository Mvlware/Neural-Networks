noisy1 = P(:,3); + randn(14161,1) * 1; % ������ n �� �������� � m
plotchar(noisy1); 
A2 = sim(netn,noisy1); 
A2 = compet(A2);
answer = find(compet(A2) == 1);
figure
plotchar(alphabet(:,answer)); % ������������ n ������ 
