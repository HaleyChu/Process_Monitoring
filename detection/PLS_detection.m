function [ nx,T2,SPE ] = PLS_detection( x,y,t,p,r,nX )
%PLS_DETECTION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[mx,nx]=size(x);
[my,ny]=size(y);
%���ֵ

x = transpose(x);
y = transpose(y);
%%�������ݹ��̼��
SPE=zeros(nx,1);
T2=zeros(nx,1);
for i=1:nx
    tnew = x(i,:)*r;
    xnew = x(i,:)*(eye(mx)-p*r');
    SPE(i) = norm(xnew)^2;
    T2(i) = tnew*(t'*t/(nX-1))*tnew';
end
end

