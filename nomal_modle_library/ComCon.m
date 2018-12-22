%对已知的密度函数求取控制限
function ConInt=ComCon(density,xmesh,alpha)	%density 密度矩阵 
							%xmesh为密度对应的x值的行向量（或矩阵）
							%alpha 置信度
ConInt=zeros(1,2);			%输出ConInt为控制限
n=length(density);			%计算每一列的控制限

x1=min(xmesh);
x2=max(xmesh);
dx=(x2-x1)/(n-1);

%黄金分割搜索从开始到某一点的面积为(1-alpha)/2,以求取下分位数;
while(1)
     x3=x1+(sqrt(5)-1)/2*(x2-x1);
     t=x1:dx:x3; %从x1开始，步长是dx，终值为x3的数组
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
%     求上分为数，从开始到某一点的面积为1-（1-alpha)/2;
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