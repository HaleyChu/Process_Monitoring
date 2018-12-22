function [ nx,T2,SPE ] = DPLS_detection( x,y,t,p,r )
%PLS_DETECTION 此处显示有关此函数的摘要
%   此处显示详细说明
[mx,nx]=size(x);
[my,ny]=size(y);
x = transpose(x);
y = transpose(y);
for i= 2:nx-10
    xf(1:mx) = x(i,:);
    xf(mx+1:2*mx) = x(i+1,:);
    xf(2*mx+1:3*mx) = x(i+2,:);
    xf(3*mx+1:4*mx) = x(i+3,:);
    xf(4*mx+1:5*mx) = x(i+4,:);
    Z(i-1,:) = xf;
    
    yf(1) = y(i,:);
    yf(2) = y(i+1,:);
    yf(3) = y(i+2,:);
    yf(4) = y(i+3,:);
    yf(5) = y(i+4,:); 
    Yf(i-1,:) = yf;
end
[nZ,mZ]=size(Z);
%%进行数据过程监测
SPE=zeros(nx,1);
T2=zeros(nx,1);
for i=1:nZ
    tnew = Z(i,:)*r;
    xnew = Z(i,:)*(eye(mZ)-p*r');
    SPE(i) = norm(xnew)^2/10;
    T2(i) = tnew*(t'*t/(nZ-1))*tnew'/100;
end
for i=nZ+1:nx
    SPE(i) = SPE(nZ);
    T2(i) = T2(nZ);
end

