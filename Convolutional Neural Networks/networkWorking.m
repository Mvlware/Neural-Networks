inputSize = net.Layers(1).InputSize; % ������ �������� �����
classNames = net.Layers(end).ClassNames; % ����� ��������� (�������)
numClasses = numel(classNames); % ���������� ��������� (�������) 
disp(classNames(randperm(numClasses,10))); % ����������� ��������� (�������) 

I = imread('C:\Users\MVLVNGO\Desktop\����������� ���������� ���������� ������������ �����������\��� 3\templates\8.png'); % ���������� �����������
figure; % ����� ����
imshow(I); % ����������� ����������� 
size(I); % ������ ����������� 28x28x3 (3 RGB �������� ������ �� ���������)

% �� �������� (�� ����) ?
I = imresize(I,inputSize(1:2)); % ��������� ��������� ����������� �� �������� ������� ����, ���� ������ ������
figure; % ����� ����
imshow(I); % ����������� ����������� 
size(I); % ������ ����������� 28x28x3

% �������� (����)!
I = rgb2gray(I); % �������������� RGB-����������� � �������� ������
size(I); % 28x28x1

% ������������� �����������
[label,scores] = classify(net,I);
label;
% ����������� ����������� � ������������� ������ � ������������� ������������ �����������
figure;
imshow(I);
title(string(label) + " - " + num2str(100*scores(classNames == label),3) + "%");

% ����������� ���� ������ �������������� ����� � ��������� � ���� ������������ � ���� �����������
% ��� ��� ������ ��������� �����, ������ ��� ������ ����� ����������� ���� ����� ������� ���������
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

