function varargout = gui2(varargin)
% GUI2 M-file for gui2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui2

% Last Modified by GUIDE v2.5 24-Jul-2006 19:10:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui2_OutputFcn, ...
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


% --- Executes just before gui2 is made visible.
function gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui2 (see VARARGIN)

% Choose default command line output for gui2
str1=strcat(eval('cd'),'\55.bmp');
set(handles.edit1,'HorizontalAlignment','left','String',str1);
str1=strcat(eval('cd'),'\seg_55.bmp');
set(handles.edit2,'HorizontalAlignment','left','string',str1);
set(handles.pushbutton2,'Enable','on');
set(handles.pushbutton3,'Enable','off');
set(handles.edit2,'Enable','off');
set(handles.slider1,'Enable','off');
set(handles.pushbutton4,'Enable','off');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
h=get(hObject,'Value');
th=[h-0.23 h+0.23];
str=get(handles.edit1,'String');
b=skin_segment(str,th);
set(handles.pushbutton4,'UserData',b,'Enable','on');


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
set(handles.edit2,'HorizontalAlignment','left');
set(handles.pushbutton4,'Enable','on');

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename2 pathname2]=uiputfile('','Save segmented image As');
if(filename2~=0)
str2=strcat(pathname2,filename2);
set(handles.edit2,'String',str2,'Enable',on');
set(handles.pushbutton4,'Enable','on');
end




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
set(handles.edit1,'HorizontalAlignment','left');

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
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile('*.jpg','Open Image File');
if(filename~=0)
set(handles.edit1,'String',strcat(pathname,filename));
str3=strcat(pathname,'seg_',filename);
set(handles.edit2,'String',str3);
%set(handles.pushbutton2,'Enable','on');
end
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.edit1,'String');
%set(handles.pushbutton2,'Enable','off');
b=skin_segment(str);
set(handles.pushbutton4,'UserData',b);
set(handles.edit2,'Enable','off');
set(handles.pushbutton3,'Enable','on');
set(handles.slider1,'Enable','on');
set(handles.pushbutton4,'Enable','on');
guidata(hObject, handles);


function s_c=skin_segment(filename,th)
%clear all;
%str= input('Enter the image file with extension ' , 's' );
%str='JapaneseGirl';
%str='AFReuropean.jpg';
%str='SwimmingChild.jpg';
%str='55.bmp';
%str='2.jpg';
str=filename;
if(nargin<2)
    th=[.9788 1.1357];
end
a=imread(str);
[Height Width z]=size(a);
a=double(a);
s_c=255*ones(Height,Width,3);

for i=1:Height
    for j=1:Width
        s=double(0);
        s=sum(a(i,j,:));
        if(s~=0)
            rc=a(i,j,1)/s;
            gc=a(i,j,2)/s;
            bc=a(i,j,3)/s;
            if((rc>(0.35*min(th)))&(rc<(0.5*max(th)))&(bc>(0.2*min(th)))&(bc<(0.7*max(th)))&(s>(200*max(th))))
                s_c(i,j,1)=rc*s;
                s_c(i,j,2)=gc*s;
                s_c(i,j,3)=bc*s;
            end
        end
    end
end

figure;
subplot(1,2,1);imshow(uint8(a));title('Original Image');
subplot(1,2,2);imshow(uint8(s_c));title('Skin Segmented Image');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

c=get(handles.pushbutton4,'UserData');
%figure;
%imshow(c);
filename=get(handles.edit2,'String');
imwrite(c,filename);
set(handles.pushbutton4,'Enable','off');

