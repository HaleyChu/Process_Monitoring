function varargout = Evaluation_GUI_2(varargin)
% EVALUATION_GUI_2 MATLAB code for Evaluation_GUI_2.fig
%      EVALUATION_GUI_2, by itself, creates a new EVALUATION_GUI_2 or raises the existing
%      singleton*.
%
%      H = EVALUATION_GUI_2 returns the handle to a new EVALUATION_GUI_2 or the handle to
%      the existing singleton*.
%
%      EVALUATION_GUI_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EVALUATION_GUI_2.M with the given input arguments.
%
%      EVALUATION_GUI_2('Property','Value',...) creates a new EVALUATION_GUI_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Evaluation_GUI_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Evaluation_GUI_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Evaluation_GUI_2

% Last Modified by GUIDE v2.5 16-Nov-2017 11:02:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Evaluation_GUI_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Evaluation_GUI_2_OutputFcn, ...
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


% --- Executes just before Evaluation_GUI_2 is made visible.
function Evaluation_GUI_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Evaluation_GUI_2 (see VARARGIN)

% Choose default command line output for Evaluation_GUI_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Evaluation_GUI_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Evaluation_GUI_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)%%%%%按键report
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global detection_rate
global false_alarm_rate
global detection_delay
global Threshold_display
global Statistic_display

fault_occurred=get(handles.edit5,'string');
fault_occurred_num=str2num(fault_occurred);
detection_num=0;
detection_delay=[];
detection_rate=[];
false_alarm_rate=[];
%%%指标为FDR
if get(handles.radiobutton1,'Value')
    for j=1:handles.n
        for i=fault_occurred_num:Statistic_display{j,1}(1,1)
            if (Statistic_display{j,2}(i,1)>Threshold_display(j,1))||(Statistic_display{j,3}(i,1)>Threshold_display(j,2))
                detection_num=detection_num+1;
            else
                detection_num=detection_num;
            end
        end
        detection_rate(j)=detection_num/(Statistic_display{j,1}(1)-fault_occurred_num+1);
        
        detection_num=0;
    end
%     set(handles.edit7,'String',detection_rate(1));
%     set(handles.edit8,'String',detection_rate(2));
    FDR_Result;
end
% %%%指标为FAR
if get(handles.radiobutton2,'Value')
    for j=1:handles.n
        for i=1:fault_occurred_num
            if (Statistic_display{j,2}(i,1)>Threshold_display(j,1))||(Statistic_display{j,3}(i,1)>Threshold_display(j,2))
                detection_num=detection_num+1;
            else
                detection_num=detection_num;
            end
        end
        false_alarm_rate(j)=detection_num/fault_occurred_num;
        detection_num=0;
    end
%     set(handles.edit7,'String',false_alarm_rate(1));
%     set(handles.edit8,'String',false_alarm_rate(2));
    FAR_Result;
end

% %%%指标为DD
if get(handles.radiobutton3,'Value')
    for j=1:handles.n
        for i=fault_occurred_num:Statistic_display{j,1}(1)
            if (Statistic_display{j,2}(i,1)>Threshold_display(j,1))||(Statistic_display{j,3}(i,1)>Threshold_display(j,2))
                break
            end
        end
        detection_delay(j)=i-fault_occurred_num;   
    end
%     set(handles.edit7,'String',detection_delay(1));
%     set(handles.edit8,'String',detection_delay(2));
    DD_Result;
end

guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Evaluation_GUI;
close Evaluation_GUI_2;


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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)%故障数据X
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
        set(handles.edit1,'string',FileName);
        Monitoring_GUI_X_test=xlsread(str);
        handles.Monitoring_GUI_X_test=Monitoring_GUI_X_test;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit1,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_X_test=ref.(vars{1});
        handles.Monitoring_GUI_X_test=Monitoring_GUI_X_test;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)%故障数据Y
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
        set(handles.edit2,'string',FileName);
        Monitoring_GUI_Y_test=xlsread(str);
        handles.Monitoring_GUI_Y_test=Monitoring_GUI_Y_test;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit2,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_Y_test=ref.(vars{1});
        handles.Monitoring_GUI_Y_test=Monitoring_GUI_Y_test;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
        return

end

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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Evaluation_GUI_X_test
global Evaluation_GUI_Y_test
Evaluation_GUI_X_test=handles.Monitoring_GUI_X_test;
Evaluation_GUI_Y_test=handles.Monitoring_GUI_Y_test;
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Evaluation_GUI_X_test=[];
handles.Evaluation_GUI_Y_test=[];
set(handles.edit5,'string','');
set(handles.edit1,'String','');
set(handles.edit2,'String','');
guidata(hObject,handles);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global str_Evaluation
global Threshold_display
global Statistic_display
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
global Evaluation_GUI_X_test
global Evaluation_GUI_Y_test
global users_choose
global all_Evaluation
global c
% addpath(genpath('F:\Matlab\GUI code\detection'));

[x,y] = data_standardization(Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal,Evaluation_GUI_X_test,Evaluation_GUI_Y_test);

method_num=size(str_Evaluation,1);
Statistic_display=cell(method_num,3);
ascii_Library=[276 303 263 269 312 339 299 319 346];
for i=1:method_num
    ascii_data(:)=abs(str_Evaluation(i,:));
    ascii_sum(i)=sum(ascii_data(:));
    switch ascii_sum(i)
        case 276
            [nx,T2,SPE]=PCA_detection(x,y,PCA_P,PCA_LATENT,PCA_A);
        case 303
            [nx,T2,SPE]=PLS_detection(x,y,PLS_t,PLS_p,PLS_r,PLS_nX);
        case 263
            [nx,T2,SPE] = CCA_detection( x,y,CCA_Js,CCA_Ls,CCA_Ms,CCA_S );
        case 269
            [nx,T2,SPE]=ICA_detection(x,y,ICA_W,ICA_G);
        case 312
            [nx,T2,SPE]=DPCA_detection(x,y,DPCA_P,DPCA_T, DPCA_LATENT,DPCA_A);
        case 339
            [ nx,T2,SPE ] = DPLS_detection( x,y,DPLS_t,DPLS_p,DPLS_r );
        case 299
            [ nx,T2,SPE ] = DCCA_detection( x,y,DCCA_Ls,DCCA_S,DCCA_Md );
        case 319
            [nx,T2,SPE]=KPCA_detection(x,Evaluation_GUI_X_normal,KPCA_P,KPCA_A,KPCA_B,KPCA_lamda,c);
        case 346
            [nx,T2,SPE]=KPLS_detection(x,y,Evaluation_GUI_X_normal,KPLS_U,KPLS_T,c);
    end
    Statistic_display(i,:)={nx,T2,SPE};
end


if users_choose
    [ users_Jth_T2,users_Jth_SPE,users_nx,users_T2,users_SPE ] = Users_function( Evaluation_GUI_X_normal,Evaluation_GUI_Y_normal,Evaluation_GUI_X_test,Evaluation_GUI_Y_test );
    Threshold_display(method_num+1,:)=[users_Jth_T2,users_Jth_SPE];
    Statistic_display(method_num+1,:)={users_nx,users_T2,users_SPE};
    all_Evaluation=str_Evaluation;
    all_Evaluation(method_num+1,:)=('Users');
else
    all_Evaluation=str_Evaluation;
end
handles.n=size(all_Evaluation,1);
guidata(hObject,handles);
