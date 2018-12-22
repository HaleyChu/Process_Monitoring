
function mywaitbar(x,varargin)
if nargin < 1
    error('Input arguments not valid');
end
set(0,'CurrentFigure',gcf);
fAxes = findobj(gcf,'type','axes');
set(gcf,'CurrentAxes',fAxes);
if nargin > 1
    hTitle = get(fAxes,'title');
    set(hTitle,'String',varargin{1});
end
fractioninput = x;
x = max(0,min(100*x,100));
if fractioninput == 0
    cla
    pause(0.1) % 暂停小会清除上次使用进度
    xpatch = [0 x x 0];
    ypatch = [0 0 1 1];
    xline = [100 0 0 100 100];
    yline = [0 0 1 1 0];
    patch(xpatch,ypatch,'b','EdgeColor','b','EraseMode','none');
    set(gcf,'UserData',fractioninput);
    l = line(xline,yline,'EraseMode','none');
    set(l,'Color',get(gca,'XColor'));
else
    p = findobj(gcf,'Type','patch');
    l = findobj(gcf,'Type','line');
    if (get(gcf,'UserData') > fractioninput)
        set(p,'EraseMode','normal');
    end
    xpatch = [0 x x 0];
    set(p,'XData',xpatch);
    xline = get(l,'XData');
    set(l,'XData',xline);
end
drawnow;
