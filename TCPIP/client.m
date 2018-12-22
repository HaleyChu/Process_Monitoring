portA=9091; 
ipA='192.168.1.105'; 
portB=9091;
ipB='192.168.1.103';
tcpipClient = tcpip(ipA,portA,'NetworkRole','Client');
% set(tcpipClient,'InputBufferSize',7688);
% set(tcpipClient,'Timeout',100);
fopen(tcpipClient);
answer2 = fread(tcpipClient,1,'double');
if answer2==8
%     fwrite(tcpipClient,8,'double');
    sprintf('It was connected!')
else
    sprintf('It was unconnected!')
end
% answer2 = fread(tcpipClient,1,'double');
% if answer2==8
% %     x=0;figure;plot(x,0);hold on
% % while 1
% %     rawData = fread(tcpipClient,40,'double');
% %     x=x+1;
% %     y=sum(rawData);
% %     if y==0
% %         fwrite(tcpipClient,0,'double');
% %         fclose(tcpipClient);
% %         aa=11;
% %         break
% %      else
% %         plot(x,y,'r.','MarkerSize',6);
% %         drawnow;
% %         fwrite(tcpipClient,1,'double');
% %     end
% % end
% else
%     sprintf('It was unconnected!')
% end