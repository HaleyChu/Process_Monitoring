function [t,p,u,q,w,E] = PLSI (x,y)
% 
% 输入:
% x 
% y     
% 
% 输出:
% t     x的得分矩阵
% p     x的负载矩阵
% u     y的得分矩阵
% q     y的负载矩阵


% x，y的行数和列数
[nX,mX]  =  size(x);
[nY,mY]  =  size(y);

% 迭代过程的次数：nMaxIteration
% nMaxIteration = max([mX,mY]);
 nMaxOuter = 10000;
% PRESS=zeros(nMaxIteration,1);
nMaxIteration=2;
for iIteration = 1 : nMaxIteration
    
    % 选出y的哪一列平方和最大    
%     [dummy,tNum] =  max(diag(x'*x));
    [dummy,uNum] =  max(diag(y'*y));
%     tTemp = x(:,tNum);
    uTemp = y(:,uNum);
  
    for iOuter = 1 : nMaxOuter
        wTemp = x' * uTemp/ norm(x' * uTemp);
        tTemp = x * wTemp/(wTemp'*wTemp);
        qTemp = y' * tTemp/ norm (y' * tTemp);
        uNew = y * qTemp/(qTemp'*qTemp);
        if norm(uTemp - uNew) < 10e-12     %判断u是否收敛
            break
        end
       
        uTemp = uNew;
        
    end
    %
    pTemp = x' * tTemp/(tTemp' * tTemp);
    e = x - tTemp * pTemp';
    f = y - tTemp * qTemp';
    %%%%%%%%%%%%%%%%%%%%%%
%     rTemp = wTemp * [inv(pTemp'*wTemp)];
    %%%%%%%%%%%%%%%%%%%%%%
    % save iteration results to outputs:
    t(:, iIteration)           = tTemp;
    p(:, iIteration)           = pTemp;
    u(:, iIteration)           = uTemp;
    q(:, iIteration)           = qTemp;
    w(:, iIteration)           = wTemp;

    %%%%%%%%%%%%%%%%%%%%%%
%     r(:, iIteration)           = rTemp;
    %%%%%%%%%%%%%%%%%%%%%%
    
    x=e;
    y=f;
    E=e;
end

