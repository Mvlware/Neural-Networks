addpath('../utils');
fc1 = fullyConnectedLayer(64);
% fc1.Weights = randn([64, 2])*0.1;
fc2 = fullyConnectedLayer(64);
% fc2.Weights = randn([64, 64])*0.1;
fc3 = fullyConnectedLayer(2);
% fc3.Weights = randn([2, 64])*0.1;

% construct the network by stacking layers
%layers = [
    %imageInputLayer([1, 1, 2])
    %fc1
    %reluLayer()
    %fc2
    %reluLayer()
    %fc3
    %softmaxLayer()
    %classificationLayer()
%];
 layers = [
    imageInputLayer([10 6 1])
    convolution2dLayer(3,2,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    fullyConnectedLayer(1)
    softmaxLayer
    classificationLayer];

% generate dataset
dataset_classification_generator;
load('../dataset/classification.mat');

% set training options
opts = trainingOptions('sgdm', ...
    'InitialLearnRate', 0.001, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.1, ...
    'LearnRateDropPeriod', 8, ...
    'L2Regularization', 0.004, ...
    'MaxEpochs', 10, ...
    'MiniBatchSize', 100, ...
    'Verbose', true, ...
    'Plots','training-progress');

% train the network
net = trainNetwork(X, Y, layers, opts);

% save training process
%saveTrainingProcess('NN01_classification_training_process')