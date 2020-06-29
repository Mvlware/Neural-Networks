% 1. Загрузка и просмотр данных изображения
% -----------------------------------------
% путь к файлам образцов MATLAB
%digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos','nndatasets','DigitDataset');
% создание нового объекта хранилища, связанного со всеми файлами (10000) в пути MATLAB и его подпапках % имена папок используются в качестве имен меток
%imds = imageDatastore(digitDatasetPath,'IncludeSubfolders',true,'LabelSource','foldernames');
% отображение 20 рандомных изображений из хранилище данных
%figure;
%perm = randperm(10000,20);
%for i = 1:20
    %subplot(4,5,i);
    %imshow(imds.Files{perm(i)});
%end
% количество изображений в каждой категории - таблица 10x2 (0-9x1000 = 10000)
%labelCount = countEachLabel(imds);
% взятие первого изображения хранилища 

figure1  = [0 1 5 1 0 0 1 5 1 0 ...
            0 1 5 1 0 0 1 5 1 0 ...
            0 1 5 1 1 1 1 5 1 0 ...
            0 1 5 5 5 5 5 5 1 0 ...
            0 1 5 1 1 1 1 5 1 0 ...
            0 1 5 1 0 0 1 5 1 0]';
%img = readimage(figure,1);
% размер первого изображения хранилища 
size(figure1);

% 2. Разделение на наборы обучения и проверки
% -------------------------------------------
% в наборе данных обучения 750 изображений
numTrainFiles = 60;
% splitEachLabel разбивает хранилище данных на наборы данных обучения и проверки: trainDigitData и valDigitData
%imdsTrain = splitEachLabel(figure1,numTrainFiles,'randomize');
xtrain = figure1';
xtrain = xtrain(:)';

% 3. Определение архитектуры сверточной нейронной сети
% ----------------------------------------------------
layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(3,2,'Padding','same')
    reluLayer
    maxPooling2dLayer(1,'Stride',1)
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

% 4. Определение параметров обучения
% ----------------------------------
options = trainingOptions('sgdm', ... % стохастический градиентный спуск с осцилляцией (SGDM) 
    'InitialLearnRate',0.01, ... % скорость обучения
    'MaxEpochs',4, ... % количество эпох обучения
    'Shuffle','every-epoch'); % контроль точности сети во время обучения путем указания частоты проверки через каждую эпоху
    %'ValidationData',imdsValidation,...
    %'ValidationFrequency',30, ...
    %'Verbose',false, ... % данные обучения не используются для обновления веса сети
    %'Plots','training-progress'); % график хода обучения и вывод окна команд

% 5. Обучение сети с использованием данных обучения
% -------------------------------------------------
ytrain = {'MA','ME','CT','VT','ME','NH'};
ytrain = categorical(ytrain);
[ XTrain , TTrain ] = digitTrain4DArrayData() ;
net = trainNetwork(XTrain,TTrain,layers,options);

% 6. Классификация изображений проверки и точность вычисления
% -----------------------------------------------------------
%YPred = classify(net,imdsValidation);
%YValidation = imdsValidation.Labels;
%accuracy = sum(YPred == YValidation)/numel(YValidation);