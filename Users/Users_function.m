function [ users_Jth_T2,users_Jth_SPE,users_nx,users_T2,users_SPE ] = Users_function( X,Y,x,y )
%USERS_FUNCTION 此处显示有关此函数的摘要
%   此处显示详细说明
%输入变量说明：
%            X，Y为训练数据
%            x，y为故障数据
%输出变量说明：
%            users_Jth_T2为T^2统计量的控制限
%            users_Jth_SPE为SPE统计量的控制限
%            users_nx为采样个数
%            users_T2为T^2统计量
%            users_SPE为SPE统计量
%            
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
[COEFF, SCORE, LATENT] = pca(X);
P=COEFF;
T= SCORE;
per=0.85;
A=0;
for i=1:mX
     cpv(i)=sum(LATENT(1:i))/sum(LATENT); %前A个主元的累计贡献率公式
    if cpv(i)>=per
       A=i;
       break
    end
end
%计算控制限
m=mX;
n=nX;
alpha=0.95;%置信水平
Romita_max=LATENT(1);
users_Jth_T2=A*(n^2-1)*finv(alpha,A,n-A)/(n*(n-A));
users_Jth_SPE=Romita_max*chi2inv(alpha,A);
% P=P(:,1:A);
% LATENT=LATENT(1:A);

[mx,users_nx]=size(x);
% [my,ny]=size(y);
%求均值
% y_mean=mean(y,2);
x_mean=mean(x,2);
%求标准差
% y_std = std(y,0,2);
x_std = std(x,0,2);
% y=(y - repmat(y_mean,1,ny))./repmat(y_std,1,ny);
x=(x - repmat(x_mean,1,users_nx))./repmat(x_std,1,users_nx);
x = transpose(x);
%%进行数据过程监测
users_SPE=zeros(users_nx,1);
users_T2=zeros(users_nx,1);
for i=1:users_nx
    users_T2(i) = x(i,:)*P*inv(diag(LATENT))*P'*x(i,:)';
    users_SPE(i)=x(i,:)*(eye(mx) - P*P')*x(i,:)';
end
end