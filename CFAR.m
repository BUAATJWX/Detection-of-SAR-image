function CFAR(in, paf, r1, r2, A1, A2)
%���÷���������������T
tic
load('coefficient.mat');
%paf = 1e-6;%���龯��
T = norminv(1-paf, co(2), co(4));
disp(T);


[~,~,~,~,l,w,test]=imageSmoothing(in);

new = ones(l,w);


%��ʾ���ͼ��
for i = 1:l
    for j = 1:w
        if(test(i,j) > T)
           % new(i,j) = test(i,j);
           new(i,j) = 1;%��Ǽ���������
        else
            new(i,j) = 0;
        end;
    end;
end;

imtool(new,[]);
%������ͳ����
[L,num] = bwlabel(new,8);
p = regionprops(L, 'Area', 'MajorAxisLength', 'MinorAxisLength');
s = cat(1, p.Area);
a = cat(1,p.MajorAxisLength);
b = cat(1,p.MinorAxisLength);
for i = 1:size(s)
     if(s(i) < A1 || s(i) > A2 )
         [r,c] = find(L==i);
         new(r,c) = 0;
         
     end;
%disp(s(i)); 
end;
% 
 for i = 1:size(a)
       if(a(i)/b(i) < r1 || a(i)/b(i) > r2 )
           [r,c] = find(L==i);
           new(r,c) = 0;
%            disp(a(i)/b(i));
          
       end;
%disp(a(i)/b(i));
 end;

imtool(new,[]);
%������ͳ����
toc
end

