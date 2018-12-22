function [ nx,T2,SPE ] = DCCA_detection( x,y,Ls,S,Md )
%CCA_DETECTION 此处显示有关此函数的摘要
%   此处显示详细说明

[mx,nx]=size(x);
[my,ny]=size(y);
x = transpose(x);
y = transpose(y);
SPE=zeros(nx,1);
T2=zeros(nx,1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i= 2:ny-10
zp(1) = y(i-1,:);
zp(2:mx+1) = x(i-1,:);
Zp(i-1,:) = zp; 

yf(1) = y(i,:);
yf(2) = y(i+1,:);
yf(3) = y(i+2,:);
yf(4) = y(i+3,:);
yf(5) = y(i+4,:);

Yf(i-1,:) = yf;

xf(1:mx) = x(i,:);
xf(mx+1:2*mx) = x(i+1,:);
xf(2*mx+1:3*mx) = x(i+2,:);
xf(3*mx+1:4*mx) = x(i+3,:);
xf(4*mx+1:5*mx) = x(i+4,:);

Xf(i-1,:) = xf;
end
Z(:,1:mx+my) = Zp;
Z(:,mx+my+1:6*mx+my) = Xf;
[nZ,mZ]=size(Z);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:nZ
%     a=Ls*y(i,:)';
%     b=Ms'*x(i,:)';
    r(i,:)=Yf(i,:)*Ls'-Z(i,:)*Md';
    a=size(Ls,1);
    f=eye(a)-(S(a))^2;
    T2(i)=r(i,:)*f^(-1)*r(i,:)'/(nZ^2);
    SPE(i)=r(i,:)*r(i,:)'/(nZ^2);

%     Rk = Ls'*y(:,i) - Ms'*x(:,i);
%     Qcca(i) = Rk'* Rk;
%     T2(i)=1;
end
% nx=nZ;

