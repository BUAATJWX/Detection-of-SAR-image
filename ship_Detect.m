function ship_Detect(x, paf, r1, r2, A1, A2 )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
% xΪ�����ͼ��
% pafΪ���龯��
% r1,r2Ϊ�����������
% A1��A2Ϊ���������
tic
imageSmoothing(x);
gaussianFit(x);
CFAR(x,paf, r1, r2, A1, A2);
toc
end

