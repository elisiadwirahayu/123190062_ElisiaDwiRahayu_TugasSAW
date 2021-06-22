function varargout = ElisiaDwiRahayu_123190062_TugasSAW(varargin)
% ELISIADWIRAHAYU_123190062_TUGASSAW MATLAB code for ElisiaDwiRahayu_123190062_TugasSAW.fig
%      ELISIADWIRAHAYU_123190062_TUGASSAW, by itself, creates a new ELISIADWIRAHAYU_123190062_TUGASSAW or raises the existing
%      singleton*.
%
%      H = ELISIADWIRAHAYU_123190062_TUGASSAW returns the handle to a new ELISIADWIRAHAYU_123190062_TUGASSAW or the handle to
%      the existing singleton*.
%
%      ELISIADWIRAHAYU_123190062_TUGASSAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELISIADWIRAHAYU_123190062_TUGASSAW.M with the given input arguments.
%
%      ELISIADWIRAHAYU_123190062_TUGASSAW('Property','Value',...) creates a new ELISIADWIRAHAYU_123190062_TUGASSAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ElisiaDwiRahayu_123190062_TugasSAW_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ElisiaDwiRahayu_123190062_TugasSAW_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ElisiaDwiRahayu_123190062_TugasSAW

% Last Modified by GUIDE v2.5 21-Jun-2021 21:27:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ElisiaDwiRahayu_123190062_TugasSAW_OpeningFcn, ...
                   'gui_OutputFcn',  @ElisiaDwiRahayu_123190062_TugasSAW_OutputFcn, ...
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


% --- Executes just before ElisiaDwiRahayu_123190062_TugasSAW is made visible.
function ElisiaDwiRahayu_123190062_TugasSAW_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ElisiaDwiRahayu_123190062_TugasSAW (see VARARGIN)

% Choose default command line output for ElisiaDwiRahayu_123190062_TugasSAW
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ElisiaDwiRahayu_123190062_TugasSAW wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ElisiaDwiRahayu_123190062_TugasSAW_OutputFcn(hObject, eventdata, handles) 
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
range = detectImportOptions('data_alternatif.csv');
range.SelectedVariableNames = (2:6);
data = readtable('data_alternatif.csv', range);
data1 = table2array(data);
set(handles.uitable1,'data',data1);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'data','');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[88,8,2,3,1;86,6,4,3,1;90,10,5,2,2;95,8,6,2,1;94,7,5,1,1;87,6,4,1,3;92,5,3,2,3;89,5,4,2,1;96,8,6,2,1;93,7,5,3,1];%input data berdasarkan kriteria
k=[1,1,1,1,0];%nilai atribut, dimana 0= atribut negatif &1= atribut positif
w=[0.6,0.1,0.15,0.10,0.05];%bobot untuk masing-masing kriteria
disp ('nilai input x=')
disp (x)
disp ('bobot yang diberikan w=')
disp (w)
disp ('atribut tiap kriteria k=')
disp (k)
%normalisasi matriks
[m n]=size (x); %matriks m x n dengan ukuran sebanyak variabel x (input)
R=zeros (m,n); %membuat matriks R, yang merupakan matriks kosong
Y=zeros (m,n); %membuat matriks Y, yang merupakan titik kosong
for j=1:n,
    if k(j)==1, %statement untuk kriteria dengan atribut keuntungan
        R(:,j)=x(:,j)./max(x(:,j));
    else
        R(:,j)=min(x(:,j))./x(:,j);
    end;
end;
disp ('matriks yang sudah ternormalisasi R=')
disp (R)
%tahapan kedua, proses perangkingan
for i=1:m,
    V(i)= sum(w.*R(i,:))
end;
%mencari letak nilai V maksimum
maximum = max(V);
disp ('nilai maximum = '); disp(maximum);
found = false;
i = 1;
while ((i<=m) && (~found))
    if (V(i) == maximum)
	   found = true;
    else
	   i = i + 1;
    end;
end;
if (i == 1)
    set(handles.hasil, 'String', 'Hana');
    disp ('Lulusan Terbaik Tahun Ini = Hana')
elseif (i == 2)
    set(handles.hasil, 'String', 'Dika');
    disp ('Lulusan Terbaik Tahun Ini = Dika')
elseif (i == 3)
    set(handles.hasil, 'String', 'Sarah');
    disp ('Lulusan Terbaik Tahun Ini = Sarah')
elseif (i == 4)
    set(handles.hasil, 'String', 'Nana');
    disp ('Lulusan Terbaik Tahun Ini = Nana')
elseif (i == 5)
    set(handles.hasil, 'String', 'Doni');
    disp ('Lulusan Terbaik Tahun Ini = Doni')
elseif (i == 6)
    set(handles.hasil, 'String', 'Yosep');
    disp ('Lulusan Terbaik Tahun Ini = Yosep')
elseif (i == 7)
    set(handles.hasil, 'String', 'Kevin');
    disp ('Lulusan Terbaik Tahun Ini = Kevin')
elseif (i == 8)
    set(handles.hasil, 'String', 'Yaya');
    disp ('Lulusan Terbaik Tahun Ini = Yaya')
elseif (i == 9)
    set(handles.hasil, 'String', 'Gracia');
    disp ('Lulusan Terbaik Tahun Ini = Gracia')
elseif (i == 10)
    set(handles.hasil, 'String', 'Alex');
    disp ('Lulusan Terbaik Tahun Ini = Alex')
end;


function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasil as text
%        str2double(get(hObject,'String')) returns contents of hasil as a double


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.hasil, 'String', '');
