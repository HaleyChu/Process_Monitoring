function [Js,Ls,Ms,S,Jth_T2,Jth_SPE]=CCA_nomal(X,Y)
% clc
% %clear all
% data=xlsread('nomal_data.xlsx');
% Y=data(17,:);
% X=data(13:34,:);
%求均值
Y_mean=mean(Y,2);
X_mean=mean(X,2);
%求标准差
Y_std = std(Y,0,2);
X_std = std(X,0,2);
%数据归一化
[mY,nY]=size(Y);
[mX,nX]=size(X);
Y=(Y - repmat(Y_mean,1,nY));%./repmat(Y_std,1,nY);
X=(X - repmat(X_mean,1,nX));%./repmat(X_std,1,nX);
Y=transpose(Y);
X=transpose(X);
%标准模型
X_cov = X'*X/(nX - 1);
Y_cov = Y'*Y/(nY - 1);
XY_cov = X'*Y/(nY - 1);
Gama = (X_cov^-0.5)*XY_cov*(Y_cov^-0.5);
r_rank = rank(Gama);
[U,S,V] = svd(Gama);
%%%%%%%
Js = (X_cov^-0.5) * U(:,1:r_rank);
Ls = (Y_cov^-0.5) * V(:,1:r_rank);
Ms = Js*S';
%计算控制限
m=mX;
n=nX;
alpha=0.95;%置信水平
%求X的协方差矩阵的最大特征值
miu=0;
for i=1:nX
%     a=Ls*y(i,:)';
%     b=Ms'*x(i,:)';
    r(i,:)=Ls'*Y(i,:)-X(i,:)*Ms;
    a=size(Ls,1);
    f=eye(a)-(S(a))^2;
    JT2(i)=r(i,:)*f^(-1)*r(i,:)';
    JSPE(i)=r(i,:)*r(i,:)';
    miu=miu+JSPE(i);

%     Rk = Ls'*y(:,i) - Ms'*x(:,i);
%     Qcca(i) = Rk'* Rk;
%     T2(i)=1;
end
miu=miu/nX;s=0;
for i=1:nX
    s=s+(JSPE(i)-miu)^2;
end
s=s/(nX-1);
g=s/(2*miu);
h=2*miu^2/s;
Jth_SPE=g*chi2inv(1-alpha,h);
% Jth_T2=r_rank*(n^2-1)*finv(alpha,r_rank,n-r_rank)/(n*(n-r_rank));
Jth_T2=Jth_SPE;

% % for i =  1:n
% %     Rk = Ls'*Y(i,:) - X(i,:)*Js*S';
% %     Qcca_train(i) = Rk* Rk';
% % end
% % Q_train_mean = mean(Qcca_train,2);
% % Q_train_S = mean((Qcca_train - Q_train_mean).^2,2)*n/(n-1);
% % g = Q_train_S/(2*Q_train_mean);
% % h = 2*Q_train_mean^2/Q_train_S;
% % % Q = g*chi2cdf(0.95,h);
% % Q = g*chi2inv(0.95,h);
% % Jth_SPE=Q*10000;



