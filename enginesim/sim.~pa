unit sim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, math, Spin;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    ListBox1: TListBox;
    SaveDialog1: TSaveDialog;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Testen;
    procedure Button2Click(Sender: TObject);
    procedure SelRekMut;
    procedure Button5Click(Sender: TObject);
    procedure speicher;
    procedure Button3Click(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

Tatom = class(TObject)
  x,y,vx,vy:extended;
  m:integer;
  o:boolean;
  procedure init;
  procedure gasstrom;
end;








var
  Form1: TForm1;
  bild:Tbitmap;
  Atom:array[0..2501] of Tatom;
  i,e,u,uu,ii,ee,aa,z:integer;
  mut,a,p:integer;
  dick:array[0..51,0..50] of extended;
  effiz:array[0..51] of extended;
  reihung:array[0..51] of integer;
  n:boolean;
  best,sec:byte;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
randomize;
best:=0;
z:=0;
for i:=0 to 2501 do
begin
atom[i]:=Tatom.create;   
atom[i].init;

end;

        a:=999;
        p:=4;
        mut:=3;                                                 //Alles für Programm bereit machen
bild:=Tbitmap.create;
bild.height:=Paintbox1.height;
bild.width:=Paintbox1.width;
bild.canvas.pen.color:=clwhite;
bild.canvas.Brush.color:=clwhite;
bild.canvas.fillrect(Rect(0,0,bild.width,bild.height));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
bild.canvas.pen.color:=clwhite;
bild.canvas.Brush.color:=clwhite;
bild.canvas.fillrect(Rect(0,0,bild.width,bild.height));



for e:=0 to p do
begin
bild.canvas.pen.color:=CLred;
bild.canvas.Brush.color:=Clred;
dick[e,0]:=100;
for i:=1 to 50 do
begin
dick[e,i]:=(random(10000)/100);                                 //erste Modelle erstellen

if e=0
then
begin
bild.canvas.moveto(round((i-1) * 10)+50,round(dick[e,i-1])+130);
bild.canvas.lineto(round(i * 10)+50,round(dick[e,i])+130);
bild.canvas.moveto(round((i-1) * 10)+50,-round(dick[e,i-1])+130);
bild.canvas.lineto(round(i * 10)+50,-round(dick[e,i])+130);
end;
end;
bild.canvas.brush.color:=claqua;
bild.canvas.FrameRect(Rect(350,0,400,bild.height));

  end;
Paintbox1.canvas.draw(0,0,bild);
end;



procedure TForm1.Button6Click(Sender: TObject);
begin
if Listbox1.visible=false
then
Listbox1.visible:=true
else
Listbox1.visible:=false;

Listbox1.clear;

for i:=0 to 50 do
Listbox1.Items.Add(floattostr( dick[best,i]));

Paintbox1.canvas.draw(0,0,bild);

end;


procedure Tatom.gasstrom;
var t,s,vb,dd,beta,alpha,v:extended;
begin

begin
n:=false;                                   //Kollisionen der atome abfragen
For i:=0 to 49 do
begin

dd:=dick[e,i+1]-dick[e,i];

t:=-((vx*(y-130+dick[e,i])+vy*(50+i*10-x))/(dd*vx-vy*10));

s:=(-x+50+i*10+t*10)/vx;

if (t<1) and (t>=0) and (n=false) and (s<1) and (s>0)
then
begin
n:=true;
beta:=arctan2(vy,vx);

v:=sqrt(vx*vx+vy*vy);
alpha:=arccos((dd*vx-vy*10)/(v*sqrt(dd*dd+100)));

if alpha>PI
then
alpha:=alpha-2*PI;


if alpha>PI/2
then
begin
alpha:=alpha-PI;
end;


if alpha<-PI/2
then
begin
alpha:=alpha+PI;
end;


x:=x+vx*s;
y:=y+vy*s;
beta:=(beta+2*alpha+PI);

vx:=cos(beta)*v;
vy:=sin(beta)*v;


end;


t:=((vx*(y-130-dick[e,i])+vy*(50+i*10-x))/(dd*vx-vy*10));

s:=(-x+50+i*10+t*10)/vx;

if (t<1) and (t>=0) and (n=false) and (s<1) and (s>=0)
then
begin
n:=true;
beta:=arctan2(vy,vx);

v:=sqrt(vx*vx+vy*vy);
alpha:=arccos((dd*vx-vy*10)/(v*sqrt(dd*dd+100)));

if alpha>PI
then
alpha:=alpha-2*PI;


if alpha>PI/2
then
begin
alpha:=alpha-PI;
end;


if alpha<-PI/2
then
begin
alpha:=alpha+PI;
end;




beta:=(beta+2*alpha+PI);


x:=x+vx*s;
y:=y+vy*s;
vx:=cos(beta)*v;
vy:=sin(beta)*v;


end;

end;
end;

if (x>350) and (x<400)
then
begin
vx:=vx*2;
vy:=vy*2;
end;

x:=x+vx;
y:=y+vy;          {
bild.canvas.pixels[round(x),round(y)]:=clgreen;
Form1.Paintbox1.canvas.draw(0,0,bild);     } 
end;


procedure TForm1.Testen;
begin
canvas.pixels[0,0]:=clred;
for e:=0 to p do
begin
effiz[e]:=0;
end;

For uu:=0 to a do
atom[uu].init;

For e:=0 to p do
begin
bild.canvas.pen.color:=clwhite;
bild.canvas.Brush.color:=clwhite;
bild.canvas.fillrect(Rect(0,0,bild.width,bild.height));
bild.canvas.pen.color:=clred;
bild.canvas.Brush.color:=clred;
for ii:=1 to 50 do
begin
bild.canvas.moveto(round((ii-1) * 10)+50,round(dick[e,ii-1])+130);
bild.canvas.lineto(round(ii * 10)+50,round(dick[e,ii])+130);
bild.canvas.moveto(round((ii-1) * 10)+50,-round(dick[e,ii-1])+130);
bild.canvas.lineto(round(ii * 10)+50,-round(dick[e,ii])+130);
end;                                                                       //aktuelles Modell anzeigen
bild.canvas.brush.color:=claqua;
bild.canvas.FrameRect(Rect(350,0,400,bild.height));

Paintbox1.canvas.draw(0,0,bild);

For uu:=0 to a do
atom[uu].init;


For ii:=0 to 50 do
begin

if ii<=a
then
atom[ii].o:=true;

for ee:=0 to a do
begin
if (atom[ee].o=true)
then
atom[ee].gasstrom;
if (atom[ee].o=true)                                  //Luftstrom starten
then
begin
if (atom[ee].x>550) and (atom[ee].y>25) and (atom[ee].y<250)
then
begin
atom[ee].o:=false;
effiz[e]:=effiz[e]+atom[ee].vx;
end
else if (atom[ee].x<0)
then
begin
atom[ee].o:=false ;
effiz[e]:=effiz[e]+atom[ee].vx;
end;

if (atom[ee].y<0) or (atom[ee].y>350)
then
atom[ee].o:=false ;


end;
end;


end;



For ii:=0 to 1950 do
begin

for ee:=0 to a do
begin
if (atom[ee].o=true)
then
atom[ee].gasstrom;                       //Luftstrom forsetzen

if (atom[ee].o=true)                                  //Luftstrom starten
then
begin
if (atom[ee].x>550) and (atom[ee].y>25) and (atom[ee].y<250)
then
begin
atom[ee].o:=false;
effiz[e]:=effiz[e]+atom[ee].vx;
end
else if (atom[ee].x<0)
then
begin
atom[ee].o:=false ;
effiz[e]:=effiz[e]+atom[ee].vx;
end;

if (atom[ee].y<0) or (atom[ee].y>350)
then
atom[ee].o:=false ;
end;




end;
                        
end;
end;
 canvas.pixels[0,0]:=cllime;

end;


procedure TForm1.Button2Click(Sender: TObject);
begin
Testen;
end;

procedure TForm1.SelRekMut;

begin

best:=0;
for i:=0 to p do
if effiz[i]>effiz[best]                      //Beste
then
best:=i;


sec:=0;
for i:=0 to p do
if (effiz[i]>effiz[sec]) and (i<>best)
then                                                       //Zweit Beste
sec:=i;

if sec=best
then
repeat
sec:=random(p+1);
until sec<>best;

for e:=0 to p do
begin
if (e<>sec) and (e<>best)
then
for i:=0 to 50 do
if random(2)=1
then                                               //Rekombination
dick[e,i]:=dick[best,i]
else
dick[e,i]:=dick[sec,i];
end;


for i:=0 to p do
if (i<>best) and (i<>sec)
then
begin
for e:=1 to mut do

dick[i,random(51)]:=(random(10000)/100);              //Mutation

end;

bild.canvas.pen.color:=clwhite;
bild.canvas.Brush.color:=clwhite;
bild.canvas.fillrect(Rect(0,0,bild.width,bild.height));
bild.canvas.pen.color:=clred;
bild.canvas.Brush.color:=clred;
for i:=1 to 50 do
begin
bild.canvas.moveto(round((i-1) * 10)+50,round(dick[best,i-1])+130);
bild.canvas.lineto(round(i * 10)+50,round(dick[best,i])+130);
bild.canvas.moveto(round((i-1) * 10)+50,-round(dick[best,i-1])+130);
bild.canvas.lineto(round(i * 10)+50,-round(dick[best,i])+130);
end;                                                                        //Bestes Modell anzeigen
bild.canvas.brush.color:=claqua;
bild.canvas.FrameRect(Rect(350,0,400,bild.height));

Paintbox1.canvas.draw(0,0,bild);


end;


procedure TForm1.Button5Click(Sender: TObject);
begin
   SelRekMut;
end;


Procedure TForm1.speicher;
var F:Textfile;
begin
if SaveDialog1.Execute
then
begin
AssignFile(F, SaveDialog1.FileName);
rewrite(F);                                    //Beste Modell speichern
for i:=0 to 50 do
writeln(F,floattostr(100*dick[best,i]));
closefile(F);
end;

end;


procedure TForm1.Button3Click(Sender: TObject);
begin
speicher;
end;

procedure Tatom.init;
begin                
x:=10;

y:=(random(100000)/1000)+80;
vx:=random(10000)/10000+0.5;
vy:=random(10000)/10000-0.5;                     //Atome vorbereiten
m:=1;
o:=false;
end;




procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
mut:=Spinedit3.value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
a:=Spinedit2.value-1;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
p:=Spinedit1.value-1;
end;

end.
