% aa=load('Sensor_drift_fault.mat');
% bb(:,1)=aa.IiF.signals(1).values;
% bb(:,2)=aa.IiF.signals(2).values;
% bb(:,3)=aa.IiF.signals(3).values;
% bb(:,4)=aa.S.signals(1).values;
% bb(:,5)=aa.S.signals(2).values;
% bb(:,6)=aa.S.signals(3).values;
% bb(:,7)=aa.Ucd.signals(1).values;
% bb(:,8)=aa.Ucd.signals(2).values;
% bb(:,9)=aa.Un.signals(1).values;
% bb(:,10)=aa.Un.signals(2).values;
% bb=bb';

clc
% data_normal=xlsread('pkx101.xls');
% data_test=xlsread('pkx102.xls');
% X=data_normal(:,1:20)';
% Y=data_normal(:,21)';
% A=data_test(:,1:20)';
% B=data_test(:,21)';
X=load('normal_Xspeed.mat');
Y=load('normal_Yspeed.mat');
AA=load('IiFault_Xspeed.mat');
BB=load('IiFault_Yspeed.mat');
testX=X.bb2;
testY=Y.bb1;
testx=AA.bb2;
testy=BB.bb1;

% testX=X.bb21;
% testY=Y.bb11;
% testx=AA.bb21;
% testy=BB.bb11;
% PLS_detection;
% PLS_nomal
% [t,p,r,nX,Jth_T2,Jth_SPE]=PLS_nomal(testX,testY);(testX(:,20000:30000),testY(:,20000:30000));(:,200000:400000)
[Js,Ls,Ms,S,Jth_T2,Jth_SPE]=CCA_nomal(testX,testY);
% [P,T, LATENT,A,Jth_T2,Jth_SPE]=PCA_nomal(testX,testY);
[x,y] = data_standardization( testX,testY,testx,testy );
% [nx,T2,SPE]=PCA_detection(x,y,P,LATENT,A);
[ nx,T2,SPE ] = CCA_detection( x,y,Js,Ls,Ms,S );
% [ nx,T2,SPE ] = PLS_detection( x,y,t,p,r,nX );

subplot(2,1,1);
t=1:nx;
plot(t,T2,'b -');hold on
xlabel('样本编号');
ylabel('T2统计量');
hold on %不覆盖原图
line([0,nx],[Jth_T2,Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
legend('统计量J','控制限J_{th}');

subplot(2,1,2);
plot(1:nx,SPE,'b -');
xlabel('样本编号');
ylabel('Q统计量');
hold on
line([0,nx],[Jth_SPE,Jth_SPE],'LineStyle','- -','Color','r');
legend('统计量','控制限');