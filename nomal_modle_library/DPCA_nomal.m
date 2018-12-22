function [P,T, LATENT,A,Jth_T2,Jth_SPE]=DPCA_nomal(X,Y)
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
Y=transpose(Y);
X=transpose(X);

for i= 2:nX-10
    xf(1:mX) = X(i,:);
    xf(mX+1:2*mX) = X(i+1,:);
    xf(2*mX+1:3*mX) = X(i+2,:);
    xf(3*mX+1:4*mX) = X(i+3,:);
    xf(4*mX+1:5*mX) = X(i+4,:);
    
    Z(i-1,:) = xf;
end
[nZ,mZ]=size(Z);
[COEFF, SCORE, LATENT] = pca(Z);
P=COEFF;
T= SCORE;
per=0.85;
A=0;
for i=1:mZ
     cpv(i)=sum(LATENT(1:i))/sum(LATENT); %前A个主元的累计贡献率公式
    if cpv(i)>=per
       A=i;
       break
    end
end
%计算控制限
m=mZ;
n=nZ;
alpha=0.95;%置信水平
theta1=sum(LATENT(A+1:m));
theta2=sum(LATENT(A+1:m).^2);
theta3=sum(LATENT(A+1:m).^3);
h0=1-2*theta1*theta3/(3*theta1^2);
ca= norminv(alpha,0,1);

Jth_T2=A*(n^2-1)*finv(alpha,A,n-A)/(n*(n-A));
Jth_SPE=theta1*(ca*sqrt(2*theta2*h0^2)/theta1+1+theta2*h0*(h0-1)/theta1^2)^(1/h0);
% % seg_num=fix(nX/100);
% % Z(:,:,1)=X(:,1:100);
% % if seg_num>1
% %     for i=2:seg_num
% %         a=(i-1)*100+1;
% %         b=i*100;
% %         Z(:,:,i)=X(:,a:b);
% %     end
% % end


% % Numloop=10000;
% % tg=ones(mX,1);
% % for i=1:Numloop
% %     for j=1:seg_num 
% %         w(:,:,j)=Z(:,:,j)'*tg/norm(Z(:,:,j)'*tg) ;
% %         t(:,:,j)=Z(:,:,j)*w(:,:,j); 
% %         tG(:,j)=t(:,:,j);
% %     end
% %     beta=tG'*tg/norm(tG'*tg);
% %     tgNew=tG*beta;
% %     if norm(tgNew-tg) < 10e-12     %判断u是否收敛
% %         break
% %     end
% %     tg=tgNew;
% %     for j=1:seg_num 
% %         Pg(:,j)=Z(:,:,j)'*tg*(tg'*tg)^(-1);
% %     end
% % end
% % %计算控制限
% % m=mX;
% % n=nX;
% % alpha=0.95;%置信水平
% % % Romita_max=LATENT(1);
% % Jth_T2=m*(n^2-1)*finv(alpha,m,n-m)/(n*(n-m));
% % % Jth_SPE=Romita_max*chi2inv(alpha,m);