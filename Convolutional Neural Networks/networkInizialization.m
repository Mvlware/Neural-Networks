% 1. �������� � �������� ������ �����������
% -----------------------------------------
% ���� � ������ �������� MATLAB
digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos','nndatasets','DigitDataset');
% �������� ������ ������� ���������, ���������� �� ����� ������� (10000) � ���� MATLAB � ��� ��������� % ����� ����� ������������ � �������� ���� �����
imds = imageDatastore(digitDatasetPath,'IncludeSubfolders',true,'LabelSource','foldernames');
% ����������� 20 ��������� ����������� �� ��������� ������
figure;
perm = randperm(10000,20);
for i = 1:20
    subplot(4,5,i);
    imshow(imds.Files{perm(i)});
end
% ���������� ����������� � ������ ��������� - ������� 10x2 (0-9x1000 = 10000)
labelCount = countEachLabel(imds);
% ������ ������� ����������� ��������� 
img = readimage(imds,1);
% ������ ������� ����������� ��������� 
size(img);

% 2. ���������� �� ������ �������� � ��������
% -------------------------------------------
% � ������ ������ �������� 750 �����������
numTrainFiles = 750;
% splitEachLabel ��������� ��������� ������ �� ������ ������ �������� � ��������: trainDigitData � valDigitData
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

% 3. ����������� ����������� ���������� ��������� ����
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

% 4. ����������� ���������� ��������
% ----------------------------------
options = trainingOptions('sgdm', ... % �������������� ����������� ����� � ����������� (SGDM) 
    'InitialLearnRate',0.01, ... % �������� ��������
    'MaxEpochs',4, ... % ���������� ���� ��������
    'Shuffle','every-epoch', ... % �������� �������� ���� �� ����� �������� ����� �������� ������� �������� ����� ������ �����
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ... % ������ �������� �� ������������ ��� ���������� ���� ����
    'Plots','training-progress'); % ������ ���� �������� � ����� ���� ������

% 5. �������� ���� � �������������� ������ ��������
% -------------------------------------------------
net = trainNetwork(imdsTrain,layers,options);

% 6. ������������� ����������� �������� � �������� ����������
% -----------------------------------------------------------
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;
accuracy = sum(YPred == YValidation)/numel(YValidation);