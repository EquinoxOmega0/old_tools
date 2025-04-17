unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Button10: TButton;
    Button11: TButton;
    Label6: TLabel;
    SpinEdit1: TSpinEdit;
    Label7: TLabel;
    SpinEdit2: TSpinEdit;
    Label8: TLabel;
    PaintBox1: TPaintBox;
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure interpoliere(von,bis:integer;pos:extended);
    procedure extrapoliere(von,bis:integer;pos:extended);
    function fakultaet(n:integer):integer;
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type T2dimdynarray=record
  dat:array of extended;
  end;

var
  Form1: TForm1;
  f:array of T2dimdynarray;
  rechenergebnis:extended;
  bild:Tbitmap;

implementation

{$R *.dfm}

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
Label1.Visible:=false;
Label2.Visible:=false;
Label3.Visible:=false;
edit2.Visible:=false;
edit3.Visible:=false;
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
Label1.Visible:=true;
Label2.Visible:=true;
Label3.Visible:=true;
edit2.Visible:=true;
edit3.Visible:=true;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
Close; //Beendet Programm
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
if savedialog1.Execute
then                                                  //Speichert Liste
listbox1.Items.SaveToFile(Savedialog1.filename);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
if opendialog1.Execute
then                              //Ladet Liste
begin
listbox1.Clear;
listbox1.Items.LoadFromFile(opendialog1.filename);
spinedit1.MaxValue:=listbox1.Items.Count;
spinedit2.MaxValue:=listbox1.Items.Count;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var zwischen:extended;
begin
if radiobutton3.checked=true
then                                  //Hinzufügen von Werten in die Liste
begin
listbox1.Items.Add(edit1.text);
edit1.Clear;
end
else
begin
if edit1.text=''
then
edit1.Text:='0';
if edit2.text=''
then
edit2.Text:='0';
if edit3.text=''
then
edit3.Text:='0';
if strtofloat(edit1.text)>0
then
zwischen:=strtofloat(edit1.Text)+strtofloat(edit2.text)/60+strtofloat(edit3.text)/3600
else
zwischen:=-(abs(strtofloat(edit1.Text))+strtofloat(edit2.text)/60+strtofloat(edit3.text)/3600);
if (strtofloat(edit2.text)<0)and (edit1.text='0')
then                                                      //Vorzeichenfehler vermeiden
zwischen:=zwischen-2*strtofloat(edit3.text)/3600;

listbox1.items.add(floattostr(zwischen));
edit1.Clear;
edit2.Clear;
edit3.Clear;
end;
spinedit1.MaxValue:=listbox1.Items.Count;
spinedit2.MaxValue:=listbox1.Items.Count;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,a:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true
then                           //Eintrag löschen
a:=i;
if a<>-1
then
begin
listbox1.Items.Delete(a);
spinedit1.MaxValue:=listbox1.Items.Count;
spinedit2.MaxValue:=listbox1.Items.Count;
end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var i,a:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true
then                           //Eintrag nach oben verschieben
a:=i;
if a>0
then
listbox1.Items.Exchange(a,a-1);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,a:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true
then                           //Eintrag nach unten verschieben
a:=i;
if a<listbox1.Items.count-1
then
listbox1.Items.Exchange(a,a+1);
end;

procedure TForm1.Button11Click(Sender: TObject);
var i,e:integer;
begin                                           //Sortieren: von kleiner nach größer
for i:=0 to listbox1.Items.count-1 do
for e:=0 to i do
if strtofloat(listbox1.Items.Strings[i])<strtofloat(listbox1.items.strings[e])
then
listbox1.items.exchange(i,e);
end;

procedure TForm1.Button10Click(Sender: TObject);
var i,e:integer;
begin                                           //Sortieren: von größer nach kleiner
for i:=0 to listbox1.Items.count-1 do
for e:=0 to i do
if strtofloat(listbox1.Items.Strings[i])>strtofloat(listbox1.items.strings[e])
then
listbox1.items.exchange(i,e);
end;

procedure TForm1.Button7Click(Sender: TObject);
var grad,min:integer;
    sek:extended;
begin                          //Berechnung starten
if radiobutton1.checked=true
then
interpoliere(spinedit1.Value,spinedit2.value,strtofloat(edit4.Text))
else
extrapoliere(spinedit1.Value,spinedit2.value,strtofloat(edit4.Text));

if radiobutton3.checked=true
then
label5.Caption:='Ergebnis: '+floattostr(rechenergebnis)   //Ergebnis anzeigen
else
begin
grad:=trunc(rechenergebnis);
min:=trunc((rechenergebnis-grad)*60);
sek:=(rechenergebnis-grad-min/60)*3600;
Label5.caption:='Ergebnis: '+inttostr(grad)+'° '+inttostr(abs(min))+'´ '+floattostr(abs(sek))+'"';
end;

end;

procedure TForm1.interpoliere(von,bis:integer;pos:extended);
var i,e:integer;
    kombi:array of extended;
begin
setlength(f,bis-von+1);                     //interpoliere
for i:=0 to bis-von do
setlength(f[i].dat,bis-von-i+1);         //Variablenfelder initieren


for i:=0 to bis-von do
f[0].dat[i]:=strtofloat(listbox1.Items.Strings[von+i-1]);

for i:=1 to bis-von do                       //Felder mit Eckne-Schema auffüllen
for e:=0 to bis-von-i do
f[i].dat[e]:=f[i-1].dat[e+1]-f[i-1].dat[e];

setlength(kombi,bis-von+2);
kombi[0]:=1;
for i:=0 to bis-von do                         //kobinatorik(halt so ähnlich) berechnen
kombi[i+1]:=kombi[i]*(pos-von-i);

rechenergebnis:=0;
for i:=0 to bis-von do            //aufsummieren
rechenergebnis:=rechenergebnis+kombi[i]*f[i].dat[0]/fakultaet(i);


end;

procedure TForm1.extrapoliere(von,bis:integer;pos:extended);
var i,e:integer;
    kombi:array of extended;
begin
setlength(f,bis-von+1);                     //extrapoliere
for i:=0 to bis-von do
setlength(f[i].dat,bis-von-i+1);         //Variablenfelder initieren


for i:=0 to bis-von do
f[0].dat[i]:=strtofloat(listbox1.Items.Strings[von+i-1]);

for i:=1 to bis-von do                       //Felder mit Eckne-Schema auffüllen
for e:=0 to bis-von-i do
f[i].dat[e]:=f[i-1].dat[e+1]-f[i-1].dat[e];

setlength(kombi,bis-von+2);
kombi[0]:=1;
for i:=0 to bis-von do                    //kobinatorik(halt so ähnlich) berechnen
kombi[i+1]:=kombi[i]*(pos-bis+i);

rechenergebnis:=0;
for i:=0 to bis-von do            //aufsummieren
rechenergebnis:=rechenergebnis+kombi[i]*f[i].dat[bis-von-i]/fakultaet(i);

end;



 function Tform1.fakultaet(n:integer):integer;
 var i,hilfe:longint;
 begin
 hilfe:=1;                   //Funktion für Fakultät
 for i:=1 to n do
 hilfe:=hilfe*i;
 fakultaet:=hilfe;
 end;




procedure TForm1.FormCreate(Sender: TObject);
begin
bild:=TBitmap.create;
bild.width:=600;           //Bild initialiesieren
bild.Height:=600;
bild.canvas.Brush.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,600,600));
paintbox1.canvas.Draw(0,0,bild);
rechenergebnis:=0;
end;

procedure TForm1.Button8Click(Sender: TObject);
var gross,klein,sx,sy,xmin:extended;
    i:integer;
begin               //Grafik anzeigen
gross:=strtofloat(listbox1.Items.Strings[0]);
klein:=strtofloat(listbox1.Items.Strings[0]);
for i:=1 to listbox1.Items.count-1 do
begin
if gross<strtofloat(listbox1.Items.Strings[i])
then                                               //suche größten und kleinesten Wert
gross:=strtofloat(listbox1.Items.Strings[i]);
if klein>strtofloat(listbox1.Items.Strings[i])
then
klein:=strtofloat(listbox1.Items.Strings[i]);
end;
xmin:=0;


if edit4.text<>''
then
begin

if strtofloat(edit4.text)<1
then
begin
sx:=590/(listbox1.Items.Count+strtofloat(edit4.text));
xmin:=strtofloat(edit4.text)-1;
end
else
if strtofloat(edit4.text)>(listbox1.items.Count-1)
then                                                        //Grenzen und Zoomfaktoren bestimmen
begin
sx:=590/(strtofloat(edit4.text)-1);
xmin:=0;
end
else
begin
xmin:=0;
sx:=590/(listbox1.Items.Count-1);
end;

if rechenergebnis>gross
then
gross:=rechenergebnis;

if rechenergebnis<klein
then
klein:=rechenergebnis;

end
else
sx:=590/(listbox1.Items.Count-1);

sy:=590/(gross-klein);

bild.canvas.Brush.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,600,600));

bild.canvas.pen.color:=clred;                          //Linie zeichnen
bild.canvas.MoveTo(round(5+(-xmin)*sx),round(595-(strtofloat(listbox1.Items.Strings[0])-klein)*sy));
for i:=1 to listbox1.items.count-1 do
bild.canvas.lineto(round(5+(i-xmin)*sx),round(595-(strtofloat(listbox1.Items.Strings[i])-klein)*sy));

bild.canvas.pen.color:=clblue;                                  //verwendetes Intervall zeichnen
bild.canvas.MoveTo(round(5+(spinedit1.Value-1-xmin)*sx),round(595-(strtofloat(listbox1.Items.Strings[(spinedit1.Value-1)])-klein)*sy));
for i:=spinedit1.Value-1 to spinedit2.value-1 do
bild.canvas.lineto(round(5+(i-xmin)*sx),round(595-(strtofloat(listbox1.Items.Strings[i])-klein)*sy));

bild.canvas.Brush.Color:=clblack;
bild.canvas.Pen.color:=clblack;                             //Datenpunkte zeichnen
for i:=0 to listbox1.items.count-1 do
bild.canvas.FillRect(rect(round(3+(i-xmin)*sx),round(593-(strtofloat(listbox1.Items.Strings[i])-klein)*sy),round(7+(i-xmin)*sx),round(597-(strtofloat(listbox1.Items.Strings[i])-klein)*sy)));

if edit4.text<>''
then
begin
bild.canvas.Brush.Color:=cllime;
bild.canvas.Pen.color:=cllime;                     //Ergebnis einzeichnen
bild.canvas.Ellipse(rect(round(3+(strtofloat(Edit4.text)-1-xmin)*sx),round(593-(rechenergebnis-klein)*sy),round(7+(strtofloat(Edit4.text)-1-xmin)*sx),round(597-(rechenergebnis-klein)*sy)));
end;


paintbox1.canvas.Draw(0,0,bild);
end;

end.
