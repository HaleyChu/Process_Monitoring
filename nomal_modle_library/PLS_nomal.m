function [t,p,r,nX,Jth_T2,Jth_SPE]=PLS_nomal(X,Y)
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
Y = transpose(Y);
A=4;
%标准模型
[t,p,u,q,w,E] = PLSI (X,Y);
 r = w * (p'*w)^(-1);
 %求X的协方差矩阵的最大特征值
 s=cov(X);
 Romita_max=max(eig(s));
%计算控制限
m=mX;
n=nX;
alpha=0.95;%置信水平
Jth_T2=m*(n^2-1)*finv(alpha,m,n-m)/(n*(n-m));
for i=1:nX
%     tnew = Z(i,:)*r;
    xnew = X(i,:)*(eye(mX)-p*r');
    SPE(i) = norm(xnew)^2;
end
a=mean(SPE);
b=std(SPE);
g=b/(2*a);
h=2*a^2/b;
% Jth_SPE=Romita_max*chi2inv(alpha,m);
Jth_SPE=g*chi2inv(alpha,h);