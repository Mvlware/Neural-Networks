noisy1 = P(:,1) + randn(10800,1) * 1; % ������ n �� �������� � ����� m
noisy_image = reshape(noisy1, 60, 60, 3); % �������������� ������� n � ����������� 
A2 = sim(netn,noisy1); 
A2 = compet(A2);
answer = find(compet(A2) == 1);
img = alphabet(:,answer); % ������������ n �����������
result = reshape(img, 60, 60, 3);
imshowpair(noisy_image,result,'montage'); % ������ ����� �� ����� equals.(figure,imshow(noisy_image); || figure,imshow(result);)