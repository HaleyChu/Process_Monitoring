function [nx,T2,SPE]=KPCA_detection(x,X,P,A,B,lamda,c)
[mx,nx]=size(x);
% [my,ny]=size(y);
%求均值
% y_mean=mean(y,2);
X_mean=mean(X,2);
X_std = std(X,0,2);
[mX,nX]=size(X);
X=(X - repmat(X_mean,1,nX))./repmat(X_std,1,nX);

x = transpose(x);
X = transpose(X);
ay=x;
[N]=size(X,1);
[Ny]=size(ay,1);
for i=1:N
    for j=1:N
        K(i,j)=exp(-norm(X(i,:)-X(j,:))^2/c);%求核矩阵
    end
end
n1=ones(N,N);
N1=1/N*n1;
for i=1:Ny
    for j=1:N
        Ky(i,j)=exp(-norm(ay(i,:)-X(j,:))^2/c);
    end
end
t1=ones(1,N);
t11=1/N*t1;
for i=1:Ny
    kp1(i,:)= Ky(i,:)-t11*K- Ky(i,:)*N1+t11*K*N1;
end
for i=1:Ny
    for k=1:B
        t(i,k)=P(:,k)'*kp1(i,:)';
    end
end
%    求T2,SPE
%    covtyb=inv(t'*t);
SPE=zeros(Ny,1);
T2=zeros(Ny,1);
for i=1:Ny
    T2(i)=t(i,1:A)*inv(lamda(1:A,1:A))*t(i,1:A)';   %也可以
    %       SPE(i)=t(i,1:npc)*t(i,1:npc)';
    %       T2(1,i)=t(i,1:npc)*(covtyb(1:npc,1:npc))*t(i,1:npc)';
    SPE(i)=t(i,(A+1):B)*t(i,(A+1):B)';
end