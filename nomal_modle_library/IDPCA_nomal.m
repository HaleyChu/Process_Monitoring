function [tg,Jth_T2]=IDPCA_nomal(X,Y)
% clc
% clear all
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

Z(:,:,1)=X(:,1:300);
Z(:,:,2)=X(:,301:600);
Z(:,:,3)=X(:,601:900);


Numloop=10000;
tg=ones(mX,1);
beta=[1,1,1]';
for i=1:Numloop
    for j=1:3
        w(:,:,j)=Z(:,:,j)'*tg/norm(Z(:,:,j)'*tg) ;
    end
    w=beta(1,:)*w(:,:,1)+beta(2,:)*w(:,:,2)+beta(3,:)*w(:,:,3);
    w=w/norm(w);
    for j=1:3
        t(:,:,j)=Z(:,:,j)*w;
    end
    tG=[t(:,:,1) t(:,:,2) t(:,:,3)];
    beta=tG'*tg/norm(tG'*tg);
    tgNew=tG*beta;
    if norm(tgNew-tg) < 10e-12     %判断是否收敛
        break
    end
    tg=tgNew;
end
%计算控制限
m=mX;
n=nX;
alpha=0.95;%置信水平
% Romita_max=LATENT(1);
Jth_T2=m*(n^2-1)*finv(alpha,m,n-m)/(n*(n-m));
% Jth_SPE=Romita_max*chi2inv(alpha,m);