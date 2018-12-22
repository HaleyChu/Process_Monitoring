member=[1 2 3 4 5 6 7 8 9];
ipA = '192.168.1.105'; 
portA = 9091;
ipB = '192.168.1.103';
portB = 9091;
s=whos('member');
tcpipServer1=tcpip(ipB,portB,'NetworkRole','Server');
set(tcpipServer,'OutputBufferSize',s.bytes);
fopen(tcpipServer);
answer1=fread(tcpipServer,1,'double');
if  answer1==8
    fwrite(tcpipServer,member(:),'double');
end
% fwrite(tcpipServer,member(:),'double');
% fclose(tcpipServer);
