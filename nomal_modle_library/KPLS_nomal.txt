function [U,T,Jth_T2,Jth_SPE]=KPLS_nomal(X,Y,c)

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
% n个采样值m个变量
for i=1:nX
    for j=1:nX
        K_raw(i,j)=exp(-norm(X(i,:)-X(j,:))/c);
    end
end
% 计算核矩阵，c为输入的核参数
K=(eye(nX)-ones(nX,1)*ones(1,nX)/nX)*K_raw*(eye(nX)-ones(nX,1)*ones(1,nX)/nX);
K_res=K;


% 中心化核矩阵
A=20;
U=zeros(nX,A);
T=zeros(nX,A);
% 初始化u,t,q
for i=1:A
    U(:,i)=Y(:,1);
    for j=1:100
% 假设迭代100次以内ti收敛
    	t_raw=T(:,i);
     	T(:,i)=K_res*U(:,i);
%t为得分向量
    	T(:,i)=T(:,i)/norm(T(:,i));
%  归一化ti为单位长度
    	q(:,i)=Y'*T(:,i);
%q为对Y的负载向量
    	U(:,i)=Y*q(:,i);
%u为从Y中抽取的潜变量        
        U(:,i)=U(:,i)/norm(U(:,i));
%归一化ui为单位长度
    	if norm(T(:,i)-t_raw)/norm(t_raw)<1e-6	
	   break;
        end
%判断ti是否收敛
    end
K_res=(eye(nX)-T(:,i)*T(:,i)')*K_res*(eye(nX)-T(:,i)*T(:,i)');
%去除第i个成分后的K
Y=(eye(nX)-T(:,i)*T(:,i)')*Y;
%去除第i个成分后Y
end
SPE_train=diag(K_res);
for i=1:nX
    T2_train(i)=T(i,:)*inv(T'*T/nX)*T(i,:)';
    %计算训练样本的T2统计量
end
Jth_SPE=var(SPE_train)/(2*mean(SPE_train))*chi2inv(0.99,2*mean(SPE_train)^2/var(SPE_train));
% % 计算SPE统计量控制限
Jth_T2=A*(nX^2-1)/((nX-A)*nX)*finv(0.99,A,(nX-A));