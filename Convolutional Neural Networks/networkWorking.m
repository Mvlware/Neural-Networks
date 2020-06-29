inputSize = net.Layers(1).InputSize; % размер сетевого ввода
classNames = net.Layers(end).ClassNames; % имена категорий (классов)
numClasses = numel(classNames); % количество категорий (классов) 
disp(classNames(randperm(numClasses,10))); % отображение категорий (классов) 

I = imread('C:\Users\MVLVNGO\Desktop\Современные технологии разработки программного обеспечения\Лаб 3\templates\8.png'); % считывание изображение
figure; % новое окно
imshow(I); % отображение изображения 
size(I); % размер изображения 28x28x3 (3 RGB цветовых канала по умолчанию)

% не работает (не надо) ?
I = imresize(I,inputSize(1:2)); % изменение пропорций изображения до входного размера сети, если размер больше
figure; % новое окно
imshow(I); % отображение изображения 
size(I); % размер изображения 28x28x3

% работает (надо)!
I = rgb2gray(I); % преобразование RGB-изображения в градации серого
size(I); % 28x28x1

% классификация изображения
[label,scores] = classify(net,I);
label;
% отображение изображения с предсказанной меткой и предсказанной вероятностью изображения
figure;
imshow(I);
title(string(label) + " - " + num2str(100*scores(classNames == label),3) + "%");

% отображение пяти первых прогнозируемых меток и связанных с ними вероятностей в виде гистограммы
% так как многие категории схожи, обычно при оценке сетей учитывается пять самых высоких точностей
[~,idx] = sort(scores,'descend');
idx = idx(5:-1:1);
classNamesTop = net.Layers(end).ClassNames(idx);
scoresTop = scores(idx);
figure;
barh(scoresTop);
xlim([0 1]);
title('Top 5 Predictions');
xlabel('Probability');
yticklabels(classNamesTop);

