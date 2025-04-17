unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, math, Gauges, ExtDlgs;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    GroupBox2: TGroupBox;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    Label8: TLabel;
    Edit7: TEdit;
    Label9: TLabel;
    Button4: TButton;
    Gauge1: TGauge;
    Button5: TButton;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Button6: TButton;
    Button7: TButton;
    SavePictureDialog1: TSavePictureDialog;
    RadioButton4: TRadioButton;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label10: TLabel;
    Label11: TLabel;
    RadioButton5: TRadioButton;
    procedure Einlesen;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Ausgabe;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
      procedure Stretchfaktor;
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  k,x,y:extended;
  maximum:longint;
  xx,yy:array of extended;
  bild,puff:Tbitmap;
  xmin,xmax,ymin,ymax,xstretch,ystretch:extended;
  klick:boolean;
  ax,ay:integer;

implementation

{$R *.dfm}

Procedure TForm1.Einlesen;
begin
x:=strtofloat(edit1.text);
y:=strtofloat(edit2.text);
k:=strtofloat(edit3.text);
maximum:=spinedit1.Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:longint;
begin
Einlesen;


Gauge1.Visible:=True;
Gauge1.Progress:=0;

if radiobutton5.checked=false
then
begin
setlength(xx,maximum);
setlength(yy,maximum);

xx[0]:=x;
yy[0]:=y;
end
else
begin
Stretchfaktor;
bild.Canvas.Brush.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,500,500));
end;

for i:=1 to maximum-1 do
begin

y:=y+(k/(2*PI))*sin(2*PI*x);
x:=x+y;

x:=x - trunc(x);
y:=y - trunc(y);
           
if x<0
then
x:=x+1;

if y<0
then
y:=y+1;

if radiobutton5.checked=false
then
begin
xx[i]:=x;
yy[i]:=y;
end
else
begin                     //Noch für Zoomen bedenken
bild.canvas.Pixels[round(((xx[i]-xmin)/xstretch*500)),round(500-((yy[i]-ymin)/ystretch*500))]:=clred;
end;


if (i*99)/maximum>Gauge1.progress
then
gauge1.progress:=round((i*99)/maximum);

end;

if radiobutton5.checked=false
then
Ausgabe
else
puff.canvas.draw(0,0,bild);

gauge1.progress:=100;
Gauge1.Visible:=false;
Paintbox1.Canvas.Draw(0,0,bild);
end;


procedure Tform1.Ausgabe;
var i,i1,i2,e1,e2,fff,getc:integer;
    color:longint;
    xrel,yrel:integer;
begin
Stretchfaktor;
bild.Canvas.Brush.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,500,500));

for i:=0 to maximum-1 do
begin

if radiobutton1.checked=true
then
begin
color:=clred;
end
else
if radiobutton2.checked=true
then
begin
color:=spinedit2.value;
end
else
if radiobutton3.checked=true
then
begin
color:=round(i*255/maximum);
end
else
begin
color:=spinedit2.value;
end;


xrel:=round(((xx[i]-xmin)/xstretch*500));
yrel:=round(500-((yy[i]-ymin)/ystretch*500));

if (radiobutton2.checked=true) or (radiobutton4.checked=true)
then
begin
if bild.Canvas.Pixels[xrel,yrel]=clwhite
then
bild.Canvas.Pixels[xrel,yrel]:=Spinedit3.value
else
bild.Canvas.Pixels[xrel,yrel]:=bild.Canvas.Pixels[xrel,yrel]+color;
end
else
bild.Canvas.Pixels[xrel,yrel]:=color;
end;

if radiobutton4.checked=true
then
begin
for i1:=0 to (500 div spinedit3.value) do
for i2:=0 to (500 div spinedit3.value) do
begin
fff:=0;
for e1:=0 to spinedit3.Value-1 do
for e2:=0 to spinedit3.value-1 do
begin
getc:=bild.Canvas.Pixels[(i1*spinedit3.value)+e1,(i2*spinedit3.value)+e2];
if getc<>clwhite
then
fff:=fff+getc;

end;

if fff=0
then
fff:=clwhite;

bild.Canvas.Brush.Color:=fff;
bild.canvas.FillRect(rect(i1*spinedit3.value,i2*spinedit3.value,((i1+1)*spinedit3.value),((i2+1)*spinedit3.value)));
end;

end;

puff.canvas.draw(0,0,bild);
bild.Canvas.Brush.Color:=clwhite;
Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
bild:=Tbitmap.create;
bild.Canvas.Brush.Color:=clwhite;
bild.Canvas.pen.Color:=clgreen;
bild.canvas.fillrect(rect(0,0,500,500));
bild.Width:=500;
bild.height:=500;
puff:=Tbitmap.create;
puff.Width:=500;
puff.height:=500;
klick:=false;
Stretchfaktor;
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var     xrel,yrel:extended;
begin
    xrel:=roundto((X/500*xstretch)+xmin,-6);
    yrel:=roundto(((500-Y)/500*ystretch)+ymin,-6);
Label5.caption:='Pos: ('+floattostr(xrel)+' / '+floattostr(yrel)+')';

if klick=false
then
begin
klick:=true;

ax:=x;
ay:=y;
end;



Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var     xrel,yrel:extended;
begin
    xrel:=roundto((X/500*xstretch)+xmin,-6);
    yrel:=roundto(((500-Y)/500*ystretch)+ymin,-6);
Label5.caption:='Pos: ('+floattostr(xrel)+' / '+floattostr(yrel)+')';

if klick=true
then
begin
bild.canvas.draw(0,0,puff);
bild.canvas.MoveTo(ax,ay);
bild.canvas.LineTo(ax,Y);
bild.canvas.LineTo(X,Y);
bild.canvas.LineTo(X,ay);
bild.canvas.LineTo(ax,ay);
end;

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var     xrel,yrel:extended;
          x1,x2,y1,y2,h:extended;
begin
    xrel:=roundto((X/500*xstretch)+xmin,-6);
    yrel:=roundto(((500-Y)/500*ystretch)+ymin,-6);
Label5.caption:='Pos: ('+floattostr(xrel)+' / '+floattostr(yrel)+')';
Paintbox1.Canvas.Draw(0,0,bild);

if klick=true
then
begin
x1:=(ax/500*xstretch)+xmin;
x2:=(X/500*xstretch)+xmin;
y1:=((500-ay)/500*ystretch)+ymin;
y2:=((500-Y)/500*ystretch)+ymin;

if x1>x2
then
begin
h:=x1;
x1:=x2;
x2:=h;
end;

if y1>y2
then
begin
h:=y1;
y1:=y2;
y2:=h;
end;

edit4.text:=floattostr(x1);
edit5.text:=floattostr(x2);
edit6.text:=floattostr(y1);
edit7.text:=floattostr(y2);

Ausgabe;
end;

klick:=false;
end;


procedure Tform1.Stretchfaktor;
begin                         
xmin:=strtofloat(edit4.text);
xmax:=strtofloat(edit5.text);
ymin:=strtofloat(edit6.text);
ymax:=strtofloat(edit7.text);

xstretch:=(xmax-xmin);
ystretch:=(ymax-ymin);

end;


procedure TForm1.Button4Click(Sender: TObject);
begin

Ausgabe;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
edit1.text:='0,5';
edit2.text:='0,5';
edit3.text:='1';
edit4.text:='0';
edit5.text:='1';
edit6.text:='0';
edit7.text:='1';
Spinedit1.Value:=100;
Spinedit2.Value:=10;
Spinedit3.Value:=1;
radiobutton1.Checked:=true;
bild.Canvas.Brush.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,500,500));
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
    F:textfile;
begin

if savedialog1.Execute
then
begin

assignfile(F,savedialog1.FileName);
rewrite(F);
writeln(F,floattostr(k));

for i:=0 to maximum-1 do
writeln(F,floattostr(xx[i])+' '+floattostr(yy[i])+' ');

closefile(F);
end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var F:textfile;
    s,h1,h2:string;
    i:integer;
begin

if opendialog1.Execute
then
begin

assignfile(F,opendialog1.FileName);
reset(F);
readln(F,s);
edit3.text:=s;

 if MessageDlg('Gleicher Startwert (Ja) - letzter Wert als Startwert (Nein)',
    mtInformation, [mbYes, mbNo], 0) = mrYes
    then
  begin
  readln(F,s);
  end
  else
  begin

while EOF(F)=false  do
begin
readln(F,s);
end;



  end;

i:=1;

while s[i]<>' ' do
begin
inc(i);
h1[i]:=s[i];
end;

edit1.Text:=h1;

inc(i);

while s[i]<>' '  do
begin
inc(i);
h2[i]:=s[i];
end;

edit2.Text:=h2;

closefile(F);

end;

end;




procedure TForm1.Button7Click(Sender: TObject);
begin
SavePictureDialog1.DefaultExt := GraphicExtension(Tbitmap);
SavePictureDialog1.Filter := GraphicFilter(TBitmap);
if SavePictureDialog1.execute
then
puff.SaveToFile(savepicturedialog1.filename);
end;

end.
