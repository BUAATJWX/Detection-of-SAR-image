function gaussianFit(in)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%ͼ��ֱ��ͼ��ģ����

[x,y,m,s,l,w,test]=imageSmoothing(in);
y = y/(l*w);

%plot(fit(x,y,'poly2'));
plot(x,y);
xlim([0,0.1]);
fun=fittype('A*exp(-((x-u)/sigma)^2/2)');
options=fitoptions(fun);
options.StartPoint=[max(y) s m];
q=fit(x,y,fun,options);
disp(q);


%�����˹�ֲ����ı�׼��
i = 1;
county = 0;
countx = 0;
while(i < 256)
    if(y(i) < q.A)
        county = county + y(i);
        countx = countx + (m - x(i))^2*y(i);
        i = i + 1;
        
    else 
        county = county;
        countx = countx;
        break;
    end;
    
end;



B = sqrt(countx/county);%����׼��


%disp(B);


%save coefficient q.A;

co=[q.A,q.u,q.sigma,B];

save('coefficient.mat','co');
end

