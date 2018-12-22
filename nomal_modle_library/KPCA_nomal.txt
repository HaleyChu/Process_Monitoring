function [P,A,B,lamda,Jth_T2,Jth_SPE]=KPCA_nomal(X,Y,c)
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
X = transpose(X);
ax=X;

[Nx]=size(ax,1);
mean_X =  mean(ax);
std_X=std(ax);
ax=ax-mean_X(ones(Nx,1),:);
std_X(find(std_X==0))=1;%数据预处理
ax=ax./std_X(ones(Nx,1),:);

[N]=size(ax,1);
for i=1:N
    for j=1:N
        K(i,j)=exp(-norm(ax(i,:)-ax(j,:))^2/c);%求核矩阵
    end
end
n1=ones(N,N);
N1=1/N*n1;
Kp=K-N1*K-K*N1+N1*K*N1;
[u,s,v]=svd(Kp/N);
lamda=s;
P=v;
lamda=diag(lamda);
B=length(find(lamda>1e-10));   %求非零的特征值个数
%求主元个数
A=1;
while sum(lamda(1:A))/sum(lamda(1:B))<0.9
    A=A+1;
end
% npc
%求特征空间有效维数
DimFS=1;
while sum(lamda(1:DimFS))/sum(lamda(1:B))<=0.99
    DimFS=DimFS+1;
end
lamda=diag(lamda);
for i=1:B
    
    %     P(:,i)=P(:,i)/norm(P(:,i)*s(i,i));
    P(:,i)=P(:,i)/(norm(P(:,i))*sqrt(N*lamda(i,i)));
end
%T2,SPE控制线
Jth_T2=A*(N-1)*(N+1)*icdf('f',0.99,A,N-A)/(N*(N-A));
for i=1:3
    theta(i)=trace((lamda(A+1:DimFS,A+1:DimFS))^i);
end
h0=1-2*theta(1)*theta(3)/(3*theta(2)^2);
ca=icdf('norm',0.99,0,1);
Jth_SPE=theta(1)*(ca*sqrt(2*theta(2)*h0^2)/theta(1)+1+theta(2)*h0*(h0-1)/theta(1)^2)^(1/h0);
