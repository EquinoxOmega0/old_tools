unit glueh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, ExtDlgs, math;

type
  TForm7 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    ListBox1: TListBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    ListBox2: TListBox;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    ListBox3: TListBox;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    PaintBox1: TPaintBox;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    SpinEdit1: TSpinEdit;
    Label25: TLabel;
    Label26: TLabel;
    GroupBox4: TGroupBox;
    Panel32: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    procedure Panel17Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel1Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel32Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure neudata;
    procedure Panel13Click(Sender: TObject);
    procedure anzeigen;
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel18Click(Sender: TObject);
    procedure Panel19Click(Sender: TObject);
    procedure Panel20Click(Sender: TObject);
    procedure Panel21Click(Sender: TObject);
    procedure Panel22Click(Sender: TObject);
    procedure Panel23Click(Sender: TObject);
    procedure Panel24Click(Sender: TObject);
    procedure Panel25Click(Sender: TObject);
    procedure Panel26Click(Sender: TObject);
    procedure Panel29Click(Sender: TObject);
    procedure Panel28Click(Sender: TObject);
    procedure Panel27Click(Sender: TObject);
    procedure Panel30Click(Sender: TObject);
    procedure Panel31Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type messreihe=record
  Spannung,Strom:array of extended;
  counter:integer;           
  end;

  type rdata=record
  R:array of extended;
  sigma,mittel:extended;
  end;

  var
  Form7: TForm7;
  reihe,anderung:array[1..3] of messreihe;
  mwmw,mwsab,andmw,andsab:array[0..350] of extended;
  vollereihe,anderungreihe:array[1..3,0..350] of extended;
  bild:TBitmap;
  rglue,raglue:array[1..3] of rdata;
  rish,drish:array[1..3] of extended;
  Rim,Ris,drim,dris,relab:extended;

implementation

uses main;

{$R *.dfm}

procedure TForm7.Panel17Click(Sender: TObject);
begin
form7.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form7.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form7.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm7.Panel1Click(Sender: TObject);
begin
if (edit1.text<>'') and  (edit2.text<>'')
then
begin                                                                    //daten hinzu
listbox1.items.Add(edit1.Text+' - '+edit2.text);
inc(reihe[1].counter);
setlength(reihe[1].Spannung,reihe[1].counter);
setlength(reihe[1].Strom,reihe[1].counter);
reihe[1].Spannung[reihe[1].counter-1]:=strtofloat(edit1.text);
reihe[1].Strom[reihe[1].counter-1]:=strtofloat(edit2.text);
edit1.Text:='';
edit2.text:='';
end;
end;

procedure TForm7.Panel5Click(Sender: TObject);
begin
if (edit3.text<>'') and  (edit4.text<>'')
then
begin                                                                    //daten hinzu
listbox2.items.Add(edit3.Text+' - '+edit4.text);
inc(reihe[2].counter);
setlength(reihe[2].Spannung,reihe[2].counter);
setlength(reihe[2].Strom,reihe[2].counter);
reihe[2].Spannung[reihe[2].counter-1]:=strtofloat(edit3.text);
reihe[2].Strom[reihe[2].counter-1]:=strtofloat(edit4.text);
edit3.Text:='';
edit4.text:='';
end;
end;

procedure TForm7.Panel9Click(Sender: TObject);
begin
if (edit5.text<>'') and  (edit6.text<>'')
then
begin                                                                    //daten hinzu
listbox3.items.Add(edit5.Text+' - '+edit6.text);
inc(reihe[3].counter);
setlength(reihe[3].Spannung,reihe[3].counter);
setlength(reihe[3].Strom,reihe[3].counter);
reihe[3].Spannung[reihe[3].counter-1]:=strtofloat(edit5.text);
reihe[3].Strom[reihe[3].counter-1]:=strtofloat(edit6.text);
edit5.Text:='';
edit6.text:='';
end;
end;

procedure TForm7.Panel2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true                     //daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox1.Items.Delete(a);
for i:=a to reihe[1].counter-2  do
begin
reihe[1].Spannung[i]:=reihe[1].Spannung[i+1];
reihe[1].Strom[i]:=reihe[1].Strom[i+1];
end;
dec(reihe[1].counter);
setlength(reihe[1].Spannung,reihe[1].counter);
setlength(reihe[1].Strom,reihe[1].counter);
end;
end;

procedure TForm7.Panel6Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.items.count-1 do
if listbox2.Selected[i]=true                     //daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox2.Items.Delete(a);
for i:=a to reihe[2].counter-2  do
begin
reihe[2].Spannung[i]:=reihe[2].Spannung[i+1];
reihe[2].Strom[i]:=reihe[2].Strom[i+1];
end;
dec(reihe[2].counter);
setlength(reihe[2].Spannung,reihe[2].counter);
setlength(reihe[2].Strom,reihe[2].counter);
end;
end;

procedure TForm7.Panel10Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox3.items.count-1 do
if listbox3.Selected[i]=true                     //daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox3.Items.Delete(a);
for i:=a to reihe[3].counter-2  do
begin
reihe[3].Spannung[i]:=reihe[3].Spannung[i+1];
reihe[3].Strom[i]:=reihe[3].Strom[i+1];
end;
dec(reihe[3].counter);
setlength(reihe[3].Spannung,reihe[3].counter);
setlength(reihe[3].Strom,reihe[3].counter);
end;
end;

procedure TForm7.Panel3Click(Sender: TObject);
var hstrom,hspann:extended;
dex:integer;
begin

if (0<>listbox1.itemindex) and (listbox1.items.count>0)
then
begin                    //Hinauf
dex:=listbox1.itemindex;
listbox1.items.Exchange(dex,dex-1);
hstrom:=reihe[1].Strom[dex-1];
hspann:=reihe[1].Spannung[dex-1];
reihe[1].Strom[dex-1]:=reihe[1].Strom[dex];
reihe[1].Spannung[dex-1]:=reihe[1].Spannung[dex];
reihe[1].Strom[dex]:=hstrom;
reihe[1].Spannung[dex]:=hspann;
end;


end;

procedure TForm7.Panel7Click(Sender: TObject);
var hstrom,hspann:extended;
dex:integer;
begin

if (0<>listbox2.itemindex) and (listbox2.items.count>0)
then
begin                    //Hinauf
dex:=listbox2.itemindex;
listbox2.items.Exchange(dex,dex-1);
hstrom:=reihe[2].Strom[dex-1];
hspann:=reihe[2].Spannung[dex-1];
reihe[2].Strom[dex-1]:=reihe[2].Strom[dex];
reihe[2].Spannung[dex-1]:=reihe[2].Spannung[dex];
reihe[2].Strom[dex]:=hstrom;
reihe[2].Spannung[dex]:=hspann;
end;


end;
procedure TForm7.Panel11Click(Sender: TObject);
var hstrom,hspann:extended;
dex:integer;
begin

if (0<>listbox3.itemindex) and (listbox3.items.count>0)
then
begin                    //Hinauf
dex:=listbox3.itemindex;
listbox3.items.Exchange(dex,dex-1);
hstrom:=reihe[3].Strom[dex-1];
hspann:=reihe[3].Spannung[dex-1];
reihe[3].Strom[dex-1]:=reihe[3].Strom[dex];
reihe[3].Spannung[dex-1]:=reihe[3].Spannung[dex];
reihe[3].Strom[dex]:=hstrom;
reihe[3].Spannung[dex]:=hspann;
end;


end;

procedure TForm7.Panel4Click(Sender: TObject);
var hstrom,hspann:extended;
dex:integer;
begin

if (listbox1.Items.count-1<>listbox1.itemindex) and (listbox1.items.count>0)
then
begin
dex:=listbox1.itemindex;     //Abwärts
listbox1.items.Exchange(dex,dex+1);
hstrom:=reihe[1].Strom[dex+1];
hspann:=reihe[1].Spannung[dex+1];
reihe[1].Strom[dex+1]:=reihe[1].Strom[dex];
reihe[1].Spannung[dex+1]:=reihe[1].Spannung[dex];
reihe[1].Strom[dex]:=hstrom;
reihe[1].Spannung[dex]:=hspann;
end;
end;

procedure TForm7.Panel8Click(Sender: TObject);
var hstrom,hspann:extended;
dex:integer;
begin

if (listbox2.Items.count-1<>listbox2.itemindex) and (listbox2.items.count>0)
then
begin
dex:=listbox2.itemindex;     //Abwärts
listbox2.items.Exchange(dex,dex+1);
hstrom:=reihe[2].Strom[dex+1];
hspann:=reihe[2].Spannung[dex+1];
reihe[2].Strom[dex+1]:=reihe[2].Strom[dex];
reihe[2].Spannung[dex+1]:=reihe[2].Spannung[dex];
reihe[2].Strom[dex]:=hstrom;
reihe[2].Spannung[dex]:=hspann;
end;
end;
procedure TForm7.Panel12Click(Sender: TObject);
var hstrom,hspann:extended;
dex:integer;
begin

if (listbox3.Items.count-1<>listbox3.itemindex) and (listbox3.items.count>0)
then
begin
dex:=listbox3.itemindex;     //Abwärts
listbox3.items.Exchange(dex,dex+1);
hstrom:=reihe[3].Strom[dex+1];
hspann:=reihe[3].Spannung[dex+1];
reihe[3].Strom[dex+1]:=reihe[3].Strom[dex];
reihe[3].Spannung[dex+1]:=reihe[3].Spannung[dex];
reihe[3].Strom[dex]:=hstrom;
reihe[3].Spannung[dex]:=hspann;
end;
end;

procedure TForm7.Panel32Click(Sender: TObject);
var i,e,a,u,eff:integer;
   k:extended;
begin                             //Berechnung

for i:=1 to 3 do
begin

setlength(anderung[i].strom,reihe[i].counter-1);
setlength(anderung[i].spannung,reihe[i].counter-1);
for e:=0 to reihe[i].counter-2 do
begin
anderung[i].strom[e]:=(reihe[i].Strom[e+1]-reihe[i].strom[e]);
anderung[i].Spannung[e]:=(reihe[i].Spannung[e+1]-reihe[i].Spannung[e]);
end;




for e:=0 to 349 do
if reihe[i].spannung[0]>e+1
then                            //für Spannungen kleiner als Messwerte   Null setzen
vollereihe[i,e]:=0
else
begin
u:=0;
for a:=0 to reihe[i].counter-2 do
if reihe[i].Spannung[a]*100<e+1
then
begin
u:=a;
end;

                                       //Ströme für alle Spannungen extrapolieren

k:=(reihe[i].Strom[u+1]-reihe[i].strom[u])/(reihe[i].Spannung[u+1]*100-reihe[i].Spannung[u]*100);

vollereihe[i,e]:=reihe[i].Strom[u]+k*(e+1-reihe[i].Spannung[u]*100);





end;

for e:=0 to 348 do
anderungreihe[i,e]:=1/(vollereihe[i,e+1]-vollereihe[i,e]);

setlength(rglue[i].R,reihe[i].counter);
setlength(raglue[i].R,reihe[i].counter-1);

rglue[i].mittel:=0;
rglue[i].sigma:=0;

for e:=0 to reihe[i].counter-1 do
begin
rglue[i].R[e]:=reihe[i].spannung[e]/reihe[i].strom[e];

rglue[i].mittel:=rglue[i].mittel+rglue[i].R[e];
end;                                                     //Widerstand für Messreihen berechnen
rglue[i].mittel:=rglue[i].mittel/reihe[i].counter;

for e:=0 to reihe[i].counter-1 do
rglue[i].sigma:=rglue[i].sigma+sqr(rglue[i].R[e]-rglue[i].mittel);

rish[i]:=rglue[i].sigma;

rglue[i].sigma:=rglue[i].sigma/(reihe[i].counter-1);
rglue[i].sigma:=sqrt(rglue[i].sigma);




setlength(raglue[i].R,reihe[i].counter-1);

raglue[i].mittel:=0;
raglue[i].sigma:=0;


for e:=0 to reihe[i].counter-2 do
begin
raglue[i].R[e]:=anderung[i].spannung[e]/anderung[i].strom[e];

raglue[i].mittel:=raglue[i].mittel+raglue[i].R[e];
end;                                                     //Widerstandsänderung für Messreihen berechnen
raglue[i].mittel:=raglue[i].mittel/(reihe[i].counter-1);

for e:=0 to reihe[i].counter-2 do
raglue[i].sigma:=raglue[i].sigma+sqr(raglue[i].R[e]-raglue[i].mittel);

drish[i]:=raglue[i].sigma;

raglue[i].sigma:=raglue[i].sigma/(reihe[i].counter-2);
raglue[i].sigma:=sqrt(raglue[i].sigma);


end;


Rim:=(rglue[1].mittel+rglue[2].mittel+rglue[3].mittel)/3;      //Widerstand für gesammten Versuch berechnen
Ris:=rish[1]+rish[2]+rish[3];
ris:=ris/(reihe[1].counter+reihe[2].counter+reihe[3].counter-1);
ris:=sqrt(ris);
             
dRim:=(raglue[1].mittel+raglue[2].mittel+raglue[3].mittel)/3;      //Widerstand für gesammten Versuch berechnen
dRis:=drish[1]+drish[2]+drish[3];
dris:=dris/(reihe[1].counter+reihe[2].counter+reihe[3].counter-4);
dris:=sqrt(dris);

relab:=0;

eff:=0;

                      
for e:=0 to 349 do
begin
mwmw[e]:=(vollereihe[1,e]+vollereihe[2,e]+vollereihe[3,e])/3;              //abweichung der Messreihen zueinander
mwsab[e]:=sqr(mwmw[e]-vollereihe[1,e])+sqr(mwmw[e]-vollereihe[2,e])+sqr(mwmw[e]-vollereihe[3,e]);
mwsab[e]:=mwsab[e]/2;
mwsab[e]:=sqrt(mwsab[e]);

andmw[e]:=(anderungreihe[1,e]+anderungreihe[2,e]+anderungreihe[3,e])/3;              //abweichung der Messreihen zueinander
andsab[e]:=sqr(andmw[e]-anderungreihe[1,e])+sqr(andmw[e]-anderungreihe[2,e])+sqr(andmw[e]-anderungreihe[3,e]);
andsab[e]:=andsab[e]/2;
andsab[e]:=sqrt(andsab[e]);

if mwmw[e]<>0
then
begin
relab:=relab+(mwsab[e]/mwmw[e]);
inc(eff);
end;



end;


if eff<>1
then
relab:=(relab/(eff-1));
relab:=relab*100;

Anzeigen;

end;

procedure TForm7.Panel15Click(Sender: TObject);
var F:textfile;
    i,e:integer;                   //Speichern von Daten
begin
if Savedialog1.Execute
then
begin
assignfile(F,savedialog1.FileName);
rewrite(F);

for i:=1 to 3 do
begin
writeln(F,inttostr(reihe[i].counter));
for e:=0 to reihe[i].counter-1 do
begin
writeln(F,floattostr(reihe[i].Spannung[e]));
writeln(F,floattostr(reihe[i].Strom[e]));
end;
end;


closefile(F);
end;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
bild:=Tbitmap.create;
bild.Height:=400;
bild.width:=350;
bild.canvas.Brush.Color:=clwhite;
bild.canvas.fillrect(rect(0,0,350,400));

end;

procedure TForm7.Panel16Click(Sender: TObject);
begin
SavePictureDialog1.DefaultExt := GraphicExtension(Tbitmap);
SavePictureDialog1.Filter := GraphicFilter(TBitmap);
if SavePictureDialog1.Execute
then                                                  //Bild speichern
begin
bild.SaveToFile(SavePictureDialog1.FileName);
end;
end;

procedure TForm7.Panel14Click(Sender: TObject);
var F:textfile;
    i,e:integer;
    s:string;             //Öffnen von Daten
begin
if Opendialog1.Execute
then
begin
neudata;
assignfile(F,opendialog1.FileName);
reset(F);

for i:=1 to 3 do
begin
readln(F,s);
reihe[i].counter:=strtoint(s);
setlength(reihe[i].spannung,reihe[i].counter);
setlength(reihe[i].strom,reihe[i].counter);
for e:=0 to reihe[i].counter-1 do
begin
readln(F,s);
reihe[i].Spannung[e]:=strtofloat(s);
readln(F,s);
reihe[i].Strom[e]:=strtofloat(s);


end;

end;

closefile(F);

for e:=0 to reihe[1].counter-1 do
listbox1.items.Add(floattostr(reihe[1].Spannung[e])+' - '+floattostr(reihe[1].Strom[e]));

for e:=0 to reihe[2].counter-1 do
listbox2.items.Add(floattostr(reihe[2].Spannung[e])+' - '+floattostr(reihe[2].Strom[e]));

for e:=0 to reihe[3].counter-1 do
listbox3.items.Add(floattostr(reihe[3].Spannung[e])+' - '+floattostr(reihe[3].Strom[e]));


end;

end;



procedure Tform7.neudata;
var i:integer;
begin        //daten zurücksetzen
listbox1.Clear;
listbox2.clear;
listbox3.clear;
spinedit1.value:=10;

for i:=1 to 3 do
begin
reihe[i].counter:=0;
setlength(reihe[i].spannung,0);
setlength(reihe[i].spannung,0);
end;

 bild.canvas.Brush.Color:=clwhite;
 bild.canvas.FillRect(rect(0,0,500,300));

end;

procedure TForm7.Panel13Click(Sender: TObject);
begin
neudata;           //Neu
end;


procedure Tform7.anzeigen;
begin      //ergebnisse Anzeigen

Label6.Caption:='('+floattostr(roundto(rglue[1].mittel,-4))+' +- '+floattostr(roundto(rglue[1].sigma,-4))+') Ohm';
label8.caption:='('+floattostr(roundto(raglue[1].mittel,-4))+' +- '+floattostr(roundto(raglue[1].sigma,-4))+') Ohm/V';

Label14.Caption:='('+floattostr(roundto(rglue[2].mittel,-4))+' +- '+floattostr(roundto(rglue[2].sigma,-4))+') Ohm';
label16.caption:='('+floattostr(roundto(raglue[2].mittel,-4))+' +- '+floattostr(roundto(raglue[2].sigma,-4))+') Ohm/V';

Label22.Caption:='('+floattostr(roundto(rglue[3].mittel,-4))+' +- '+floattostr(roundto(rglue[3].sigma,-4))+') Ohm';
label24.caption:='('+floattostr(roundto(raglue[3].mittel,-4))+' +- '+floattostr(roundto(raglue[3].sigma,-4))+') Ohm/V';

Label27.Caption:='relaltive Standardabweichung: '+floattostr(roundto(relab,-4))+'%';;
label28.caption:='durchschn. Widerstand der Glühbirne: ('+floattostr(roundto(rim,-4))+' +- '+floattostr(roundto(ris,-4))+') Ohm';
Label29.Caption:='durchschn. Änderung des Widerstands: ('+floattostr(roundto(drim,-4))+' +- '+floattostr(roundto(dris,-4))+') Ohm/V';


end;

procedure TForm7.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
paintbox1.Canvas.draw(0,0,bild);           //Graph anzeigen
end;

procedure TForm7.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
paintbox1.Canvas.draw(0,0,bild);           //Graph anzeigen
end;

procedure TForm7.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
paintbox1.Canvas.draw(0,0,bild);           //Graph anzeigen
end;

procedure TForm7.Panel18Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Messreihe 1
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[1].counter-1 do
bild.canvas.LineTo(round(reihe[1].Spannung[i]*100),400-round(reihe[1].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel19Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Messreihe 1
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[2].counter-1 do
bild.canvas.LineTo(round(reihe[2].Spannung[i]*100),400-round(reihe[2].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel20Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Messreihe 1
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[3].counter-1 do
bild.canvas.LineTo(round(reihe[3].Spannung[i]*100),400-round(reihe[3].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel21Click(Sender: TObject);
var i:integer;
begin
                                             //Graph alle 3
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[1].counter-1 do
bild.canvas.LineTo(round(reihe[1].Spannung[i]*100),400-round(reihe[1].Strom[i]*100));

bild.Canvas.Pen.Color:=cllime;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[2].counter-1 do
bild.canvas.LineTo(round(reihe[2].Spannung[i]*100),400-round(reihe[2].Strom[i]*100));

bild.Canvas.Pen.Color:=clblue;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[3].counter-1 do
bild.canvas.LineTo(round(reihe[3].Spannung[i]*100),400-round(reihe[3].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel22Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Mittlere Kurve
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to 349 do
bild.canvas.LineTo(round(i),400-round(mwmw[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel23Click(Sender: TObject);
var i:integer;
begin
                                             //Graph dick
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);


for i:=0 to 349 do
begin
if mwsab[i]<1
then
bild.Canvas.pen.width:=round(mwsab[i]*200)
else
bild.Canvas.pen.width:=1;
bild.canvas.LineTo(round(i),400-round(mwmw[i]*100));
end;

bild.Canvas.pen.width:=1;

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel24Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Änderung 1
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[1].counter-2 do
if anderung[1].strom[i]<>0
then
bild.canvas.LineTo(round(reihe[1].spannung[i]*100),400-round(anderung[1].spannung[i]/anderung[1].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel25Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Änderung 2
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[2].counter-2 do
if anderung[2].strom[i]<>0
then
bild.canvas.LineTo(round(reihe[2].spannung[i]*100),400-round(anderung[2].spannung[i]/anderung[2].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel26Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Änderung 1
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[3].counter-2 do
if anderung[3].strom[i]<>0
then
bild.canvas.LineTo(round(reihe[3].spannung[i]*100),400-round(anderung[3].spannung[i]/anderung[3].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel29Click(Sender: TObject);
var i:integer;
begin
                                             //Graph alle 3 Änderungen
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[1].counter-2 do
if anderung[1].strom[i]<>0
then
bild.canvas.LineTo(round(reihe[1].spannung[i]*100),400-round(anderung[1].spannung[i]/anderung[1].Strom[i]*100));

bild.Canvas.Pen.Color:=cllime;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[2].counter-2 do
if anderung[2].strom[i]<>0
then
bild.canvas.LineTo(round(reihe[2].spannung[i]*100),400-round(anderung[2].spannung[i]/anderung[2].Strom[i]*100));


bild.Canvas.Pen.Color:=clblue;
bild.canvas.MoveTo(0,400);

for i:=0 to reihe[3].counter-2 do
if anderung[3].strom[i]<>0
then
bild.canvas.LineTo(round(reihe[3].spannung[i]*100),400-round(anderung[3].spannung[i]/anderung[3].Strom[i]*100));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel28Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Mittlere Änderung
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to 349 do
bild.canvas.LineTo(round(i),400-round(andmw[i]));

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel27Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Mittlere Änderung
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to 349 do
begin
bild.canvas.LineTo(round(i),400-round(andmw[i]));
bild.canvas.LineTo(round(i),400-round(andmw[i]+andsab[i]));
bild.canvas.LineTo(round(i),400-round(andmw[i]-andsab[i]));
bild.canvas.moveto(round(i),400-round(andmw[i]));
end;

Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel30Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Mittlere Änderung
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to 349 do
bild.canvas.LineTo(round(i),400-round(andmw[i]));

bild.Canvas.Pen.Color:=clblue;

for i:=0 to trunc(349/spinedit1.Value) do
begin
bild.canvas.MoveTo(i*spinedit1.Value,round(400-(andmw[i*spinedit1.Value]-andsab[i*spinedit1.Value])));
bild.canvas.LineTo(i*spinedit1.Value,round(400-(andmw[i*spinedit1.Value]+andsab[i*spinedit1.Value])));
end;


Paintbox1.Canvas.Draw(0,0,bild);
end;

procedure TForm7.Panel31Click(Sender: TObject);
var i:integer;
begin
                                             //Graph Mittlere Kurve
bild.canvas.Brush.Color:=clwhite;
bild.canvas.FillRect(rect(0,0,350,400));

bild.canvas.Pen.color:=clblack;
bild.canvas.moveto(0,300);
bild.canvas.lineto(5,300);
bild.canvas.moveto(0,200);
bild.canvas.lineto(5,200);
bild.canvas.moveto(100,400);
bild.canvas.lineto(100,395);
bild.canvas.moveto(200,400);
bild.canvas.lineto(200,395);

bild.Canvas.Pen.Color:=clred;
bild.canvas.MoveTo(0,400);

for i:=0 to 349 do
bild.canvas.LineTo(round(i),400-round(mwmw[i]*100));

bild.Canvas.Pen.Color:=clblue;

for i:=0 to trunc(349/spinedit1.Value) do
begin
bild.canvas.MoveTo(i*spinedit1.Value,round(400-(mwmw[i*spinedit1.Value]-mwsab[i*spinedit1.Value])*100));
bild.canvas.LineTo(i*spinedit1.Value,round(400-(mwmw[i*spinedit1.Value]+mwsab[i*spinedit1.Value])*100));
end;

Paintbox1.Canvas.Draw(0,0,bild);
end;

end.
