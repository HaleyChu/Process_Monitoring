function varargout = DD_Result(varargin)
% DD_RESULT MATLAB code for DD_Result.fig
%      DD_RESULT, by itself, creates a new DD_RESULT or raises the existing
%      singleton*.
%
%      H = DD_RESULT returns the handle to a new DD_RESULT or the handle to
%      the existing singleton*.
%
%      DD_RESULT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DD_RESULT.M with the given input arguments.
%
%      DD_RESULT('Property','Value',...) creates a new DD_RESULT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DD_Result_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DD_Result_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DD_Result

% Last Modified by GUIDE v2.5 24-Nov-2017 17:04:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DD_Result_OpeningFcn, ...
                   'gui_OutputFcn',  @DD_Result_OutputFcn, ...
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


% --- Executes just before DD_Result is made visible.
function DD_Result_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DD_Result (see VARARGIN)

% Choose default command line output for DD_Result
handles.output = hObject;



global detection_delay
global all_Evaluation


axes(handles.axes1);
cla reset 
t=1:length(detection_delay);
bar(t,detection_delay,0.5);
set(gca, 'XTickLabel', all_Evaluation) ;
set(gca, 'XTickLabelRotation',45);
for i = 1:length(detection_delay)
    text(i,1.4+detection_delay(i),num2str(detection_delay(i)),'VerticalAlignment','middle','HorizontalAlignment','center');
end
xlabel('Methods');
ylabel('Detection Delay');


% Update handles structure
guidata(hObject, handles);


% UIWAIT makes DD_Result wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DD_Result_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [filename1,pathname1] = uigetfile({'*.jpg','JPEG(*.jpg)';...
%     '*.bmp','Bitmap(*.bmp)';...
%     '*.gif','GIF(*.gif)';...
%     '*.*',  'All Files (*.*)'},...
%     'Save Picture','Untitled');
% if filename1==0
%     return;
% else
%     imname=fullfile(pathname1,filename1);
%     dat=imread(imname);
%     hf=figure(1);
%     imshow(dat);
%     axis on
%     hp=getframe(hf);
%     [filename2,pathname2] = uiputfile({'*.jpg','JPEG(*.jpg)';...
%         '*.bmp','Bitmap(*.bmp)';...
%         '*.gif','GIF(*.gif)';...
%         '*.*',  'All Files (*.*)'},...
%         'Save Picture','Untitled');
%     if filename2==0
%         return
%     else
%         imwrite(hp.cdata,fullfile(pathname2,filename2));
%         close(hf);
%     end
% end
