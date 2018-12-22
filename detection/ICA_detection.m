function [nx,T2,SPE]=ICA_detection(x,y,W,G)
[mx,nx]=size(x);
% [my,ny]=size(y);
%求均值
% y_mean=mean(y,2);

x = transpose(x);
%%进行数据过程监测

y1=x*W';
e=y1-y1*G';
for i=1:nx
    T2(i,1)=y1(i,:)*y1(i,:)';%故障诊断I2贡献值
    SPE(i,1)=e(i,:)*e(i,:)';
end
end