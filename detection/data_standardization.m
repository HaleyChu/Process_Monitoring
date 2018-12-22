function [x,y] = data_standardization( X,Y,x,y )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
Y_mean=mean(Y,2);
X_mean=mean(X,2);
% y_mean = mean(y,2);
% x_mean = mean(x,2);
%求标准差
Y_std = std(Y,0,2);
X_std = std(X,0,2);

[mx,nx]=size(x);
[my,ny]=size(y);

y=(y - repmat(Y_mean,1,ny))./repmat(Y_std,1,ny);
x=(x - repmat(X_mean,1,nx))./repmat(X_std,1,nx);

end

