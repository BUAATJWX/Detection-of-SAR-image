function dichotomy2()
%��ʽ22������

x1 = input('���ޣ�x1=');
x2 = input('���ޣ�x2=');
e = input('����,e=');
f1 = myFunction2(x1);
f2 = myFunction2(x2);
f1 = double(f1);
f2 = double(f2);

if(f1 * f2 > 0)
    disp('�����ڸ�����');
else
    y=dichotomyRoot2(x1, x2, e);
    disp('T=');disp(y);
end;


end

