function varargout = Study_GUI_test(varargin)
% STUDY_GUI_TEST MATLAB code for Study_GUI_test.fig
%      STUDY_GUI_TEST, by itself, creates a new STUDY_GUI_TEST or raises the existing
%      singleton*.
%
%      H = STUDY_GUI_TEST returns the handle to a new STUDY_GUI_TEST or the handle to
%      the existing singleton*.
%
%      STUDY_GUI_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STUDY_GUI_TEST.M with the given input arguments.
%
%      STUDY_GUI_TEST('Property','Value',...) creates a new STUDY_GUI_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Study_GUI_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Study_GUI_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Study_GUI_test

% Last Modified by GUIDE v2.5 16-Oct-2018 15:16:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Study_GUI_test_OpeningFcn, ...
                   'gui_OutputFcn',  @Study_GUI_test_OutputFcn, ...
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


% --- Executes just before Study_GUI_test is made visible.
function Study_GUI_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Study_GUI_test (see GUIDATA)
% varargin   command line arguments to Study_GUI_test (see VARARGIN)

% Choose default command line output for Study_GUI_test
global Jth_T2
global Jth_SPE
global nx
global T2
global SPE
handles.output = hObject;
axes(handles.axes1);
cla reset 
% t=1:nx;
plot(T2,'b -');hold on
xlabel('Samples');
ylabel('T^2 Statistics');
hold on %²»¸²¸ÇÔ­Í¼
line([0,nx],[Jth_T2,Jth_T2],'LineStyle','- -','Color','r','linewidth',2);
legend('Statistics','Threshold');
axes(handles.axes2);
cla reset 
plot(SPE,'b -');
xlabel('Samples');
ylabel('Q Statistics');
hold on
line([0,nx],[Jth_SPE,Jth_SPE],'LineStyle','- -','Color','r','linewidth',2);
legend('Statistics','Threshold');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Study_GUI_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Study_GUI_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Study_GUI_test (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Study_GUI_test (see GUIDATA)

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user Study_GUI_test (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
