%����֪���ܶȺ�����ȡ������
function ConInt=ComCon(density,xmesh,alpha)	%density �ܶȾ��� 
							%xmeshΪ�ܶȶ�Ӧ��xֵ���������������
							%alpha ���Ŷ�
ConInt=zeros(1,2);			%���ConIntΪ������
n=length(density);			%����ÿһ�еĿ�����

x1=min(xmesh);
x2=max(xmesh);
dx=(x2-x1)/(n-1);

%�ƽ�ָ������ӿ�ʼ��ĳһ������Ϊ(1-alpha)/2,����ȡ�·�λ��;
while(1)
     x3=x1+(sqrt(5)-1)/2*(x2-x1);
     t=x1:dx:x3; %��x1��ʼ��������dx����ֵΪx3������
%    s=trapz(t,density(1:length(t)));
     s=trapz(density(1:length(t)))*dx;
     if abs(x2-x1)<1.0e-3 
%       if s-alpha<1.0e-4
        ConInt(1)=x3; 
     break;
%    elseif s<alpha
     elseif s<(1-alpha)/2
            x1=x3;
     else
          x2=x3;
     end
end
%     ���Ϸ�Ϊ�����ӿ�ʼ��ĳһ������Ϊ1-��1-alpha)/2;
x1=min(xmesh);
x2=max(xmesh);
while(1)
      x3=x1+(sqrt(5)-1)/2*(x2-x1);
      t=x1:dx:x3;
%     s=trapz(t,density(1:length(t)));
      s=trapz(density(1:length(t)))*dx;
      if abs(x2-x1)<1.0e-3 
         ConInt(2)=x3; 
         break;
      elseif s<(1+alpha)/2
             x1=x3;
      else
           x2=x3;
      end
end