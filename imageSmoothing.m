function [x,y,m,s,l,w,test]=imageSmoothing(x)
%UNTITLED1 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%ͼ��ƽ������
img=imread(x);
h=ones(21,21);%��������ģ�Ĵ�С��������m��n��̬����
[l,w] = size(imread(x));
test=conv2(img,h/441,'same');
test = test/max(test(:));
imtool(test,[]);
imtool(x);
% figure(1);
% smooth=mat2gray(test);
% imshow(test,[]);
%imwrite(test,'boat3_VV_smoothing.tif');
[y,x]=imhist(test);
%������ʲ���
% gt=imhist(test);  
m=mean2(test);%u
s=std2(test);%sigma
disp('��ֵΪ��');disp(m);
disp('����׼��Ϊ��');disp(s);


%�����������ֵ
end

