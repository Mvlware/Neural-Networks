function [alphabet,targets] = prprob()
%   ������� ���������� ������� ���������� ��� ��������-�������� ������������� ����������� ������� �����������
%	function [alphabet,targets] = prprob() ����������:
%	ALPHABET - 10800x4 �������, ������ ������� ������� �������� 60�60x3 ��������������  
%   ��������� ��� ������� �����������.
%	TARGETS  - 4x4 �������� ��������.

img = imread('C:\Users\MVLVNGO\Desktop\����������� ���������� ���������� ������������ �����������\��� 1\lab 1.2\templates\1.png'); %���������� ����������� �� �����
img1 = imresize(img, 0.5); % ����. ������ ������� 119x119x3(42483x1) �������. � 60x60x3(10800x1)
BW1 = double(imbinarize(img1)); % ����������� ����������� �������� ������ ����� ��������� ��������� (threshold 0.5 �� ���������)
ImgVector1 = BW1(:); % equals.(img1=reshape(img,[10800, 1]);)

    %colormap(gray(256));
    %A=img/15; %�������� ���������� ������ B ���������� ����������� %-������ ������� �����
    %A=rgb2gray(B); %����������� ������� ����������� � ����������� � �������� ��� ��������� ������
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

img2 = imread('C:\Users\MVLVNGO\Desktop\����������� ���������� ���������� ������������ �����������\��� 1\lab 1.2\templates\2.png'); % ���������� ����������� �� �����
img3 = imresize(img2, 0.5); % ����. ������ ������� 119x119x3(42483x1) �������. � 60x60x3(10800x1)
BW2 = double(imbinarize(img3)); % ����������� ����������� �������� ������ ����� ��������� ��������� (threshold 0.5 �� ���������)
ImgVector2 = BW2(:); % equals.(img1=reshape(img,[10800, 1]);)

img4 = imread('C:\Users\MVLVNGO\Desktop\����������� ���������� ���������� ������������ �����������\��� 1\lab 1.2\templates\3.png'); % ���������� ����������� �� �����
img5 = imresize(img4, 0.5); % ����. ������ ������� 119x119x3(42483x1) �������. � 60x60x3(10800x1)
BW3 = double(imbinarize(img5)); % ����������� ����������� �������� ������ ����� ��������� ��������� (threshold 0.5 �� ���������)
ImgVector3 = BW3(:); % equals.(img1=reshape(img,[10800, 1]);)

img6 = imread('C:\Users\MVLVNGO\Desktop\����������� ���������� ���������� ������������ �����������\��� 1\lab 1.2\templates\4.png'); % ��������� ����������� �� �����
img7 = imresize(img6, 0.5); % ����. ������ ������� 119x119x3(42483x1) �������. � 60x60x3(10800x1)
BW4 = double(imbinarize(img7)); % ����������� ����������� �������� ������ ����� ��������� ��������� (threshold 0.5 �� ���������)
ImgVector4 = BW4(:); % equals.(img1=reshape(img,[10800, 1]);)

alphabet = [ImgVector1,ImgVector2,ImgVector3,ImgVector4]; % ������� ������� �����������

targets = eye(4); % �������� �������

end


