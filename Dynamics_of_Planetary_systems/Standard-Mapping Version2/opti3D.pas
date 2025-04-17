unit opti3D;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, Gauges, Math;

type
  TForm6 = class(TForm)
    PaintBox1: TPaintBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    Label12: TLabel;
    Button5: TButton;
    GroupBox4: TGroupBox;
    Edit2: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit3: TEdit;
    Label15: TLabel;
    Edit4: TEdit;
    Label16: TLabel;
    Edit5: TEdit;
    Button6: TButton;
    Gauge1: TGauge;
    Label17: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

  type Tspeicher=Record
  k,x,y,r:longint;
  end;

 
var
  Form6: TForm6;
  kauf,xauf,yauf,iter,wuerfel:longint;
  kmax,kmin,volu:extended;
   karte:array[0..2] of TKarte;
   //optimal:TKarte;

implementation

uses main;

{$R *.dfm}

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form6.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm6.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form6.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
form6.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
if opendialog1.Execute
then
edit1.text:=opendialog1.FileName;
end;

procedure TForm6.Button4Click(Sender: TObject);
var s:string;
    TF:Textfile;
begin

assignfile(TF,edit1.text);
reset(TF);
readln(TF,s);
Label2.Caption:='x-Auflösung: '+s;
xauf:=strtoint(s);
readln(TF,s);
Label3.Caption:='y-Auflösung: '+s;
yauf:=strtoint(s);
readln(TF,s);
Label4.Caption:='k-Auflösung: '+s;
kauf:=strtoint(s);
readln(TF,s);
Label5.Caption:='kmin: '+s;
kmin:=strtofloat(s);
readln(TF,s);
Label6.Caption:='kmax: '+s;
kmax:=strtofloat(s);
readln(TF,s);
Label7.Caption:='Iterationen: '+s;
iter:=strtoint(s);
closefile(TF);
Label9.Caption:='Datenmenge: '+floattostr(roundto(((xauf+1)*(yauf+1)*(kauf+1)/1024),-3))+' kB';

end;

procedure TForm6.Button2Click(Sender: TObject);
var F:file of boolean;
    O:file of Tspeicher;
    lang,i,e,a,u:longint;
    s:string;
    aktu,add1,add2:integer;
    hilf:Tspeicher;
begin
Form6.Button4Click(NIL);

s:=edit1.Text;
lang:=length(s);
s[lang-7]:='d';
s[lang-6]:='a';
s[lang-5]:='t';
s[lang-4]:='a';

assignfile(F,s);
reset(F);

s[lang-7]:='o';
s[lang-6]:='p';
s[lang-5]:='t';
s[lang-4]:='i';

assignfile(O,s);
rewrite(O);
Gauge1.Progress:=round(100/kauf);

wuerfel:=0;
volu:=0;


for a:=0 to 2 do
begin
setlength(karte[a].reihe,xauf+1);
for i:=0 to xauf do
setlength(karte[a].reihe[i].spalte,yauf+1);
end;



For i:=0 to xauf do
for e:=0 to yauf do
begin
read(F,karte[0].reihe[i].spalte[e]);
if karte[0].reihe[i].spalte[e]=false
then
begin
hilf.k:=0;
hilf.x:=i;
hilf.y:=e;

for u:=0 to 5 do
begin
hilf.r:=u;
write(O,hilf);
inc(wuerfel);
end;

volu:=volu+1;

end;

end;


For i:=0 to xauf do
for e:=0 to yauf do
read(F,karte[1].reihe[i].spalte[e]);

aktu:=1;

for a:=1 to kauf-1 do
begin

inc(aktu);
if aktu>2
then
aktu:=0;

For i:=0 to xauf do
for e:=0 to yauf do
read(F,karte[aktu].reihe[i].spalte[e]);

dec(aktu);
if aktu<0
then
aktu:=2;

for i:=0 to xauf do
begin

if karte[aktu].reihe[i].spalte[0]=false
then
begin
hilf.k:=a;
hilf.x:=i;
hilf.y:=0;

for u:=0 to 5 do
begin
hilf.r:=u;
write(O,hilf);
inc(wuerfel);
end;

volu:=volu+1;

end;

if karte[aktu].reihe[i].spalte[yauf]=false
then
begin
hilf.k:=a;
hilf.x:=i;
hilf.y:=yauf;

for u:=0 to 5 do
begin
hilf.r:=u;
write(O,hilf);
inc(wuerfel);
end;

volu:=volu+1;

end;

end;



for i:=0 to yauf do
begin

if karte[aktu].reihe[0].spalte[i]=false
then
begin
hilf.k:=a;
hilf.x:=0;
hilf.y:=i;

for u:=0 to 5 do
begin
hilf.r:=u;
write(O,hilf);
inc(wuerfel);
end;


volu:=volu+1;

end;

if karte[aktu].reihe[xauf].spalte[i]=false
then
begin
hilf.k:=a;
hilf.x:=xauf;
hilf.y:=i;

for u:=0 to 5 do
begin
hilf.r:=u;
write(O,hilf);
inc(wuerfel);
end;

volu:=volu+1;

end;

end;

for i:=1 to xauf-1 do
for e:=1 to yauf-1 do
if karte[aktu].reihe[i].spalte[e]=false
then
begin
volu:=volu+1;


case aktu of
0:begin               
add1:=2;
add2:=1;
end;
1:begin
add1:=0;
add2:=2;
end;
else
begin
add1:=1;
add2:=0;
end;
end;

hilf.k:=a;
hilf.x:=i;
hilf.y:=e;

if (karte[add1].reihe[i].spalte[e]=true)
then
begin
hilf.r:=0;
write(O,hilf);
inc(wuerfel);

end;

if  (karte[add2].reihe[i].spalte[e]=true)
then
begin

hilf.r:=5;
write(O,hilf);
inc(wuerfel);
end;

if (karte[aktu].reihe[i+1].spalte[e]=true)
then
begin
hilf.r:=1;
write(O,hilf);
inc(wuerfel);
end;

if (karte[aktu].reihe[i-1].spalte[e]=true)
then
begin
hilf.r:=3;
write(O,hilf);
inc(wuerfel);
end;

if (karte[aktu].reihe[i].spalte[e+1]=true)
then
begin
hilf.r:=4;
write(O,hilf);
inc(wuerfel);
end;

if (karte[aktu].reihe[i].spalte[e-1]=true)
then
begin
hilf.r:=2;
write(O,hilf);
inc(wuerfel);
end;


end;
Gauge1.Progress:=round(100*a/kauf);

inc(aktu);
if aktu>2
then
aktu:=0;

end;


For i:=0 to xauf do
for e:=0 to yauf do
begin
if karte[aktu].reihe[i].spalte[e]=false
then
begin        
hilf.k:=kauf;
hilf.x:=i;
hilf.y:=e;

for u:=0 to 5 do
begin
hilf.r:=u;
write(O,hilf);
inc(wuerfel);
end;

volu:=volu+1;
end;

end;

Gauge1.Progress:=100;
closefile(O);
closefile(F);
volu:=volu/(xauf*yauf*kauf/(kmax-kmin));
Label10.Caption:='Inselvolumen: '+floattostr(roundto(volu,-3));
Label11.Caption:='Würfelzahl: '+inttostr(wuerfel);
Label17.Caption:='Gesammtzahl: '+inttostr((xauf+1)*(yauf+1)*(kauf+1));
end;

end.
