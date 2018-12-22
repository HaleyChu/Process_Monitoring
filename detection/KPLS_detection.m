function [nx,T2,SPE]=KPLS_detection(x,y,X,U,T,c)
[mx,nx]=size(x);
[my,ny]=size(y);
%求均值
X_mean=mean(X,2);
X_std = std(X,0,2);
[mX,nX]=size(X);
X=(X - repmat(X_mean,1,nX))./repmat(X_std,1,nX);
X = transpose(X);

x = transpose(x);
y = transpose(y);
% n个采样值m个变量
for i=1:nX
    for j=1:nX
        K_raw(i,j)=exp(-norm(X(i,:)-X(j,:))/c);
    end
end
% 计算核矩阵，c为输入的核参数
K=(eye(nX)-ones(nX,1)*ones(1,nX)/nX)*K_raw*(eye(nX)-ones(nX,1)*ones(1,nX)/nX);

SPE=zeros(nx,1);
T2=zeros(nx,1);

for i=1:nx
   for j=1:nX
       K_raw_new(j,i)=exp(-norm(X(j,:)-x(i,:))/c);
   end
% 计算新的核向量
   K_new(:,i)=(eye(nX)-ones(nX,1)*ones(nX,1)'/nX)*(K_raw_new(:,i)-K_raw*ones(nX,1)/nX);
%中心化核向量
    tnew(:,i)=inv(U'*K*T)*U'*K_new(:,i);
% 计算新的得分向量
    T2(i)=tnew(:,i)'*inv(T'*T/(nX-1))*tnew(:,i);
 %计算训练样本的T2统计量
    SPE(i)=1-2*sum(K_raw_new(:,i),1)/nX+sum(K_raw(:))/nX^2-2*tnew(:,i)'*T'*K_new(:,i)+tnew(:,i)'*T'*K*T*tnew(:,i);
 %计算训练样本SPE统计量
end