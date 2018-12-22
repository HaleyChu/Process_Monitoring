function [ nx,T2,SPE ] = CCA_detection( x,y,Js,Ls,Ms,S )
%CCA_DETECTION 此处显示有关此函数的摘要
%   此处显示详细说明

[mx,nx]=size(x);
[my,ny]=size(y);
x = transpose(x);
y = transpose(y);
SPE=zeros(nx,1);
T2=zeros(nx,1);
for i=1:nx
%     a=Ls*y(i,:)';
%     b=Ms'*x(i,:)';
    r(i,:)=Ls'*y(i,:)-x(i,:)*Ms;
    a=size(Ls,1);
    f=eye(a)-(S(a))^2;
    %T2(i)=r(i,:)*f^(-1)*r(i,:)'/10^5;
    SPE(i)=r(i,:)*r(i,:)';
    T2(i)=SPE(i);

%     Rk = Ls'*y(:,i) - Ms'*x(:,i);
%     Qcca(i) = Rk'* Rk;
%     T2(i)=1;
end

