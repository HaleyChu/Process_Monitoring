function varargout = Process_monitoring_Toolbox(varargin)
% PROCESS_MONITORING_TOOLBOX MATLAB code for Process_monitoring_Toolbox.fig
%      PROCESS_MONITORING_TOOLBOX, by itself, creates a new PROCESS_MONITORING_TOOLBOX or raises the existing
%      singleton*.
%
%      H = PROCESS_MONITORING_TOOLBOX returns the handle to a new PROCESS_MONITORING_TOOLBOX or the handle to
%      the existing singleton*.
%
%      PROCESS_MONITORING_TOOLBOX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROCESS_MONITORING_TOOLBOX.M with the given input arguments.
%
%      PROCESS_MONITORING_TOOLBOX('Property','Value',...) creates a new PROCESS_MONITORING_TOOLBOX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Process_monitoring_Toolbox_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Process_monitoring_Toolbox_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Process_monitoring_Toolbox

% Last Modified by GUIDE v2.5 24-Oct-2017 16:53:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Process_monitoring_Toolbox_OpeningFcn, ...
                   'gui_OutputFcn',  @Process_monitoring_Toolbox_OutputFcn, ...
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


% --- Executes just before Process_monitoring_Toolbox is made visible.
function Process_monitoring_Toolbox_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Process_monitoring_Toolbox (see VARARGIN)

% Choose default command line output for Process_monitoring_Toolbox
handles.output = hObject;
% 
% addpath(genpath('F:\Matlab\GUI code\data_library'))
% addpath(genpath('F:\Matlab\GUI code\detection'))
% addpath(genpath('F:\Matlab\GUI code\Interface_code'))
% addpath(genpath('F:\Matlab\GUI code\nomal_modle_library'))
% addpath(genpath('F:\Matlab\GUI code\study_word'))
% addpath(genpath('F:\Matlab\GUI code\Users'))
% addpath(genpath('F:\Matlab\GUI code\Ä£ÐÍº¯Êý'))
% addpath(genpath('F:\Matlab\GUI code\Cdata'))

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Process_monitoring_Toolbox wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Process_monitoring_Toolbox_OutputFcn(hObject, eventdata, handles) 
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
monitoring_GUI;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Evaluation_GUI;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Study_GUI;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc,clear,close all
