function [ nx,T2,SPE ] = PLS_detection( x,y,t,p,r,nX )
%PLS_DETECTION 此处显示有关此函数的摘要
%   此处显示详细说明
[mx,nx]=size(x);
[my,ny]=size(y);
%求均值

x = transpose(x);
y = transpose(y);
%%进行数据过程监测
SPE=zeros(nx,1);
T2=zeros(nx,1);
for i=1:nx
    tnew = x(i,:)*r;
    xnew = x(i,:)*(eye(mx)-p*r');
    SPE(i) = norm(xnew)^2;
    T2(i) = tnew*(t'*t/(nX-1))*tnew';
end
end

