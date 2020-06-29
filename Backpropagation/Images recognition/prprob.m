function [alphabet,targets] = prprob()
%   Функция определяет входные параметров для нейронно-сетевого распознавания изображений большой размерности
%	function [alphabet,targets] = prprob() возвращает:
%	ALPHABET - 10800x4 матрицу, каждый элемент которой содержит 60х60x3 информационных  
%   элементов для каждого изображения.
%	TARGETS  - 4x4 выходных векторов.

img = imread('C:\Users\MVLVNGO\Desktop\Современные технологии разработки программного обеспечения\Лаб 1\lab 1.2\templates\1.png'); %считывание изображение из файла
img1 = imresize(img, 0.5); % ориг. размер изображ 119x119x3(42483x1) конверт. в 60x60x3(10800x1)
BW1 = double(imbinarize(img1)); % бинаризация изображения градаций серого путем пороговой обработки (threshold 0.5 по умолчанию)
ImgVector1 = BW1(:); % equals.(img1=reshape(img,[10800, 1]);)

    %colormap(gray(256));
    %A=img/15; %получаем трехмерный массив B содержащий изображение %-делает слишком серым
    %A=rgb2gray(B); %преобразуем цветное изображение в полутоновое и получаем его двумерный массив
    %image(A);
    %axis image;
    %image(A);
    %cm=[0 0 0;1 1 1];
    %colormap(cm);
    %ImgVector1 = A(:);
    %colormap('default');
    %colormap(gray(16));
    %min(min(A))
    %max(max(A))

img2 = imread('C:\Users\MVLVNGO\Desktop\Современные технологии разработки программного обеспечения\Лаб 1\lab 1.2\templates\2.png'); % считывание изображение из файла
img3 = imresize(img2, 0.5); % ориг. размер изображ 119x119x3(42483x1) конверт. в 60x60x3(10800x1)
BW2 = double(imbinarize(img3)); % бинаризация изображения градаций серого путем пороговой обработки (threshold 0.5 по умолчанию)
ImgVector2 = BW2(:); % equals.(img1=reshape(img,[10800, 1]);)

img4 = imread('C:\Users\MVLVNGO\Desktop\Современные технологии разработки программного обеспечения\Лаб 1\lab 1.2\templates\3.png'); % считывание изображение из файла
img5 = imresize(img4, 0.5); % ориг. размер изображ 119x119x3(42483x1) конверт. в 60x60x3(10800x1)
BW3 = double(imbinarize(img5)); % бинаризация изображения градаций серого путем пороговой обработки (threshold 0.5 по умолчанию)
ImgVector3 = BW3(:); % equals.(img1=reshape(img,[10800, 1]);)

img6 = imread('C:\Users\MVLVNGO\Desktop\Современные технологии разработки программного обеспечения\Лаб 1\lab 1.2\templates\4.png'); % считываем изображение из файла
img7 = imresize(img6, 0.5); % ориг. размер изображ 119x119x3(42483x1) конверт. в 60x60x3(10800x1)
BW4 = double(imbinarize(img7)); % бинаризация изображения градаций серого путем пороговой обработки (threshold 0.5 по умолчанию)
ImgVector4 = BW4(:); % equals.(img1=reshape(img,[10800, 1]);)

alphabet = [ImgVector1,ImgVector2,ImgVector3,ImgVector4]; % матрица входных изображений

targets = eye(4); % выходные вектора

end


