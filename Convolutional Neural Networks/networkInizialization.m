% 1. Загрузка и просмотр данных изображения
% -----------------------------------------
% путь к файлам образцов MATLAB
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos','nndatasets','DigitDataset');
% создание нового объекта хранилища, связанного со всеми файлами (10000) в пути MATLAB и его подпапках % имена папок используются в качестве имен меток
imds = imageDatastore(digitDatasetPath,'IncludeSubfolders',true,'LabelSource','foldernames');
% отображение 20 рандомных изображений из хранилище данных
figure;
perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end
% количество изображений в каждой категории - таблица 10x2 (0-9x1000 = 10000)
labelCount = countEachLabel(imds);
% взятие первого изображения хранилища 
img = readimage(imds,1);
% размер первого изображения хранилища 
size(img);

% 2. Разделение на наборы обучения и проверки
% -------------------------------------------
% в наборе данных обучения 750 изображений
numTrainFiles = 750;
% splitEachLabel разбивает хранилище данных на наборы данных обучения и проверки: trainDigitData и valDigitData
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

% 3. Определение архитектуры сверточной нейронной сети
% ----------------------------------------------------
layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer   
    maxPooling2dLayer(2,'Stride',2)
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

% 4. Определение параметров обучения
% ----------------------------------
options = trainingOptions('sgdm', ... % стохастический градиентный спуск с осцилляцией (SGDM) 
    'InitialLearnRate',0.01, ... % скорость обучения
    'MaxEpochs',4, ... % количество эпох обучения
    'Shuffle','every-epoch', ... % контроль точности сети во время обучения путем указания частоты проверки через каждую эпоху
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ... % данные обучения не используются для обновления веса сети
    'Plots','training-progress'); % график хода обучения и вывод окна команд

% 5. Обучение сети с использованием данных обучения
% -------------------------------------------------
net = trainNetwork(imdsTrain,layers,options);

% 6. Классификация изображений проверки и точность вычисления
% -----------------------------------------------------------
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;
accuracy = sum(YPred == YValidation)/numel(YValidation);