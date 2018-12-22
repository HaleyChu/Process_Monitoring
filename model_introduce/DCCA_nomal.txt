function [Ls,S,Md,Jth_T2,Jth_SPE]=DCCA_nomal(X,Y)

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
Y=transpose(Y);
X=transpose(X);
% 构造Zp（过去信息）、Yf（未来输出）、Xf（未来输入）
for i= 2:nY-10
zp(1) = Y(i-1,:);
zp(2:mX+1) = X(i-1,:);
Zp(i-1,:) = zp;                

yf(1) = Y(i,:);
yf(2) = Y(i+1,:);
yf(3) = Y(i+2,:);
yf(4) = Y(i+3,:);
yf(5) = Y(i+4,:);

Yf(i-1,:) = yf;

xf(1:mX) = X(i,:);
xf(mX+1:2*mX) = X(i+1,:);
xf(2*mX+1:3*mX) = X(i+2,:);
xf(3*mX+1:4*mX) = X(i+3,:);
xf(4*mX+1:5*mX) = X(i+4,:);

Xf(i-1,:) = xf;
end

Z(:,1:mX+mY) = Zp;
Z(:,mX+mY+1:6*mX+mY) = Xf;
[mZ,nZ]=size(Z);

Z_cov = Z' * Z/(mZ-1);
Z_Yf_cov = Z' * Yf/(mZ-1);
% Yf_Z_cov = Yf * Z'/(mZ-1);
Yf_cov = Yf' * Yf/(mZ-1);
COV = (Z_cov^-0.5)*Z_Yf_cov*(Yf_cov^-0.5);
r_rank = rank(COV);
[U,S,V] = svd(COV);
Js = (Z_cov^-0.5) * U(:,1:r_rank);
Ls = (Yf_cov^-0.5) * V(:,1:r_rank);
% Ms = Js*S';
An = Ls*Yf'*Z*Js;
Md = An*Js' ;
%计算控制限
m=mZ;
n=nZ;
alpha=0.95;%置信水平
%求X的协方差矩阵的最大特征值
s=cov(Z);
Romita_max=max(eig(s));
Jth_T2=Romita_max*r_rank*(n^2-1)*finv(alpha,r_rank,n-r_rank)/(n*(n-r_rank));
Jth_SPE=Romita_max*chi2inv(alpha,r_rank);


