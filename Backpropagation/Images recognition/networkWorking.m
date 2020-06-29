noisy1 = P(:,1) + randn(10800,1) * 1; % вектор n из алфавита с шумом m
noisy_image = reshape(noisy1, 60, 60, 3); % девекторизация вектора n в изображение 
A2 = sim(netn,noisy1); 
A2 = compet(A2);
answer = find(compet(A2) == 1);
img = alphabet(:,answer); % распознанное n изображение
result = reshape(img, 60, 60, 3);
imshowpair(noisy_image,result,'montage'); % парный вывод на экран equals.(figure,imshow(noisy_image); || figure,imshow(result);)