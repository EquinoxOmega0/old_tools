unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ExtDlgs;

  type TWertepaar=record
  x,y:extended;
  end;
    type TSpalte=record
  wert:array of extended;
  end;
type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Button5: TButton;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Memo1: TMemo;
    SaveDialog2: TSaveDialog;
    PaintBox1: TPaintBox;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Neu1: TMenuItem;
    Speichern1: TMenuItem;
    WerteLaden1: TMenuItem;
    ErgebnisseSpeichern1: TMenuItem;
    Beenden1: TMenuItem;
    Berechnen1: TMenuItem;
    Grafik1: TMenuItem;
    Anzeigen1: TMenuItem;
    Speichern2: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    SavePictureDialog1: TSavePictureDialog;
    Werte1: TMenuItem;
    Hinzu1: TMenuItem;
    Lschen1: TMenuItem;
    Sortierenachx1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
   function determinante(var Cmat:array of Tspalte):extended;
    procedure Button10Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Neu1Click(Sender: TObject);
    procedure Speichern1Click(Sender: TObject);
    procedure Beenden1Click(Sender: TObject);
    procedure WerteLaden1Click(Sender: TObject);
    procedure ErgebnisseSpeichern1Click(Sender: TObject);
    procedure Berechnen1Click(Sender: TObject);
    procedure Anzeigen1Click(Sender: TObject);
    procedure Speichern2Click(Sender: TObject);
    procedure Hinzu1Click(Sender: TObject);
    procedure Lschen1Click(Sender: TObject);
    procedure Sortierenachx1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;





var
  Form1: TForm1;
  wertetabelle:array of TWertepaar;
  delta:array of TWertepaar;
  wtlang:integer;
  matrix,Amat,Bmat:array of TSpalte;
  yzweistrich:array of extended;
  Ak,Bk,Ck,Dk:array of extended;
  bild:Tbitmap;
  Px,Py,scalx,scaly:extended;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin               //Initialisierung
wtlang:=0;
Bild:=tbitmap.create;
bild.width:=800;
bild.Height:=600;
Bild.Canvas.Brush.Color:=clwhite;
Bild.Canvas.fillrect(rect(0,0,800,600));
px:=0;
py:=0;
scalx:=1;
scaly:=1;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if (edit1.text<>'') and (edit2.text<>'')
then
begin
inc(wtlang);
setlength(wertetabelle,wtlang);                  //neue werte Hinzu
wertetabelle[wtlang-1].x:=strtofloat(edit1.text);
wertetabelle[wtlang-1].y:=strtofloat(edit2.text);
listbox1.Items.Add(edit1.Text+' / '+edit2.text);
edit1.Text:='';
edit2.Text:='';
end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
close; //Schließen
end;

procedure TForm1.Button2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.Items.Count-1 do
if listbox1.Selected[i]=true
then
a:=i;
                         //Löschen
if a>-1
then
begin
for i:= a to listbox1.Items.Count-2 do
begin
wertetabelle[i].x:=wertetabelle[i+1].x;
wertetabelle[i].y:=wertetabelle[i+1].y;
end;
dec(wtlang);
setlength(wertetabelle,wtlang);
listbox1.Items.Delete(a);
end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var i,e:integer;
h:extended;
begin                               //sortieren

for i:=0 to wtlang-1 do
for e:=0 to i do 
if wertetabelle[i].x<wertetabelle[e].x
then
begin
h:=wertetabelle[i].x;
wertetabelle[i].x:=wertetabelle[e].x;
wertetabelle[e].x:=h;
h:=wertetabelle[i].y;
wertetabelle[i].y:=wertetabelle[e].y;
wertetabelle[e].y:=h;
end;
listbox1.Clear;
for i:=0 to wtlang-1 do
listbox1.Items.Add(floattostr(wertetabelle[i].x)+' / '+floattostr(wertetabelle[i].y));


end;

procedure TForm1.Button7Click(Sender: TObject);
var F:textfile;
      i:integer;
begin
if savedialog1.Execute                //Speichern der Werte
then
begin
assignfile(F,savedialog1.FileName);
rewrite(F);
writeln(F,inttostr(wtlang));
for i:=0 to wtlang-1 do
begin
writeln(F,floattostr(wertetabelle[i].x));
writeln(F,floattostr(wertetabelle[i].y));
end;
writeln(F,edit3.text);
writeln(F,edit4.text);

if radiobutton1.checked=true
then
writeln(F,'2')
else
writeln(F,'1');

closefile(F);

end;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
wtlang:=0;              //Neues Spline
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
listbox1.Clear;
memo1.Clear;
px:=0;
py:=0;
scalx:=1;
scaly:=1;
end;

procedure TForm1.Button8Click(Sender: TObject);
var F:textfile;
    i:integer;            //Laden von Werten
    s:string;
begin
if opendialog1.Execute
then
begin

wtlang:=0;             
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
listbox1.Clear;
memo1.Clear;

assignfile(F,opendialog1.FileName);
reset(F);
readln(F,s);
wtlang:=strtoint(s);
setlength(wertetabelle,wtlang);
for i:=0 to wtlang-1 do
begin
readln(F,s);
wertetabelle[i].x:=strtofloat(s);
readln(F,s);
wertetabelle[i].y:=strtofloat(s);
listbox1.Items.Add(floattostr(wertetabelle[i].x)+' / '+floattostr(wertetabelle[i].y));
end;

readln(F,s);
edit3.Text:=s;
readln(F,s);
edit4.Text:=s;

readln(F,s);
if s='2'
then
radiobutton1.Checked:=true
else
radiobutton2.Checked:=true;

closefile(F);
end;


end;

procedure TForm1.Button5Click(Sender: TObject);
var i,e,ii,ee:integer;
    deter:extended;
begin         //Berechnen

memo1.Clear;

setlength(delta,wtlang-1);
for i:=0 to wtlang-2 do
begin
delta[i].x:=wertetabelle[i+1].x-wertetabelle[i].x;
delta[i].y:=wertetabelle[i+1].y-wertetabelle[i].y;
end;

setlength(yzweistrich,wtlang);


if radiobutton1.checked=true
then
begin


yzweistrich[0]:=strtofloat(edit3.text);
yzweistrich[wtlang-1]:=strtofloat(edit4.text);

setlength(matrix,wtlang-1);
for i:=0 to wtlang-2 do
setlength(matrix[i].wert,wtlang-2);

For i:=0 to wtlang-2 do
for e:=0 to wtlang-3 do
matrix[i].wert[e]:=0;






for i:=0 to wtlang-3 do
matrix[i].wert[i]:=2*(delta[i].x+delta[i+1].x);

for i:=0 to wtlang-4 do
matrix[i+1].wert[i]:=delta[i+1].x;

for i:=0 to wtlang-4 do
matrix[i].wert[i+1]:=delta[i+1].x;

for i:=0 to wtlang-3 do
matrix[wtlang-2].wert[i]:=6*(delta[i+1].y/delta[i+1].x-delta[i].y/delta[i].x);

matrix[wtlang-2].wert[0]:=matrix[wtlang-2].wert[0]-delta[0].x*yzweistrich[0];
matrix[wtlang-2].wert[wtlang-3]:=matrix[wtlang-2].wert[wtlang-3]-delta[wtlang-2].x*yzweistrich[wtlang-1];


setlength(Amat,wtlang-2);
for i:=0 to wtlang-3 do
setlength(Amat[i].wert,wtlang-2);

setlength(Bmat,wtlang-2);
for i:=0 to wtlang-3 do
setlength(Bmat[i].wert,wtlang-2);

for i:=0 to wtlang-3 do
for e:=0 to wtlang-3 do
Amat[i].wert[e]:=matrix[i].wert[e];


deter:=determinante(Amat);



for i:=0 to wtlang-3 do
begin

for ii:=0 to wtlang-3 do
for ee:=0 to wtlang-3 do
Bmat[ii].wert[ee]:=matrix[ii].wert[ee];

for e:=0 to wtlang-3 do
Bmat[i].wert[e]:=matrix[wtlang-2].wert[e];

yzweistrich[i+1]:=determinante(Bmat)/deter;
end;




end
else
begin



setlength(matrix,wtlang+1);
for i:=0 to wtlang do
setlength(matrix[i].wert,wtlang);

For i:=0 to wtlang do
for e:=0 to wtlang-1 do
matrix[i].wert[e]:=0;



                


for i:=1 to wtlang-2 do
matrix[i].wert[i]:=2*(delta[i-1].x+delta[i].x);

for i:=0 to wtlang-2 do
matrix[i+1].wert[i]:=delta[i].x;       

for i:=0 to wtlang-2 do
matrix[i].wert[i+1]:=delta[i].x;

for i:=1 to wtlang-2 do
matrix[wtlang].wert[i]:=6*(delta[i].y/delta[i].x-delta[i-1].y/delta[i-1].x);

matrix[wtlang].wert[0]:=6*(delta[0].y/delta[0].x-strtofloat(edit3.text));
matrix[wtlang].wert[wtlang-1]:=6*(strtofloat(edit4.text)-delta[wtlang-2].y/delta[wtlang-2].x);
matrix[0].wert[0]:=2*delta[0].x;
matrix[wtlang-1].wert[wtlang-1]:=2*delta[wtlang-2].x;

setlength(Amat,wtlang);
for i:=0 to wtlang-1 do
setlength(Amat[i].wert,wtlang);

setlength(Bmat,wtlang);
for i:=0 to wtlang-1 do
setlength(Bmat[i].wert,wtlang);


          

for i:=0 to wtlang-1 do
for e:=0 to wtlang-1 do
Amat[i].wert[e]:=matrix[i].wert[e];
            

deter:=determinante(Amat);



for i:=0 to wtlang-1 do        
begin

for ii:=0 to wtlang-1 do
for ee:=0 to wtlang-1 do
Bmat[ii].wert[ee]:=matrix[ii].wert[ee];

for e:=0 to wtlang-1 do
Bmat[i].wert[e]:=matrix[wtlang].wert[e];

yzweistrich[i]:=determinante(Bmat)/deter;
end;



                     


                      

end;


memo1.Lines.Add('A-Matrix : '+floattostr(deter));

for i:=0 to wtlang-1 do
memo1.Lines.Add('y"'+inttostr(i+1)+' :'+floattostr(yzweistrich[i]));

setlength(Ak,wtlang-1);
setlength(Bk,wtlang-1);
setlength(Ck,wtlang-1);
setlength(Dk,wtlang-1);

for i:=0 to wtlang-2 do
begin
Ak[i]:=1/(6*delta[i].x)*(yzweistrich[i+1]-yzweistrich[i]);
Bk[i]:=yzweistrich[i]/2;
Ck[i]:=(delta[i].y/delta[i].x)-(1/6*delta[i].x*(yzweistrich[i+1]+2*yzweistrich[i]));
Dk[i]:=wertetabelle[i].y;
end;



memo1.lines.add('-------------------------');
memo1.Lines.Add('fk(x) = Ak (x+xk)^3 + Bk (x-xk)^2 + Ck (x-xk) + Dk');
memo1.lines.add('');
for i:=0 to wtlang-2 do
begin
memo1.Lines.Add('A'+inttostr(i+1)+' : '+floattostr(Ak[i]));
memo1.Lines.Add('B'+inttostr(i+1)+' : '+floattostr(Bk[i]));
memo1.Lines.Add('C'+inttostr(i+1)+' : '+floattostr(Ck[i]));
memo1.Lines.Add('D'+inttostr(i+1)+' : '+floattostr(Dk[i]));
end;



end;

    function Tform1.determinante(var Cmat:array of Tspalte):extended;
    var dimen,i,e,a:integer;
        zs,hhh:extended;
        Dmat:array of TSpalte;
    begin        ///determinate Berechnen;

                     

          dimen:=high(cmat);
          zs:=0;

   setlength(Dmat,dimen);
for i:=0 to dimen-1 do
setlength(Dmat[i].wert,dimen);



          if dimen<>1
          then
          begin
          for i:=0 to dimen do
          begin


          if ((i+2) mod 2)<>0
          then
          hhh:=-1
          else
          hhh:=1;

          hhh:=hhh*Cmat[0].wert[i];




          if hhh<>0
          then
          begin

          for a:=0 to dimen-1 do
          for e:=0 to i-1 do
          Dmat[a].wert[e]:=Cmat[a+1].wert[e];

          for a:=0 to dimen-1 do
          for e:=i+1 to dimen do
          Dmat[a].wert[e-1]:=Cmat[a+1].wert[e];


          hhh:=hhh*determinante(Dmat);
           end;

           zs:=zs+hhh;
         
          end;






          end
           else begin
          hhh:=Cmat[0].wert[0]*Cmat[1].wert[1]-Cmat[1].wert[0]*Cmat[0].wert[1];
          zs:=zs+hhh;
          end;


      determinante:=zs;    
           
    end;



procedure TForm1.Button10Click(Sender: TObject);
var F:textfile;
    i:integer;
begin
if savedialog2.Execute
then                                //Ergebnisse Speichern
begin
assignfile(F,savedialog2.FileName);
rewrite(F);
for i:=0 to memo1.Lines.Count-1 do
writeln(F,memo1.lines.strings[i]);
closefile(F);
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var i,e:integer;
    zeichenx,zeicheny,miny,maxy:extended;

begin                        //Grafik anzeigen
Px:=wertetabelle[0].x;
scalx:=780/(wertetabelle[wtlang-1].x-wertetabelle[0].x);

miny:=wertetabelle[0].y;
maxy:=wertetabelle[0].y;
for i:=0 to wtlang-1 do
begin
if miny>wertetabelle[i].y
then
miny:=wertetabelle[i].y;
if maxy<wertetabelle[i].y
then
maxy:=wertetabelle[i].y;
end;

Py:=miny;
scaly:=580/(maxy-miny);

Bild.Canvas.Brush.Color:=clwhite;
Bild.Canvas.fillrect(rect(0,0,800,600));



if memo1.Lines.count>1
then
begin
Bild.canvas.Pen.Color:=clred;
bild.canvas.MoveTo(round((wertetabelle[0].x-Px)*scalx)+5,595-round((wertetabelle[0].y-Py)*scaly));

for i:=0 to 790 do
begin
zeichenx:=i/scalx+Px;
e:=-1;
repeat
inc(e);
until ((zeichenx>=wertetabelle[e].x) and (zeichenx<wertetabelle[e+1].x)) or (e=wtlang-2);

zeicheny:=Ak[e]*(zeichenx-wertetabelle[e].x)*(zeichenx-wertetabelle[e].x)*(zeichenx-wertetabelle[e].x);
zeicheny:=zeicheny+Bk[e]*(zeichenx-wertetabelle[e].x)*(zeichenx-wertetabelle[e].x);
zeicheny:=zeicheny+Ck[e]*(zeichenx-wertetabelle[e].x)+Dk[e];

bild.Canvas.LineTo(round((zeichenx-Px)*scalx)+5,595-round((zeicheny-Py)*scaly));
end;

end;



for i:=0 to wtlang-1 do
begin
Bild.Canvas.Pixels[round((wertetabelle[i].x-Px)*scalx)+5,595-round((wertetabelle[i].y-Py)*scaly)]:=clblue;
Bild.Canvas.Pixels[round((wertetabelle[i].x-Px)*scalx)+4,595-round((wertetabelle[i].y-Py)*scaly)]:=clblue;
Bild.Canvas.Pixels[round((wertetabelle[i].x-Px)*scalx)+6,595-round((wertetabelle[i].y-Py)*scaly)]:=clblue;
Bild.Canvas.Pixels[round((wertetabelle[i].x-Px)*scalx)+5,594-round((wertetabelle[i].y-Py)*scaly)]:=clblue;
Bild.Canvas.Pixels[round((wertetabelle[i].x-Px)*scalx)+5,596-round((wertetabelle[i].y-Py)*scaly)]:=clblue;

end;


paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var posx,posy:extended;
begin
paintbox1.Canvas.Draw(0,0,bild);      //Bild erneuern

posx:=(X-5)/scalx+Px;
posy:=(595-Y)/scaly+Py;
Label6.Caption:='('+floattostr(posx)+'/'+floattostr(posy)+')';
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
paintbox1.Canvas.Draw(0,0,bild);      //Bild erneuern
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
paintbox1.Canvas.Draw(0,0,bild);       //Bild erneuern
end;

procedure TForm1.Neu1Click(Sender: TObject);
begin
Button11Click(Sender);
end;

procedure TForm1.Speichern1Click(Sender: TObject);
begin
Button7Click(sender);
end;

procedure TForm1.Beenden1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.WerteLaden1Click(Sender: TObject);
begin
Button8Click(Sender);
end;

procedure TForm1.ErgebnisseSpeichern1Click(Sender: TObject);
begin
Button10Click(Sender);
end;

procedure TForm1.Berechnen1Click(Sender: TObject);
begin
Button5Click(Sender);
end;

procedure TForm1.Anzeigen1Click(Sender: TObject);
begin
Button6Click(Sender);
end;

procedure TForm1.Speichern2Click(Sender: TObject);
begin
SavePictureDialog1.DefaultExt := GraphicExtension(Tbitmap);
SavePictureDialog1.Filter := GraphicFilter(TBitmap);
if SavePictureDialog1.Execute
then                                               //Grafik speichern
Bild.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.Hinzu1Click(Sender: TObject);
begin
Button1Click(Sender);
end;

procedure TForm1.Lschen1Click(Sender: TObject);
begin
Button2Click(Sender);
end;

procedure TForm1.Sortierenachx1Click(Sender: TObject);
begin
Button3Click(Sender);
end;

end.
