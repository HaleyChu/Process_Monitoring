function varargout = Study_GUI(varargin)
% STUDY_GUI MATLAB code for Study_GUI.fig
%      STUDY_GUI, by itself, creates a new STUDY_GUI or raises the existing
%      singleton*.
%
%      H = STUDY_GUI returns the handle to a new STUDY_GUI or the handle to
%      the existing singleton*.
%
%      STUDY_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STUDY_GUI.M with the given input arguments.
%
%      STUDY_GUI('Property','Value',...) creates a new STUDY_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Study_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Study_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Study_GUI

% Last Modified by GUIDE v2.5 26-Oct-2017 21:41:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Study_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Study_GUI_OutputFcn, ...
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


% --- Executes just before Study_GUI is made visible.
function Study_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Study_GUI (see VARARGIN)

% Choose default command line output for Study_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Study_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Study_GUI_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA)
Process_monitoring_Toolbox;
close Study_GUI;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
        set(handles.edit2,'string',FileName);
        Monitoring_GUI_X_normal=xlsread(str);
        handles.Monitoring_GUI_X_normal=Monitoring_GUI_X_normal;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit2,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_X_normal=ref.(vars{1});
        handles.Monitoring_GUI_X_normal=Monitoring_GUI_X_normal;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
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
        set(handles.edit4,'string',FileName);
        Monitoring_GUI_Y_normal=xlsread(str);
        handles.Monitoring_GUI_Y_normal=Monitoring_GUI_Y_normal;
        guidata(hObject,handles);
    case 'mat'
        str=[PathName FileName];
        set(handles.edit4,'string',FileName);
        ref=load(FileName);
        vars=fieldnames(ref);
        Monitoring_GUI_Y_normal=ref.(vars{1});
        handles.Monitoring_GUI_Y_normal=Monitoring_GUI_Y_normal;
        guidata(hObject,handles);
        otherwise
        errodlg('Wrong File');
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
        errodlg('Wrong File');
        return
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
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
        errodlg('Wrong File');
        return

end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Choose_Method_num
% addpath(genpath('F:\Matlab\GUI code\study_word'));
Choose_Method_num=get(handles.popupmenu2,'Value');
switch Choose_Method_num
    case 2
        open PCA.docx
    case 3
        open PLS.docx
    case 4
        open CCA.docx
    case 5
        open ICA.docx
    case 6
        open DPCA.docx
    case 7
        open DPLS.docx
    case 8
        open DCCA.docx
    case 9
        open KPCA.docx
    case 10
        open KPLS.docx
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Choose_Method_num
global Jth_T2
global Jth_SPE
global nx
global T2
global SPE
% % addpath(genpath('F:\Matlab\GUI code\detection'));
% % addpath(genpath('F:\Matlab\GUI code\nomal_modle_library'));
% % addpath(genpath('F:\Matlab\GUI code\data_library'));
Choose_Method_num=get(handles.popupmenu2,'Value');
c=10000;
[x,y] = data_standardization( handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,handles.Monitoring_GUI_X_test,handles.Monitoring_GUI_Y_test );
switch Choose_Method_num
    case 1
        errordlg('Please choose a method!')
    case 2
        [P,T, LATENT,A,Jth_T2,Jth_SPE]=PCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [nx,T2,SPE]=PCA_detection(x,y,P,LATENT,A);
        guidata(hObject,handles);
    case 3
        [t,p,r,nX,Jth_T2,Jth_SPE]=PLS_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [ nx,T2,SPE ] = PLS_detection( x,y,t,p,r,nX );
        guidata(hObject,handles);
    case 4
        [Js,Ls,Ms,S,Jth_T2,Jth_SPE]=CCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [ nx,T2,SPE ] = CCA_detection( x,y,Js,Ls,Ms,S );
        guidata(hObject,handles);
    case 5
        [W,G,Jth_T2,Jth_SPE]=ICA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [nx,T2,SPE]=ICA_detection(x,y,W,G);
        guidata(hObject,handles);
    case 6
        [P,T, LATENT,A,Jth_T2,Jth_SPE]=DPCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [nx,T2,SPE]=DPCA_detection(x,y,P,T, LATENT,A);
        guidata(hObject,handles);
    case 7
        [t,p,r,Jth_T2,Jth_SPE]=DPLS_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [nx,T2,SPE]=DPLS_detection( x,y,t,p,r );
        guidata(hObject,handles);
    case 8
        [Ls,S,Md,Jth_T2,Jth_SPE]=DCCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal);
        [ nx,T2,SPE ] = DCCA_detection( x,y,Ls,S,Md );
        guidata(hObject,handles);
    case 9
        [P,A,B,lamda,Jth_T2,Jth_SPE]=KPCA_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,c);
        [nx,T2,SPE]=KPCA_detection(x,handles.Monitoring_GUI_X_normal,P,A,B,lamda,c);
        guidata(hObject,handles);
    case 10
        [U,T,Jth_T2,Jth_SPE]=KPLS_nomal(handles.Monitoring_GUI_X_normal,handles.Monitoring_GUI_Y_normal,c);
        [nx,T2,SPE]=KPLS_detection(x,y,handles.Monitoring_GUI_X_normal,U,T,c);
        guidata(hObject,handles);
end
Study_GUI_test;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Choose_Method_num
% % addpath(genpath('F:\Matlab\GUI code\nomal_modle_library'))
Choose_Method_num=get(handles.popupmenu2,'Value');
switch Choose_Method_num
    case 1
        errordlg('Please choose a method!')
    case 2
        open PCA_code.docx
    case 3
        open PLS_code.docx
    case 4
        open CCA_code.docx
    case 5
        open ICA_code.docx
    case 6
        open DPCA_code.docx
    case 7
        open DPLS_code.docx
    case 8
        open DCCA_code.docx
    case 9
        open KPCA_code.docx
    case 10
        open KPLS_code.docx
end
