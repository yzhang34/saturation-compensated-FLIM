function varargout = saturation_compensated_FLIM(varargin)
% SATURATION_COMPENSATED_FLIM MATLAB code for saturation_compensated_FLIM.fig
%
%   Author: Yide Zhang
%   Email: yzhang34@nd.edu
%   Date: April 16, 2019
%   Copyright: University of Notre Dame, 2019

% Last Modified by GUIDE v2.5 16-Apr-2019 18:22:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @saturation_compensated_FLIM_OpeningFcn, ...
                   'gui_OutputFcn',  @saturation_compensated_FLIM_OutputFcn, ...
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


% --- Executes just before saturation_compensated_FLIM is made visible.
function saturation_compensated_FLIM_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to saturation_compensated_FLIM (see VARARGIN)

% Choose default command line output for saturation_compensated_FLIM
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes saturation_compensated_FLIM wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc

addpath('./functions')

set(hObject,'Toolbar','figure'); % let the toolbar be operable
plot_offline_K(handles)


% --- Outputs from this function are returned to the command line.
function varargout = saturation_compensated_FLIM_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Slider_K_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.Edit_K, 'String', num2str(get(handles.Slider_K, 'Value')));

plot_offline_K(handles)


% --- Executes during object creation, after setting all properties.
function Slider_K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on selection change in Popup_Data.
function Popup_Data_Callback(hObject, eventdata, handles)
% hObject    handle to Popup_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Popup_Data contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Popup_Data
plot_offline_K(handles)


% --- Executes during object creation, after setting all properties.
function Popup_Data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Popup_Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_K_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_K as text
%        str2double(get(hObject,'String')) returns contents of Edit_K as a double
set(handles.Slider_K, 'Value', str2double(get(handles.Edit_K, 'String')))

plot_offline_K(handles)


% --- Executes during object creation, after setting all properties.
function Edit_K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_K_max_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_K_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_K_max as text
%        str2double(get(hObject,'String')) returns contents of Edit_K_max as a double
plot_offline_K(handles)


% --- Executes during object creation, after setting all properties.
function Edit_K_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_K_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_K_min_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_K_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_K_min as text
%        str2double(get(hObject,'String')) returns contents of Edit_K_min as a double
plot_offline_K(handles)


% --- Executes during object creation, after setting all properties.
function Edit_K_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_K_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Checkbox_Exc.
function Checkbox_Exc_Callback(hObject, eventdata, handles)
% hObject    handle to Checkbox_Exc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Checkbox_Exc
plot_offline_K(handles)


% --- Executes on button press in Checkbox_Ref.
function Checkbox_Ref_Callback(hObject, eventdata, handles)
% hObject    handle to Checkbox_Ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Checkbox_Ref
plot_offline_K(handles)


% --- Executes on button press in Checkbox_Power.
function Checkbox_Power_Callback(hObject, eventdata, handles)
% hObject    handle to Checkbox_Power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Checkbox_Power
plot_offline_K(handles)
