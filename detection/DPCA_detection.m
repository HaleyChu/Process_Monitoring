function [nx,T2,SPE]=DPCA_detection(x,y,P,T, LATENT,A)
%DDPCA_DETECTION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[mx,nx]=size(x);
% [my,ny]=size(y);
%���ֵ
% y_mean=mean(y,2);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
x = transpose(x);
%%�������ݹ��̼��

for i= 2:nx-10
    xf(1:mx) = x(i,:);
    xf(mx+1:2*mx) = x(i+1,:);
    xf(2*mx+1:3*mx) = x(i+2,:);
    xf(3*mx+1:4*mx) = x(i+3,:);
    xf(4*mx+1:5*mx) = x(i+4,:);
    
    z(i-1,:) = xf;
end
[nz,mz]=size(z);
SPE=zeros(nx,1);
T2=zeros(nx,1);
for i=1:nz
    T2(i) = z(i,:)*P(:,1:A)*inv(diag(LATENT(1:A)))*P(:,1:A)'*z(i,:)';
    SPE(i)=z(i,:)*(eye(mz) - P(:,1:A)*P(:,1:A)')*z(i,:)';
end
end

