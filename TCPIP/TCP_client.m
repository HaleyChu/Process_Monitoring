function varargout = TCP_client(varargin)
% TCP_CLIENT MATLAB code for TCP_client.fig
%      TCP_CLIENT, by itself, creates a new TCP_CLIENT or raises the existing
%      singleton*.
%
%      H = TCP_CLIENT returns the handle to a new TCP_CLIENT or the handle to
%      the existing singleton*.
%
%      TCP_CLIENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TCP_CLIENT.M with the given input arguments.
%
%      TCP_CLIENT('Property','Value',...) creates a new TCP_CLIENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TCP_client_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TCP_client_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TCP_client

% Last Modified by GUIDE v2.5 15-Jan-2018 16:10:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TCP_client_OpeningFcn, ...
                   'gui_OutputFcn',  @TCP_client_OutputFcn, ...
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


% --- Executes just before TCP_client is made visible.
function TCP_client_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TCP_client (see VARARGIN)

% Choose default command line output for TCP_client
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TCP_client wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TCP_client_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)value
Size_X=str2double(get(handles.edit1,'String'));
Size_Y=str2double(get(handles.edit2,'String'));
handles.Size=prod(Size_X+Size_Y,1);
% set(handles.edit3,'String',handles.Size)
portA=9091; 
ipA='192.168.1.105'; 
portB=9091;
ipB='192.168.1.103';
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes1);
cla reset
line([0,100],[40,40],'LineStyle','- -','Color','r','linewidth',2);hold on
axes(handles.axes2);t=0;
cla reset
line([0,100],[20,20],'LineStyle','- -','Color','r','linewidth',2);hold on
while 1
    rawData = fread(handles.tcpipClient,handles.Size,'double');
    t=t+1;
    y=sum(rawData);
    if y==0
        fwrite(handles.tcpipClient,0,'double');
        fclose(handles.tcpipClient);
        break
    else
        [x,y] = data_standardization( handles.X,handles.X,rawData,rawData );
        [nx,T2,SPE]=PCA_detection(x,y,handles.P,handles.latent,handles.A);
%         axes(handles.axes1);
        plot(handles.axes1,t,T2,'b.','MarkerSize',6);
%         drawnow;
%         axes(handles.axes2);
        plot(handles.axes2,t,SPE,'b.','MarkerSize',6);
        drawnow;
        fwrite(handles.tcpipClient,1,'double');
    end
end
guidata(hObject,handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X_ =xlsread('Z_obs_mode1_X _1-40');
X = transpose(X_);
X_mean = mean(X);  %按列求平均值
X_std = std(X);        %标准差
[n,m]=size(X);
X = (X - repmat(X_mean,n,1))./repmat(X_std,n,1);
[handles.P,handles.T,handles.latent] = pca(X); 
per=0.85; %累计方差贡献率要保证85%
A=0;  %A为主元个数
for i=1:m
     cpv(i)=sum(handles.latent(1:i))/sum(handles.latent); %前A个主元的累计贡献率公式
    if cpv(i)>=per
       A=i
       break
    end
end
handles.A=A;
handles.X=X_;
guidata(hObject,handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
