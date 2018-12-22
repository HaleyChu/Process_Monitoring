function varargout = monitoring_GUI(varargin)
% MONITORING_GUI MATLAB code for monitoring_GUI.fig
%      MONITORING_GUI, by itself, creates a new MONITORING_GUI or raises the existing
%      singleton*.
%
%      H = MONITORING_GUI returns the handle to a new MONITORING_GUI or the handle to
%      the existing singleton*.
%
%      MONITORING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MONITORING_GUI.M with the given input arguments.
%
%      MONITORING_GUI('Property','Value',...) creates a new MONITORING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before monitoring_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to monitoring_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help monitoring_GUI

% Last Modified by GUIDE v2.5 15-Mar-2018 10:12:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @monitoring_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @monitoring_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before monitoring_GUI is made visible.
function monitoring_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to monitoring_GUI (see VARARGIN)

% Choose default command line output for monitoring_GUI
handles.output = hObject;
% addpath(genpath('F:\Matlab\GUI code\detection'));
% addpath(genpath('F:\Matlab\GUI code\nomal_modle_library'));
% addpath(genpath('F:\Matlab\GUI code\data_library'));

%************************************************************************  
%发送数据端的参数设置  
% ipMAT='127.0.0.1'; %本地数据端的ip和端口号，本地的  
% portMAT=20000;   
% ipVS='127.0.0.1'; %接收数据端的ip和端口号，远端的  
% portVS=30000;  
% set(handles.localIP,'string',num2str(ipMAT));  
% set(handles.remoteIP,'string',num2str(ipVS));  
% set(handles.remotePort,'string',num2str(portVS));  
% set(handles.localPort,'string',num2str(portMAT));  
% set(handles.receive_edit1,'string',' ');  
% global count num1 abnorm;  
% handles.udpTransmit=udp(ipVS,portVS,'LocalPort',portMAT);%MAT发送给VS  
% fopen(handles.udpTransmit);%打开udp  
% handles.udpTransmit.ReadAsyncMode = 'continuous';%异步通信时，连续读串口数据  
% set(handles.udpTransmit,'DatagramTerminateMode','on');  
% handles.udpTransmit.DatagramReceivedFcn={@updateUDP,handles};  
% guidata(hObject, handles); 
%************************************************************************



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes monitoring_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = monitoring_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes when uipanel10 is resized.
function uipanel10_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile(...
{'*.mat;*.xlsx',...
'MATLAB Files(*.mat;*.xlsx)';
'*.mat','MAT-files(*.mat)';...
'*.xlsx','Models(*.xlsx)';...
'*.*','All Files(*.*)'},...
'select a file');
L = length(FileName);
Filetype=FileName(1,L-2:L);
switch Filetype
    case 'lsx'
        str=[PathName FileName];
        set(handles.edit2,'string',FileName);
        handles.GUI_X_normal=xlsread(str);
        
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit2,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        handles.GUI_X_normal=ref.(vars{1});
        guidata(hObject,handles);
        otherwise
        errordlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile(...
{'*.mat;*.xlsx',...
'MATLAB Files(*.mat;*.xlsx)';
'*.mat','MAT-files(*.mat)';...
'*.xlsx','Models(*.xlsx)';...
'*.*','All Files(*.*)'},...
'select a file');
L = length(FileName);
Filetype=FileName(1,L-2:L);
switch Filetype
    case 'lsx'
        str=[PathName FileName];
        set(handles.edit4,'string',FileName);
        handles.GUI_Y_normal=xlsread(str);
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit4,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        handles.GUI_Y_normal=ref.(vars{1});
        guidata(hObject,handles);
        otherwise
        errordlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile(...
{'*.mat;*.xlsx',...
'MATLAB Files(*.mat;*.xlsx)';
'*.mat','MAT-files(*.mat)';...
'*.xlsx','Models(*.xlsx)';...
'*.*','All Files(*.*)'},...
'select a file');
L = length(FileName);
Filetype=FileName(1,L-2:L);
switch Filetype
    case 'lsx'
        str=[PathName FileName];
        set(handles.edit3,'string',FileName);
        Monitoring_GUI_X_test=xlsread(str);
        handles.Monitoring_GUI_X_test=Monitoring_GUI_X_test;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit3,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_X_test=ref.(vars{1});
        handles.Monitoring_GUI_X_test=Monitoring_GUI_X_test;
        guidata(hObject,handles);
        otherwise
        errordlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName]=uigetfile(...
{'*.mat;*.xlsx',...
'MATLAB Files(*.mat;*.xlsx)';
'*.mat','MAT-files(*.mat)';...
'*.xlsx','Models(*.xlsx)';...
'*.*','All Files(*.*)'},...
'select a file');
L = length(FileName);
Filetype=FileName(1,L-2:L);
switch Filetype
    case 'lsx'
        str=[PathName FileName];
        set(handles.edit5,'string',FileName);
        Monitoring_GUI_Y_test=xlsread(str);
        handles.Monitoring_GUI_Y_test=Monitoring_GUI_Y_test;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit5,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_Y_test=ref.(vars{1});
        handles.Monitoring_GUI_Y_test=Monitoring_GUI_Y_test;
        guidata(hObject,handles);
        otherwise
        errordlg('Wrong File');
%         return
%%%%%%%%%%%%测试程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% axes(handles.axes2);
% t=100;
% x=rand(t,1);
% hist(x,50);
% title('直方图');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3



% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Process_monitoring_Toolbox;
clc,clear,close monitoring_GUI


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% fwrite(handles.tcpipClient,8,'double');
save_T2=0;
save_SPE=0;
axes(handles.axes1);
cla reset
xlabel('Samples');
ylabel('T^2 Statistics');
line([0,1000],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);hold on
axes(handles.axes2);
t=0;cla reset
xlabel('Samples');
ylabel('SPE Statistics');
line([0,1000],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);hold on
staticMethod_value_1=get(handles.popupmenu1,'Value');
staticMethod_value_2=get(handles.popupmenu2,'Value');
staticMethod_value_3=get(handles.popupmenu3,'Value');
c=10000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch staticMethod_value_1
    case 2
        while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
%                 fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:handles.Size);
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [nx,T2,SPE]=PCA_detection(x,y,handles.P,handles.LATENT,handles.A);
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
%                     fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
        end
    case 3
  
        while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:handles.Size);
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [ nx,T2,SPE ] = PLS_detection( x,y,handles.t,handles.p,handles.r,handles.nX );
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
        end

    case 4
%         data_test=xlsread('pkx102.xlsx');
%         A=data_test(:,1:20)';
%         B=data_test(:,21)';
%         [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,A(:,1:2400),B(:,1:2400) );
%         [ nx,T2,SPE ] = CCA_detection( x,y,handles.Js,handles.Ls,handles.Ms,handles.S );
%         
%         axes(handles.axes1);plot(T2,'b -');
%         axes(handles.axes2);plot(SPE,'b -');
         while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:handles.Size);
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [ nx,T2,SPE ] = CCA_detection( x,y,handles.Js,handles.Ls,handles.Ms,handles.S );
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
        end
        
    case 5
%         A=evalin('base','Z_obs_online1');
%         B=evalin('base','Z_obs_online2');
%         [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,A(:,1:331),B(:,1:331) );
%         [nx,T2,SPE]=ICA_detection( x,y,handles.W,handles.G );
%         axes(handles.axes1);plot(T2,'b -');
%         axes(handles.axes2);plot(SPE,'b -');
        
         while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:handles.Size);
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [nx,T2,SPE]=ICA_detection( x,y,handles.W,handles.G );
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
         end
end
switch staticMethod_value_2
    case 2
        while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:handles.Size);
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [nx,T2,SPE]=DPCA_detection(x,y,handles.P,handles.T,handles.LATENT,handles.A);
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
         end
    case 3
%         data_test=xlsread('pkx102.xlsx');
%         A=data_test(:,1:20)';
%         B=data_test(:,21)';
%         [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,A(:,1:4400),B(:,1:4400) );
%         [ nx,T2,SPE ] = DPLS_detection( x,y,handles.t,handles.p,handles.r );
%         
%         axes(handles.axes1);plot(T2,'b -');
%         axes(handles.axes2);plot(SPE,'b -');
        while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:handles.Size);
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [ nx,T2,SPE ] = DPLS_detection( x,y,handles.t,handles.p,handles.r );
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
         end
    case 4
        while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:size(rawData));
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [ nx,T2,SPE ] = DCCA_detection( x,y,handles.Ls,handles.S,handles.Md );
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
        end
        
end

switch staticMethod_value_3
    case 2
        while 1
            rawData = fread(handles.tcpipClient,handles.Size,'double');
            t=t+1;
            flag=sum(rawData);
            if flag==0
                fwrite(handles.tcpipClient,0,'double');
                fclose(handles.tcpipClient);
                break
            else
                online_x=rawData(1:handles.Size_X);
                online_y=rawData(1+handles.Size_X:size(rawData));
                [x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,online_x,online_y );
                [nx,T2,SPE]=KPCA_detection(x,handles.Monitoring_GUI_X_normal,handles.P,handles.A,handles.B,handles.lamda,c);
                if nx==0
                    msgbox('Please choose a method!');
                else
                    line(handles.axes1,[t-1,t],[save_T2,T2],'LineStyle','-','Color','b','linewidth',2);
                    line(handles.axes2,[t-1,t],[save_SPE,SPE],'LineStyle','-','Color','b','linewidth',2);
                    if t>10
                        line(handles.axes1,[t,1+t],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
                        line(handles.axes2,[t,1+t],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
                    end
                    drawnow;
                    fwrite(handles.tcpipClient,1,'double');
                    save_T2=T2;
                    save_SPE=SPE;
                end
            end
        end
end
guidata(hObject,handles);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     if handles.nx==0
    %         msgbox('Please choose a method!');
    %     else
    
    %     cla reset
    %     t=1:handles.nx;
    %     plot(t,handles.T2,'b -');
    %     xlabel('Samples');
    %     ylabel('T^2 Statistics');
    %     line([0,handles.nx],[handles.Jth_T2,handles.Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
    %     legend('Statistics','Threshold');
    %         plot(t,handles.T2,'b.','MarkerSize',6);
    %         drawnow;
    %     for i=1:handles.nx
    %         hold on
    %         plot(i,handles.T2(i),'b *');
    %         pause(0.01);
    %     end
    %         axes(handles.axes2);
    %     cla reset
    %     plot(t,handles.SPE,'b -');
    %     xlabel('Samples');
    %     ylabel('Q Statistics');
    %     hold on
    %     line([0,handles.nx],[handles.Jth_SPE,handles.Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
    %     legend('Statistics','Threshold');
    %         plot(t,handles.SPE,'b.','MarkerSize',6);
    %         drawnow;
    %     end


%%%%%%%%%%%%%测试程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% axes(handles.axes2);
% t=100;
% x=rand(t,1);
% hist(x,50);
% title('直方图');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Monitoring_GUI_X_normal=[];
handles.Monitoring_GUI_Y_normal=[];

handles.Monitoring_GUI_X_normal=handles.GUI_X_normal(:,1:20)';
handles.Monitoring_GUI_Y_normal=handles.GUI_Y_normal(:,21)';
guidata(hObject,handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Monitoring_GUI_X_normal=[];
handles.Monitoring_GUI_Y_normal=[];
guidata(hObject,handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
handles.Jth_T2=0;
handles.Jth_SPE=0;
c=10000;
staticMethod_value_1=get(handles.popupmenu1,'Value');
staticMethod_value_2=get(handles.popupmenu2,'Value');
staticMethod_value_3=get(handles.popupmenu3,'Value');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch staticMethod_value_1
    case 2
        [handles.P,handles.T, handles.LATENT,handles.A,handles.Jth_T2,handles.Jth_SPE]=PCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
       
    case 3
        [handles.t,handles.p,handles.r,handles.nX,handles.Jth_T2,handles.Jth_SPE]=PLS_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
       
    case 4
        
        [handles.Js,handles.Ls,handles.Ms,handles.S,handles.Jth_T2,handles.Jth_SPE]=CCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
       
    case 5
        [handles.W,handles.G,handles.Jth_T2,handles.Jth_SPE]=ICA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
end

switch staticMethod_value_2
    case 2
        [handles.P,handles.T, handles.LATENT,handles.A,handles.Jth_T2,handles.Jth_SPE]=DPCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
    case 3
        [handles.t,handles.p,handles.r,handles.Jth_T2,handles.Jth_SPE]=DPLS_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
    case 4
        [handles.Ls,handles.S,handles.Md,handles.Jth_T2,handles.Jth_SPE]=DCCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
end

switch staticMethod_value_3
    case 2
        [handles.P,handles.A,handles.B,handles.lamda,handles.Jth_T2,handles.Jth_SPE]=KPCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,c);
    case 3
        [handles.U,handles.T,handles.Jth_T2,handles.Jth_SPE]=KPLS_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,c);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (handles.Jth_T2==0)&&(handles.Jth_SPE==0)
    msgbox('Please choose a method!');
else
end
guidata(hObject,handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Size_X=str2double(get(handles.edit11,'String'));
Size_Y=str2double(get(handles.edit12,'String'));
handles.Size=prod(Size_X+Size_Y,1);
handles.Size_X=Size_X;handles.Size_Y=Size_Y;
portA=str2double(get(handles.edit14,'String')); 
ipA=get(handles.edit13,'String'); 
handles.tcpipClient = tcpip(ipA,portA,'NetworkRole','Client');
set(handles.tcpipClient,'InputBufferSize',7688);
fopen(handles.tcpipClient);
answer2 = fread(handles.tcpipClient,1,'double');
if answer2==8
    fwrite(handles.tcpipClient,8,'double');
    msgbox('It was connected!');
else
    msgbox('It was unconnected!');
end
guidata(hObject,handles);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fclose(handles.tcpipClient);
guidata(hObject,handles);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
