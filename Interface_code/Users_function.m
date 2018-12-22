function [ users_Jth_T2,users_Jth_SPE,users_nx,users_T2,users_SPE ] = Users_function( X,Y,x,y )
%USERS_FUNCTION �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%�������˵����
%            X��YΪѵ������
%            x��yΪ��������
%�������˵����
%            users_Jth_T2ΪT^2ͳ�����Ŀ�����
%            users_Jth_SPEΪSPEͳ�����Ŀ�����
%            users_nxΪ��������
%            users_T2ΪT^2ͳ����
%            users_SPEΪSPEͳ����
%            
Y_mean=mean(Y,2);
X_mean=mean(X,2);
%���׼��
Y_std = std(Y,0,2);
X_std = std(X,0,2);
%���ݱ�׼��
[mY,nY]=size(Y);
[mX,nX]=size(X);
Y=(Y - repmat(Y_mean,1,nY))./repmat(Y_std,1,nY);
X=(X - repmat(X_mean,1,nX))./repmat(X_std,1,nX);
X = transpose(X);
%��׼ģ��
[COEFF, SCORE, LATENT] = pca(X);
P=COEFF;
T= SCORE;
per=0.85;
A=0;
for i=1:mX
     cpv(i)=sum(LATENT(1:i))/sum(LATENT); %ǰA����Ԫ���ۼƹ����ʹ�ʽ
    if cpv(i)>=per
       A=i;
       break
    end
end
%���������
m=mX;
n=nX;
alpha=0.95;%����ˮƽ
theta1=sum(LATENT(A+1:m));
theta2=sum(LATENT(A+1:m).^2);
theta3=sum(LATENT(A+1:m).^3);
h0=1-2*theta1*theta3/(3*theta1^2);
ca= norminv(alpha,0,1);

users_Jth_T2=A*(n^2-1)*finv(alpha,A,n-A)/(n*(n-A));
users_Jth_SPE=theta1*(ca*sqrt(2*theta2*h0^2)/theta1+1+theta2*h0*(h0-1)/theta1^2)^(1/h0);
% P=P(:,1:A);
% LATENT=LATENT(1:A);

[mx,users_nx]=size(x);
% [my,ny]=size(y);
%���ֵ
% % y_mean=mean(y,2);
% x_mean=mean(x,2);
% %���׼��
% % y_std = std(y,0,2);
% x_std = std(x,0,2);
% % y=(y - repmat(y_mean,1,ny))./repmat(y_std,1,ny);
x=(x - repmat(X_mean,1,users_nx))./repmat(X_std,1,users_nx);
x = transpose(x);
%%�������ݹ��̼��
users_SPE=zeros(users_nx,1);
users_T2=zeros(users_nx,1);
for i=1:users_nx
    users_T2(i) = x(i,:)*P(:,1:A)*inv(diag(LATENT(1:A)))*P(:,1:A)'*x(i,:)';
    users_SPE(i)=x(i,:)*(eye(mx) - P(:,1:A)*P(:,1:A)')*x(i,:)';
end
end