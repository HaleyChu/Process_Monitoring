function [t,p,u,q,w,E] = PLSI (x,y)
% 
% ����:
% x 
% y     
% 
% ���:
% t     x�ĵ÷־���
% p     x�ĸ��ؾ���
% u     y�ĵ÷־���
% q     y�ĸ��ؾ���


% x��y������������
[nX,mX]  =  size(x);
[nY,mY]  =  size(y);

% �������̵Ĵ�����nMaxIteration
% nMaxIteration = max([mX,mY]);
 nMaxOuter = 10000;
% PRESS=zeros(nMaxIteration,1);
nMaxIteration=2;
for iIteration = 1 : nMaxIteration
    
    % ѡ��y����һ��ƽ�������    
%     [dummy,tNum] =  max(diag(x'*x));
    [dummy,uNum] =  max(diag(y'*y));
%     tTemp = x(:,tNum);
    uTemp = y(:,uNum);
  
    for iOuter = 1 : nMaxOuter
        wTemp = x' * uTemp/ norm(x' * uTemp);
        tTemp = x * wTemp/(wTemp'*wTemp);
        qTemp = y' * tTemp/ norm (y' * tTemp);
        uNew = y * qTemp/(qTemp'*qTemp);
        if norm(uTemp - uNew) < 10e-12     %�ж�u�Ƿ�����
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

