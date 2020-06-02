function varargout = test3(varargin)
% TEST3 MATLAB code for test3.fig
%      TEST3, by itself, creates a new TEST3 or raises the existing
%      singleton*.
%
%      H = TEST3 returns the handle to a new TEST3 or the handle to
%      the existing singleton*.
%
%      TEST3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST3.M with the given input arguments.
%
%      TEST3('Property','Value',...) creates a new TEST3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test3

% Last Modified by GUIDE v2.5 30-May-2020 14:50:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test3_OpeningFcn, ...
                   'gui_OutputFcn',  @test3_OutputFcn, ...
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


% --- Executes just before test3 is made visible.
function test3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test3 (see VARARGIN)

% Choose default command line output for test3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test3_OutputFcn(hObject, eventdata, handles) 
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
t=imread('dod3.jpg');
test1 =rgb2gray( imread('dod3.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
k = mode(kaphatest1(:));
p = mode(pittatest1(:));
v = mode(vatatest1(:));
a=("Invalid Image");
c=("Valid Tongue Image");
if k>1.0e-06  || p>1.0e-06 ||v>1.0e-7
    axes(handles.axes1);
    set(handles.text6,'String',a);
else
    axes(handles.axes1);
    set(handles.text6,'String',c);
    imshow(t);
end;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test1 =rgb2gray( imread('dod3.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
k = mode(kaphatest1(:));
p = mode(pittatest1(:));
v = mode(vatatest1(:));
accuracy = ((1- (mean(kaphatest1+pittatest1+vatatest1))))*100;
b=("Not Valid");
if k>1.0e-06  || p>1.0e-06 ||v>1.0e-7
    set(handles.text2,'String',b);
else
    set(handles.text2,'String',accuracy);
end;
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test1 =rgb2gray( imread('dod3.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
k = mode(kaphatest1(:));
p = mode(pittatest1(:));
v = mode(vatatest1(:));
b=("Not Valid");
if k>1.0e-06  || p>1.0e-06 ||v>1.0e-7
    set(handles.text3,'String',b);
else
    set(handles.text3,'String',k);
end;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test1 =rgb2gray( imread('dod3.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
k = mode(kaphatest1(:));
p = mode(pittatest1(:));
v = mode(vatatest1(:));
b=("Not Valid");
if k>1.0e-06  || p>1.0e-06 ||v>1.0e-7
    set(handles.text4,'String',b);
else
    set(handles.text4,'String',p);
end;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test1 =rgb2gray( imread('dod3.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
k = mode(kaphatest1(:));
p = mode(pittatest1(:));
v = mode(vatatest1(:));
b=("Not Valid");
if k>1.0e-06  || p>1.0e-06 ||v>1.0e-7
    set(handles.text5,'String',b);
else
    set(handles.text5,'String',v);
end;

% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test1 =rgb2gray( imread('dod3.jpg'));
kapha1 = rgb2gray(imread('kapha1.jpg'));
pitta1 = rgb2gray(imread('pitta1.jpg'));
vata1 = rgb2gray(imread('vata1.jpg'));
lbptest1 = extractLBPFeatures(test1, 'Interpolation', 'linear');
lbpkapha1 = extractLBPFeatures(kapha1, 'Interpolation', 'linear');
lbppitta1 = extractLBPFeatures(pitta1, 'Interpolation', 'linear');
lbpvata1 = extractLBPFeatures(vata1, 'Interpolation', 'linear');
kaphatest1 = (lbpkapha1 - lbptest1).^2;
pittatest1 = (lbppitta1 - lbptest1).^2;
vatatest1 = (lbpvata1 - lbptest1).^2;
k = mode(kaphatest1(:));
p = mode(pittatest1(:));
v = mode(vatatest1(:));
i = max(k,p);
j = max(p,v);
f = max(i,j);
b=("Not Valid");
if k>1.0e-06  || p>1.0e-06 ||v>1.0e-7
    set(handles.text7,'String',b);
else
    set(handles.text7,'String',f);
end;
