function [t,p,r,Jth_T2,Jth_SPE]=DPLS_nomal(X,Y)
% clc
% clear all
% data=xlsread('nomal_data.xlsx');
% Y=data(1:5,:);
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
Y=transpose(Y);
X=transpose(X);

for i= 2:nX-10
    xf(1:mX) = X(i,:);
    xf(mX+1:2*mX) = X(i+1,:);
    xf(2*mX+1:3*mX) = X(i+2,:);
    xf(3*mX+1:4*mX) = X(i+3,:);
    xf(4*mX+1:5*mX) = X(i+4,:);
    Z(i-1,:) = xf;
    
    yf(1) = Y(i,:);
    yf(2) = Y(i+1,:);
    yf(3) = Y(i+2,:);
    yf(4) = Y(i+3,:);
    yf(5) = Y(i+4,:); 
    Yf(i-1,:) = yf;
end
[nZ,mZ]=size(Z);
%标准模型
[t,p,u,q,w,E] = PLSI (Z,Yf);
 r = w * (p'*w)^(-1);
 %求X的协方差矩阵的最大特征值
 s=cov(Z);
 Romita_max=max(eig(s));
%计算控制限
m=mZ;
n=nZ;
alpha=0.95;%置信水平
Jth_T2=m*(n^2-1)*finv(alpha,m,n-m)/(n*(n-m));
for i=1:nZ
%     tnew = Z(i,:)*r;
    xnew = Z(i,:)*(eye(mZ)-p*r');
    SPE(i) = norm(xnew)^2;
end
a=mean(SPE);
b=std(SPE);
g=b/(2*a);
h=2*a^2/b;
% Jth_SPE=Romita_max*chi2inv(alpha,m);
Jth_SPE=g*chi2inv(alpha,h);
% % Z(:,:,1)=X(:,1:300);
% % Z(:,:,2)=X(:,301:600);
% % Z(:,:,3)=X(:,601:900);
% % 
% % theta=Y(:,1:300);
% % 
% % %标准模型
% % Numloop=10000;
% % u=theta(1,:);
% % % beta=ones(mX,1);
% % for i=1:Numloop
% %     
% %     for j=1:3
% %         w(:,:,j)=Z(:,:,j)*u'/norm(Z(:,:,j)*u');
% %         t(:,:,j)=w(:,:,j)'*Z(:,:,j);
% %     end
% %     tG=[t(:,:,1) t(:,:,2) t(:,:,3)];
% %     beta=tG'*u/norm(tG'*u);
% %     tg=tG*beta;
% %     q=theta*tg'/(tg*tg');
% %     uNew=q'*theta/(q'*q);
% %     
% %     if norm(uNew)-norm(u) < 10e-12     %判断u是否收敛
% %         break
% %     end
% %     u=uNew;
% % end
% % %计算控制限
% % m=mX;
% % n=nX;
% % alpha=0.95;%置信水平
% % % Romita_max=LATENT(1);
% % Jth_T2=m*(n^2-1)*finv(alpha,m,n-m)/(n*(n-m));
% % % Jth_SPE=Romita_max*chi2inv(alpha,m);

