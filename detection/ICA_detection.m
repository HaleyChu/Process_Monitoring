function [nx,T2,SPE]=ICA_detection(x,y,W,G)
[mx,nx]=size(x);
% [my,ny]=size(y);
%���ֵ
% y_mean=mean(y,2);

x = transpose(x);
%%�������ݹ��̼��

y1=x*W';
e=y1-y1*G';
for i=1:nx
    T2(i,1)=y1(i,:)*y1(i,:)';%�������I2����ֵ
    SPE(i,1)=e(i,:)*e(i,:)';
end
end