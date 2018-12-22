function [W,G,Jth_T2,Jth_SPE]=ICA_nomal(X,Y)
% clc
% data=xlsread('nomal_data.xlsx');
% Y=data(17,:);
% X=data(1:50,:);
%求均值
Y_mean=mean(Y,2);
X_mean=mean(X,2);
%求标准差
Y_std = std(Y,0,2);
X_std = std(X,0,2);
%数据标准化
[mY,nY]=size(Y);
[mX,nX]=size(X);
Y=(Y - repmat(Y_mean,1,nY))./repmat(Y_std,1,nY);
X=(X - repmat(X_mean,1,nX))./repmat(X_std,1,nX);
X = transpose(X);
%标准模型
[W,B,z,Q,x_mean,x_var] = fastica(X,mX,16,1000,'newton',1-(1E-9));
y=X*W';
%求控制线    
  G=inv(Q)*(W'*(inv(Q)))'*W;
  e=y-y*G';
for i=1:nX
    I2(i)=y(i,:)*y(i,:)';%故障诊断I2贡献值
    SPE_1(i)=e(i,:)*e(i,:)';
  
end;
alpha=0.95;
[f1,x1,u1]=ksdensity(I2);%I2单变量核密度估计
ConInt1=ComCon(f1,x1,alpha);
Jth_T2=ConInt1(2);
Jth_SPE=ksdensity(SPE_1,alpha,'function','icdf');
end