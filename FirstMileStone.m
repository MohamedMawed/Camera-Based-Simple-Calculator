function varargout = FirstMileStone(varargin)
% FIRSTMILESTONE MATLAB code for FirstMileStone.fig
%      FIRSTMILESTONE, by itself, creates a new FIRSTMILESTONE or raises the existing
%      singleton*.
%
%      H = FIRSTMILESTONE returns the handle to a new FIRSTMILESTONE or the handle to
%      the existing singleton*.
%
%      FIRSTMILESTONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTMILESTONE.M with the given input arguments.
%
%      FIRSTMILESTONE('Property','Value',...) creates a new FIRSTMILESTONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FirstMileStone_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FirstMileStone_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FirstMileStone

% Last Modified by GUIDE v2.5 26-Dec-2017 10:25:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FirstMileStone_OpeningFcn, ...
                   'gui_OutputFcn',  @FirstMileStone_OutputFcn, ...
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


% --- Executes just before FirstMileStone is made visible.
function FirstMileStone_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FirstMileStone (see VARARGIN)

% Choose default command line output for FirstMileStone
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FirstMileStone wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FirstMileStone_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global img;
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg';'*.png';'*.bmp'},'Image 1 Selector')
img = imread(FileName);
axes1=img;
axes(handles.axes1);
image(axes1);
% Display the image
imshow(img);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global img;
h = waitbar(1/1000,'Segmantation Phase');
img = FindEquation(img);
waitbar(250/1000,h,'Segmentation Fininshed');
val = FindCharacters(img,h);
waitbar(500/1000,h,'recognition Fininshed');
delete(h);
set(handles.text2,'string',char(val));
