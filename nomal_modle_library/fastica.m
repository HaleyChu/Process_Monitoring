function [W,B,X_whitened,Q,x_mean,x_var] = fastica(data,numics,noisy,maxIter,method,tol)

% implements the fast ICA algorithm (Hyvarinen 1999) after preprocessing data
% with centering (columnwise zero-mean) and whitening.
%
% --- Parameters ---
% data:
%       array size should be DIMxN_OBSERVATIONS. Will work best if
%       N_OBSERVATIONS >> DIM.
% numics:
%       number of independent components desired. If none entered, numics =
%       min(DIM,N_OBSERVATIONS).
% noisy:
%       default = 0. prints #steps to convergence for each numics.
% maxIter:
%       max number of iterations. default = 1000.
% method:
%       approximate Newton's method. (add more later)
% tol:
%       default = -(1E-9). when abs(dot(w_new,w_initial)) - 1 > tol, we
%       treat it as convergence. 
%       NOTE TO SELF: dbl check tol (matlab may round by default)

if nargin<2, numics = min(size(data)); end
if nargin<3, noisy = 0; end
if nargin<4, maxIter = 1000; end
if nargin<5, method = 'newton'; end
if nargin<6, tol = 1-(1E-9); end

%--- Preprocessing ---
% 
% colMean = mean(data,2);
% X_demeaned = bsxfun(@minus,data,colMean);
% [U,S,V] = svd(X_demeaned,'econ');
% M = sqrt(size(V,1)-1)*(diag(1./diag(S)))*U';
% X_whitened = M*U*S*V';
% invM = (1/sqrt(size(V,1)-1))*U*S;   %M^-1
x_mean=mean(data);
x_var=std(data);
x=zscore(data);
[n,m]=size(x);
Cx = cov(x,1);
[U,D,V] = svd(Cx);
Q=D^(-0.5)*U';

X_whitened=Q*x'; 
M=Q;


if numics>min(size(X_whitened)) || mod(numics,1) ~= 0
    numics = min(size(X_whitened));
    fprintf('\nThe value entered for numics is larger than min dimension of X_whitened (or was a fraction).\nNumics has now been set to = %.f.\n',numics);
    fprintf('Continue using dbcont or enter numics=desiredValue from keyboard . . .\n\n');
    keyboard();
end

% Size of W~ should be NUMICSxDIM where X is DIMxN_SAMPLES
W = []; P = 0;

for i=1:numics
    
    tolX = 0;
    
    % Randomly initialize w_i as column vector
    w_initial = rand(size(X_whitened,1),1);
    w_initial = w_initial/norm(w_initial);
    
    for j=1:maxIter
        
        if tolX < tol
            
            switch method
                case 'newton'
                    
                    % ------------------------------------------------------------
                    % Approximate Newton Method (with approximated Jacobian)
                    % ------------------------------------------------------------
                    
                    g = contrastFunc(X_whitened'*w_initial);
                    gp = contrastFuncDerivative(w_initial'*X_whitened);
                    
                    w_new = (X_whitened*g)-(gp*ones(size(gp))'*w_initial);
                    
                    %                     % --- SANITY CHECK ---
                    %                     % comparing with gram-schmidt
                    %                     if i>1
                    %                         w_M = repmat(w_new,[1,i-1]);
                    %                         proj_W_wi = dot(w_M,W(1:i-1,:)')./dot(W(1:i-1,:)',W(1:i-1,:)');
                    %                         w_M = bsxfun(@times,proj_W_wi,W(1:i-1,:)');
                    %                         proj_W_wi = sum(w_M,2);
                    %                         w_new = w_new - proj_W_wi;
                    %                     end
                    %
                    %                     w_new = w_new/norm(w_new);
                    
                    % Ensure orthonormality using projection matrix P = W~'*W~
                    % P was initialized at 0 at line 47.
                    w_new_unnorm = w_new - P*w_new;
                    w_new = w_new_unnorm/norm(w_new_unnorm);
                    
                    % Update values
                    tolX = abs(dot(w_new,w_initial));
                    w_initial = w_new;
                    
                otherwise
                    % add more later
                    fprintf('at this time, have only implemented approximate Newton method\n\n');
            end
            
            if j==maxIter && noisy==1
                fprintf('\nIteration %.f / %.f \t:\t |dot(w_t+1,w_t)| = %f\n\n',j,maxIter,tolX);
            end
            
        else
            
            % Has met stopping criteria.
            if noisy
                fprintf('\nindependent component no. %.i : \nCONVERGED at %.f steps. . . |dot(w_t+1,w_t)| > 1-(10^-9)\n\n',i,j);
            end
            break;
            
        end
        
    end
    
    % Update P, W~ with final w_new at convergence or maxIter
    P = P+w_new*w_new';
    W(i,:) = w_new;
    
end

% Recover original W and A from W~ = inv(A~) = transpose A~
% 
% W1 = W;
% W = W1*M;
% A = invM*W1';
B=W;
W=B'*Q;
% %--- sanity check ---
% figure(1); clf(1);
% for i=1:numics
%    subplot(numics,1,i);
%     plot(W(i,:)*data);
% end

end

% --- contrast functions. add more options ---

function g = contrastFunc(u)
g = tanh(u);
end

function gp = contrastFuncDerivative(u)
gp = 1-tanh(u).^2;
end