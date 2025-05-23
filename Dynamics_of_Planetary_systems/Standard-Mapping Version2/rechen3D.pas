unit rechen3D;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Gauges;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    SpinEdit4: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Edit4: TEdit;
    Label8: TLabel;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    CheckBox2: TCheckBox;
    GroupBox5: TGroupBox;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type TSpalte=record
  spalte:array of Boolean;
  end;

  type TKarte=Record
  reihe:array of Tspalte;
  end;

var
  Form3: TForm3;
  karte,leer:TKarte;

implementation

uses main;

{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form3.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form3.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form3.Visible:=false;
Form1.Visible:=true;

end;

procedure TForm3.Button3Click(Sender: TObject);
begin
if savedialog1.Execute
then
edit4.text:=savedialog1.FileName;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
randomize;
end;

procedure TForm3.Button1Click(Sender: TObject);
var i,e,a,ii,ee:integer;
    x,y,k:extended;
    F,Z:file of boolean;
    TF:textfile;
begin
setlength(leer.reihe,spinedit1.value+1);
setlength(karte.reihe,spinedit1.value+1);
for i:=0 to spinedit1.value do
begin
setlength(leer.reihe[i].spalte,spinedit2.Value+1);
setlength(karte.reihe[i].spalte,spinedit2.Value+1);
end;
for i:=0 to spinedit1.value do
for e:=0 to spinedit2.Value do
begin
leer.reihe[i].spalte[e]:=false;
karte.reihe[i].spalte[e]:=false;
end;

assignfile(TF,edit4.Text+'info.dat');
rewrite(TF);
writeln(TF,inttostr(Spinedit1.value));
writeln(TF,inttostr(Spinedit2.value));
writeln(TF,inttostr(Spinedit3.value));
writeln(TF,edit1.text);
writeln(TF,edit2.text);
writeln(TF,inttostr(Spinedit4.value));
closefile(TF);

assignfile(F,edit4.Text+'data.dat');
rewrite(F);



for a:=0 to spinedit3.value do
begin
k:=strtofloat(edit1.Text)+a*(strtofloat(edit2.Text)-strtofloat(edit1.text))/spinedit3.value;


if k<0
then
begin
x:=0.5;
y:=0;
end
else
begin
x:=1/spinedit1.value;
y:=0;
end;


for i:=1 to spinedit4.value do
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

karte.reihe[round(x*spinedit1.value)].spalte[round(y*spinedit2.value)]:=true;

gauge1.progress:=round(100*(i/spinedit4.value));


end;         


if checkbox2.checked=false
then
begin
for ii:=0 to spinedit1.Value do
for ee:=0 to spinedit2.Value do
Write(F,karte.reihe[ii].spalte[ee]);
end
else
begin
assignfile(Z,edit4.Text+'kpic'+floattostr(k)+'.dat');
rewrite(Z);
for ii:=0 to spinedit1.Value do
for ee:=0 to spinedit2.Value do
begin
Write(F,karte.reihe[ii].spalte[ee]);
Write(Z,karte.reihe[ii].spalte[ee]);
end;
Closefile(F);
end;


Gauge2.Progress:=round(100*a/spinedit3.value);
karte:=leer;

end;
closefile(F);
end;

end.
