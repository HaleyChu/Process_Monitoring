function varargout = Evaluation_GUI(varargin)
%EVALUATION_GUI MATLAB code file for Evaluation_GUI.fig
%      EVALUATION_GUI, by itself, creates a new EVALUATION_GUI or raises the existing
%      singleton*.
%
%      H = EVALUATION_GUI returns the handle to a new EVALUATION_GUI or the handle to
%      the existing singleton*.
%
%      EVALUATION_GUI('Property','Value',...) creates a new EVALUATION_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Evaluation_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      EVALUATION_GUI('CALLBACK') and EVALUATION_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in EVALUATION_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Evaluation_GUI

% Last Modified by GUIDE v2.5 08-Nov-2017 17:12:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
handles.cont=0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Evaluation_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Evaluation_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Evaluation_GUI is made visible.
function Evaluation_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Evaluation_GUI
handles.output = hObject;
% addpath(genpath('F:\Matlab\GUI code\data_library'))
% addpath(genpath('F:\Matlab\GUI code\detection'))
% addpath(genpath('F:\Matlab\GUI code\Interface_code'))
% addpath(genpath('F:\Matlab\GUI code\nomal_modle_library'))
% addpath(genpath('F:\Matlab\GUI code\study_word'))
% addpath(genpath('F:\Matlab\GUI code\Users'))
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Evaluation_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Evaluation_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global Method_entries
Method_entries=get(handles.listbox1,'String');
Method_Select_value=get(handles.listbox1,'Value');
str2=get(handles.listbox2,'string'); %获取列表中的所有数据
m=size(str2,1); 
str(1:m,:)=str2;
str(m+1,:)=Method_entries{Method_Select_value,:};
set(handles.listbox2,'value',m+1); 
set(handles.listbox2,'string',str);
guidata(hObject,handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%******************删除选中的方法完成
n=get(handles.listbox2,'value'); %获取选中的行号
str=get(handles.listbox2,'string'); %获取列表中的所有数据
m=size(str,1); 
k=0;

if(n~=m)
    for i=1:m
        k=k+1;
        if(i<n)
            str1(k,:)=str(i,:);
        else
            str1(k:m-1,:)=str(n+1:m,:);
            break
        end
    end
else
    str1(1:m-1,:)=str(1:m-1,:);
end
set(handles.listbox2,'value',m-1); 
set(handles.listbox2,'string',str1);
guidata(hObject,handles);


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global users_choose
% global users_path
% addpath(genpath('F:\Matlab\GUI code\Users'));
users_choose=get(handles.radiobutton8,'value');
if get(handles.radiobutton8,'value')
   [FileName,PathName]=uigetfile('*.m','Select a file') ;
%    users_path=PathName;
   set(handles.edit1,'string',FileName);
   open('user_function_introduction.txt');
% % % % % % % % % % % % % % % % %% addpath(genpath(PathName));要不要加这一句。。。。。
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%*************************所有方法都训练出正常模型
% handles.Evaluation_GUI_X_normal
% handles.Evaluation_GUI_Y_normal

global Threshold_display
global PCA_P PCA_T PCA_LATENT PCA_A
global PLS_t PLS_p PLS_r PLS_nX
global CCA_Js CCA_Ls CCA_Ms CCA_S
global ICA_W ICA_G
global DPCA_P DPCA_T DPCA_LATENT DPCA_A
global DPLS_t DPLS_p DPLS_r
global DCCA_Ls DCCA_S DCCA_Md
global KPCA_P KPCA_A KPCA_B KPCA_lamda
global KPLS_U KPLS_T
global Evaluation_GUI_X_normal
global Evaluation_GUI_Y_normal
global str_Evaluation
global c


% addpath(genpath('F:\Matlab\GUI code\nomal_modle_library'));
Threshold_display=[];
c=10000;
str_Evaluation=get(handles.listbox2,'String');
ascii_Library=[276 303 263 269 312 339 299 319 346];
method_num=size(str_Evaluation,1);
t1=clock; 
for i=1:method_num
    ascii_data(:)=abs(str_Evaluation(i,:));
    ascii_sum(i)=sum(ascii_data(:));
    switch ascii_sum(i)
        case 276
            [PCA_P, PCA_T,PCA_LATENT,PCA_A,Jth_T2,Jth_SPE]=PCA_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 303
            [PLS_t,PLS_p,PLS_r,PLS_nX,Jth_T2,Jth_SPE]=PLS_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 263
            [CCA_Js,CCA_Ls,CCA_Ms,CCA_S,Jth_T2,Jth_SPE]=CCA_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 269
            [ICA_W,ICA_G,Jth_T2,Jth_SPE]=ICA_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 312
            [DPCA_P,DPCA_T, DPCA_LATENT,DPCA_A,Jth_T2,Jth_SPE]=DPCA_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 339
            [DPLS_t,DPLS_p,DPLS_r,Jth_T2,Jth_SPE]=DPLS_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 299
            [DCCA_Ls,DCCA_S,DCCA_Md,Jth_T2,Jth_SPE]=DCCA_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal);
        case 319
            [KPCA_P,KPCA_A,KPCA_B,KPCA_lamda,Jth_T2,Jth_SPE]=KPCA_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal,c);
        case 346
            [KPLS_U,KPLS_T,Jth_T2,Jth_SPE]=KPLS_nomal(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal,c);
    end
    Threshold_display(i,:)=[Jth_T2,Jth_SPE];
end
t2=clock;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.axes1,'visible','on');
mywaitbar(0,'Please Wait...');
TheEndTime = etime(t2,t1); 
% TheEndTime = train_time;
for t = 1:TheEndTime
       mywaitbar(t/TheEndTime,[num2str(floor(t*100/TheEndTime)),'%']);
end
cla(handles.axes1);
set(gca,'visible','off');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
guidata(hObject,handles);

% --- Executes on button press in pushbutton4.




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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Evaluation_GUI_X_normal
global Evaluation_GUI_Y_normal
Evaluation_GUI_X_normal=handles.Monitoring_GUI_X_normal;
Evaluation_GUI_Y_normal=handles.Monitoring_GUI_Y_normal;

guidata(hObject,handles);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Evaluation_GUI_X_normal=[];
handles.Evaluation_GUI_Y_normal=[];
set(handles.edit3,'String','');
set(handles.edit5,'String','');
guidata(hObject,handles);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.radiobutton10,'Value',1);%FDR
% set(handles.radiobutton11,'Value',0);%FAR
% set(handles.radiobutton12,'Value',0);%DD
global detection_rate
global false_alarm_rate
global detection_delay
fault_occurred_num=160;
detection_num=0;
Threshold_display=handles.Threshold_display;
Statistic_display=handles.Statistic_display;
%%%指标为FDR
if get(handles.radiobutton10,'Value')
    for j=1:handles.n
        for i=fault_occurred_num:Statistic_display{j,1}(1)
            if Statistic_display{j,2}(i,1)>Threshold_display(j,1)
                detection_num=detection_num+1;
            else
                detection_num=detection_num;
            end
        end
        detection_rate(j)=detection_num/(Statistic_display{j,1}(1)-fault_occurred_num);
        detection_num=0;
    end
    set(handles.edit7,'String',detection_rate(1));
    set(handles.edit8,'String',detection_rate(2));
    FDR_Result;
end

% %%%指标为FAR
if get(handles.radiobutton11,'Value')
    for j=1:handles.n
        for i=1:fault_occurred_num
            if Statistic_display{j,2}(i,1)>Threshold_display(j,1)
                detection_num=detection_num+1;
            else
                detection_num=detection_num;
            end
        end
        false_alarm_rate(j)=detection_num/fault_occurred_num;
        detection_num=0;
    end
    set(handles.edit7,'String',false_alarm_rate(1));
    set(handles.edit8,'String',false_alarm_rate(2));
    FAR_Result;
end

% %%%指标为DD
if get(handles.radiobutton12,'Value')
    for j=1:handles.n
        for i=fault_occurred_num:Statistic_display{j,1}(1)
            if Statistic_display{j,2}(i,1)>Threshold_display(j,1)
                break
            end
        end
        detection_delay(j)=i-fault_occurred_num;   
    end
    set(handles.edit7,'String',detection_delay(1));
    set(handles.edit8,'String',detection_delay(2));
    DD_Result;
end

guidata(hObject,handles);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Process_monitoring_Toolbox;
close Evaluation_GUI;
close Evaluation_GUI_2;


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


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
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
        Monitoring_GUI_X_normal=xlsread(str);
        handles.Monitoring_GUI_X_normal=Monitoring_GUI_X_normal;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit3,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_X_normal=ref.(vars{1});
        handles.Monitoring_GUI_X_normal=Monitoring_GUI_X_normal;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% addpath(genpath('F:\Matlab\GUI code\data_library'))
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
        Monitoring_GUI_Y_normal=xlsread(str);
        handles.Monitoring_GUI_Y_normal=Monitoring_GUI_Y_normal;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit5,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_Y_normal=ref.(vars{1});
        handles.Monitoring_GUI_Y_normal=Monitoring_GUI_Y_normal;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% addpath(genpath('F:\Matlab\GUI code\data_library'))
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
        Monitoring_GUI_X_test=xlsread(str);
        handles.Monitoring_GUI_X_test=Monitoring_GUI_X_test;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit4,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_X_test=ref.(vars{1});
        handles.Monitoring_GUI_X_test=Monitoring_GUI_X_test;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% addpath(genpath('F:\Matlab\GUI code\data_library'))
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
        set(handles.edit6,'string',FileName);
        Monitoring_GUI_Y_test=xlsread(str);
        handles.Monitoring_GUI_Y_test=Monitoring_GUI_Y_test;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit6,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_Y_test=ref.(vars{1});
        handles.Monitoring_GUI_Y_test=Monitoring_GUI_Y_test;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
        return

end

% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
set(handles.radiobutton10,'Value',1);%FDR
set(handles.radiobutton11,'Value',0);%FAR
set(handles.radiobutton12,'Value',0);%DD


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11
set(handles.radiobutton10,'Value',0);%FDR
set(handles.radiobutton11,'Value',1);%FAR
set(handles.radiobutton12,'Value',0);%DD


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12
set(handles.radiobutton10,'Value',0);%FDR
set(handles.radiobutton11,'Value',0);%FAR
set(handles.radiobutton12,'Value',1);%DD



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
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

global users_choose
users_choose=get(handles.radiobutton8,'value');
Evaluation_GUI_2;
