function varargout = FAR_Result(varargin)
% FAR_RESULT MATLAB code for FAR_Result.fig
%      FAR_RESULT, by itself, creates a new FAR_RESULT or raises the existing
%      singleton*.
%
%      H = FAR_RESULT returns the handle to a new FAR_RESULT or the handle to
%      the existing singleton*.
%
%      FAR_RESULT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAR_RESULT.M with the given input arguments.
%
%      FAR_RESULT('Property','Value',...) creates a new FAR_RESULT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FAR_Result_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FAR_Result_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FAR_Result

% Last Modified by GUIDE v2.5 24-Nov-2017 17:04:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FAR_Result_OpeningFcn, ...
                   'gui_OutputFcn',  @FAR_Result_OutputFcn, ...
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


% --- Executes just before FAR_Result is made visible.
function FAR_Result_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FAR_Result (see VARARGIN)

% Choose default command line output for FAR_Result
handles.output = hObject;



global false_alarm_rate
global all_Evaluation
axes(handles.axes1);
% t=1:length(false_alarm_rate);
bar(false_alarm_rate,0.5);
set(gca, 'Ylim',[0 1]);
set(gca, 'XTickLabel', {all_Evaluation}) ;
set(gca, 'XTickLabelRotation',45);
for i = 1:length(false_alarm_rate)
    text(i,0.05+false_alarm_rate(i),strcat(num2str(false_alarm_rate(i)*100,'%.2f'),'%'),'VerticalAlignment','middle','HorizontalAlignment','center');
end
xlabel('Methods');
ylabel('False Alarm Rate');


% Update handles structure
guidata(hObject, handles);


% UIWAIT makes FAR_Result wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FAR_Result_OutputFcn(hObject, eventdata, handles) 
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
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
if FileName==0  
    return;  
else  
    h=getframe(handles.axes1);  
    imwrite(h.cdata,[PathName,FileName]);  
end;  
