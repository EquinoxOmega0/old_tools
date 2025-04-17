unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, turtle, math, StdCtrls, Spin, ExtDlgs, grafik, printers;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label8: TLabel;
    Panel9: TPanel;
    CheckBox2: TCheckBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    GroupBox3: TGroupBox;
    ListBox3: TListBox;
    Panel10: TPanel;
    Shape1: TShape;
    Label9: TLabel;
    ColorDialog1: TColorDialog;
    CheckBox3: TCheckBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure zeichnen(x,y:extended;count,next:integer);
    procedure startrechen;
    procedure Panel5Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure druckereinstellen;
    procedure drucken;
    procedure bildspeichern;
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
  private
  { Private declarations }
  public
    { Public declarations }
  end;


  type Tweg=record
  d:array of boolean;
  end;


var
  Form1: TForm1;
  T:Tturtle;
  winkel,distanz:array of extended;
  dim:integer;
  weg:array of Tweg;
  wegcount:integer;
  zoom,mx,my:extended;
  editdat:integer;



implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
T:=TTurtle.create;
t.init(Form1);                            //initialisierung
t.setimage(paintbox1.width,paintbox1.height);
paintbox1.Canvas.Draw(0,0,t.pic);
editdat:=-1;
mx:=300;
my:=300;

end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
zoom:=strtofloat(edit3.text);
if checkbox1.checked=true
then
begin                    //Mittelpunkt neu setzen
spinedit2.Value:=spinedit2.Value+round((300-x)/zoom);
spinedit3.Value:=spinedit3.Value+round((300-y)/zoom);
startrechen;
end;
label8.caption:='Position der Maus: ('+floattostr(roundto((x-300)/zoom,-4))+'/'+floattostr(roundto((y-300)/zoom,-4))+')';  //Mauspos
paintbox1.Canvas.Draw(0,0,t.pic);
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
zoom:=strtofloat(edit3.text);
label8.caption:='Position der Maus: ('+floattostr(roundto((x-300)/zoom,-4))+'/'+floattostr(roundto((y-300)/zoom,-4))+')';    //mauspos
paintbox1.Canvas.Draw(0,0,t.pic);
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
zoom:=strtofloat(edit3.text);
label8.caption:='Position der Maus: ('+floattostr(roundto((x-300)/zoom,-4))+'/'+floattostr(roundto((y-300)/zoom,-4))+')'; //mauspos
paintbox1.Canvas.Draw(0,0,t.pic);
end;


    procedure Tform1.zeichnen(x,y:extended;count,next:integer);
    var i,u,noway:integer;
        posx,posy:extended;
        newway:boolean;
    begin            //rekursion
    t.jumpcoord(x,y);

    if checkbox3.checked=true
    then
    begin
    if next<listbox3.Items.Count
    then
    t.setcolor(strtoint('$'+listbox3.Items.Strings[next]))
    else
    t.setcolor(shape1.Brush.color);
    end
    else
    t.setcolor(clBlack);

    t.setcourse(winkel[next]);
    t.draw(distanz[next]*zoom);
    posx:=t.x;
    posy:=t.y;
    weg[count].d[next]:=true;
    newway:=true;
    for i:=0 to wegcount-1 do
    begin
    noway:=0;
    for u:=0 to dim-1 do
    if (weg[count].d[u]=weg[i].d[u]) and (count<>i)
    then
    inc(noway);
    if noway=dim
    then
    newway:=false;
    end;

    for i:=0 to dim-1 do
    if (weg[count].d[i]=false) and (newway=true)
    then
    begin
    inc(wegcount);
    setlength(weg,wegcount);
    setlength(weg[wegcount-1].d,dim);
    for u:=0 to dim-1 do
    weg[wegcount-1].d[u]:=weg[count].d[u];
    zeichnen(posx,posy,wegcount-1,i);
    end;

    end;

    procedure Tform1.startrechen;
 var e,a:integer;
begin               //Berechnen
t.clear;

dim:=spinedit1.value;

wegcount:=dim;

setlength(winkel,dim);
setlength(distanz,dim);               //Ausgangswerte setzen
setlength(weg,dim);

for e:=0 to dim-1 do
setlength(weg[e].d,dim);

for a:=0 to dim-1 do
for e:=0 to dim-1 do
begin
weg[a].d[e]:=false;
end;

winkel[0]:=180;
distanz[0]:=50;

winkel[1]:=90;
distanz[1]:=50;

if dim>2
then
begin
winkel[2]:=45;
distanz[2]:=25;
end;
                                      //Vektoren berechnen
if dim>3
then
begin
winkel[3]:=150;
distanz[3]:=18;
end;


if dim>4
then
for e:=4 to dim-1 do
begin
winkel[e]:= (e * 52) + 45;
distanz[e]:= (e mod 30)+15;
end;

if checkbox2.checked=true
then                               //eigene Vektoren verwenden
begin
if listbox1.Items.count<dim
then
begin
for e:=0 to listbox1.items.count-1 do
begin
winkel[e]:=strtofloat(listbox1.Items.Strings[e]);
distanz[e]:=strtofloat(listbox2.Items.strings[e]);
end;
end
else
begin
for e:=0 to dim-1 do
begin
winkel[e]:=strtofloat(listbox1.Items.Strings[e]);
distanz[e]:=strtofloat(listbox2.Items.strings[e]);
end;
end;
end;


for e:=0 to dim-1 do
zeichnen(spinedit2.value*zoom+mx,spinedit3.value*zoom+my,e,e);
                                 //rekursion starten und bild zeichnen

paintbox1.Canvas.Draw(0,0,t.pic);
    end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
zoom:=strtofloat(edit3.text);
startrechen;         
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
close;            //Beenden
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
if (edit1.text<>'') and (edit2.text<>'')
then
begin
listbox1.Items.Add(edit1.text);
listbox2.Items.add(edit2.text);          //hinzu
edit1.Text:='';
edit2.Text:='';
end;
editdat:=-1;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.Items.Count-1 do
if listbox1.Selected[i]=true
then                            //gleiche Auswahl in beiden listen
a:=i;
if a<>-1
then
listbox2.Selected[a]:=true;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.Items.Count-1 do
if listbox2.Selected[i]=true
then
a:=i;
if a<>-1                            //gleiche Auswahl in beiden listen
then
listbox1.Selected[a]:=true;
end;

procedure TForm1.Panel3Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.Items.Count-1 do
if listbox1.Selected[i]=true
then
a:=i;
                            //löschen
if a<>-1
then
begin
listbox1.Items.Delete(a);
listbox2.Items.Delete(a);

end;
editdat:=-1;
end;

procedure TForm1.Panel4Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;               //start ändern
for i:=0 to listbox1.Items.Count-1 do
if listbox1.Selected[i]=true
then
a:=i;
editdat:=a;
end;

procedure TForm1.Panel9Click(Sender: TObject);
begin
if (editdat<>-1) and (edit1.text<>'') and (edit2.text<>'')
then
begin                         //ok ändern
listbox1.Items.Strings[editdat]:=edit1.text;
listbox2.items.strings[editdat]:=edit2.Text;
edit1.Text:='';
edit2.text:='';
end;
editdat:=-1;

end;

procedure TForm1.Panel7Click(Sender: TObject);
var F:textfile;
    i:integer;
begin        //Speichern
if savedialog1.Execute
then
begin
assignfile(F,savedialog1.FileName);
rewrite(F);
writeln(F,inttostr(spinedit1.value));
writeln(F,inttostr(spinedit2.value));
writeln(F,inttostr(spinedit3.value));
writeln(F,edit3.text);
if checkbox1.checked=true
then
writeln(F,'1')
else
writeln(F,'0');
writeln(F,inttostr(listbox1.Items.Count));
for i:=0 to listbox1.Items.Count-1 do
begin
writeln(F,listbox1.items.strings[i]);
writeln(F,listbox2.items.strings[i]);
end;
if checkbox2.checked=true
then
writeln(F,'1')
else
writeln(F,'0');
if checkbox3.checked=true
then
writeln(F,'1')
else
writeln(F,'0');
writeln(F,inttostr(shape1.brush.color));
writeln(F,inttostr(listbox3.Items.Count));
for i:=0 to listbox3.Items.Count-1 do
writeln(F,listbox1.items.strings[i]);
closefile(F);
end;
end;

procedure TForm1.Panel8Click(Sender: TObject);
var F:textfile;
    i,cc:integer;
    s:string;
begin             //laden
if opendialog1.Execute
then
begin
T.clear;
assignfile(F,opendialog1.FileName);
reset(F);
readln(F,s);
spinedit1.Value:=strtoint(s);
readln(F,s);
spinedit2.Value:=strtoint(s);
readln(F,s);
spinedit3.Value:=strtoint(s);
readln(F,s);
edit3.text:=s;
readln(F,s);
if s='1'
then
checkbox1.Checked:=true
else
checkbox1.checked:=false;
listbox1.Clear;
listbox2.Clear;
edit1.clear;
edit2.clear;
readln(F,s);
cc:=strtoint(s);
if cc<>0
then
for i:=0 to cc-1 do
begin
readln(s);
listbox1.Items.Add(s);
readln(s);
listbox2.Items.Add(s);
end;
readln(F,s);
if s='1'
then
checkbox2.Checked:=true
else
checkbox2.checked:=false;

readln(F,s);
if s='1'
then
checkbox3.Checked:=true
else
checkbox3.checked:=false;

readln(F,s);
shape1.Brush.Color:=strtoint(s);
readln(F,s);
cc:=strtoint(s);
if cc<>0
then
for i:=0 to cc-1 do
begin
readln(s);
listbox3.Items.Add(s);
end;
closefile(F);
end;
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
form2.Visible:=true; //Grafik verwenden öffnen
end;


  procedure TForm1.druckereinstellen;
  begin
PrinterSetupDialog1.Execute; //Druckereinstellungen öffnen
end;

    procedure TForm1.drucken;
var
  AspectRatio: Extended;            //Drucken

  begin
    if form2.radiobutton1.checked=True
  then
  begin
  if not PrintDialog1.Execute then Exit;
  Printer.BeginDoc;
  try                             //optimiert Drucken
  AspectRatio:=Printer.pagewidth/600;
  zoom:=zoom*AspectRatio;
  mx:=300*AspectRatio;
  my:=300*AspectRatio;
  T.setimage(Printer.pagewidth,Printer.pageheight);
  T.clear;
  startrechen;
  mx:=300;
    my:=300;
   Printer.Canvas.Draw(0,0,T.pic);
  T.setimage(Paintbox1.width,Paintbox1.height);
   T.clear;
  finally
    Printer.EndDoc;
  end;
  end
  else if form2.RadioButton2.checked=true
  then
  begin
  if not PrintDialog1.Execute then Exit;
  Printer.BeginDoc;
  try                             //persönliche Einstellungen
  zoom:=strtofloat(form2.Edit1.Text);
  mx:=form2.spinedit1.value/2;
  my:=form2.SpinEdit2.Value/2;
  T.setimage(form2.spinedit1.value,form2.spinedit2.value);
  T.clear;
  startrechen;
  mx:=300;
  my:=300;
   Printer.Canvas.Draw(round((Printer.pagewidth-form2.spinedit1.value)/2),round((Printer.pageheight-form2.spinedit2.value)/2),T.pic);
  T.setimage(Paintbox1.width,Paintbox1.height);
   T.clear;
  finally
    Printer.EndDoc;
  end;
    end
  else
  begin
  if not PrintDialog1.Execute then Exit;
  Printer.BeginDoc;
  try                             //aktuelles Bild drucken
  zoom:=strtofloat(form1.Edit3.Text);
  T.clear;
  startrechen;
   Printer.Canvas.Draw(round((Printer.pagewidth-600)/2),round((Printer.pageheight-600)/2),T.pic);
   T.clear;
  finally
    Printer.EndDoc;
  end;

  end;


end;

    procedure Tform1.bildspeichern;
    var kleiner:extended;
    begin       //Bild abspeichern
    SavePictureDialog1.DefaultExt := GraphicExtension(Tbitmap);
SavePictureDialog1.Filter := GraphicFilter(TBitmap);
    if form2.RadioButton4.checked=true
    then             //einfach speichern
    begin

    if savepicturedialog1.Execute
    then
    begin
zoom:=strtofloat(edit3.text);
startrechen;
T.pic.SaveToFile(savepicturedialog1.filename);
    end;
    end
    else
    begin
  if savepicturedialog1.Execute
    then
    begin           //Einstellung anpassen
    if form2.SpinEdit3.value<form2.SpinEdit4.value
    then
    kleiner:=form2.SpinEdit3.Value
    else
    kleiner:=form2.SpinEdit4.Value;
    
  zoom:=zoom*kleiner/600;
  
  mx:=form2.spinedit3.value/2;
  my:=form2.spinedit4.value/2;
  T.setimage(form2.spinedit3.value,form2.spinedit4.value);
  T.clear;
  startrechen;
  T.pic.SaveToFile(savepicturedialog1.filename);
  mx:=300;
  my:=300;
  T.setimage(Paintbox1.width,Paintbox1.height);
   T.clear;

   end;
    end;

    end;

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
colordialog1.Color:=shape1.Brush.Color;
if colordialog1.Execute
then                                           //Standardfarbe
shape1.Brush.Color:=colordialog1.Color;
end;

procedure TForm1.Panel10Click(Sender: TObject);
begin
colordialog1.Color:=clBlack;
if colordialog1.Execute                           //Farbe hinzu
then
listbox3.Items.Add(inttohex(colordialog1.Color,6));

end;

procedure TForm1.Panel11Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox3.Items.Count-1 do
if listbox3.Selected[i]=true
then
a:=i;
                            //Farbe löschen
if a<>-1
then
begin
listbox3.Items.Delete(a);
end;

end;

procedure TForm1.Panel12Click(Sender: TObject);
var dex:integer;
begin
if (0<>listbox3.itemindex) and (listbox3.items.count>0)
then
begin                    //Hinauf
dex:=listbox3.itemindex;
listbox3.items.Exchange(dex,dex-1);
end;

end;

procedure TForm1.Panel13Click(Sender: TObject);
var dex:integer;
begin

if (listbox3.Items.count-1<>listbox3.itemindex) and (listbox3.items.count>0)
then
begin
dex:=listbox3.itemindex;     //Abwärts
listbox3.items.Exchange(dex,dex+1);
end;
end;

end.
