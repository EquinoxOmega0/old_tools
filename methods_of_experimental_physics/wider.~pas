unit wider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, math;

type
  TForm8 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox1: TListBox;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    ListBox2: TListBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    ListBox3: TListBox;
    GroupBox4: TGroupBox;
    Label16: TLabel;
    Edit7: TEdit;
    Label17: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    ListBox4: TListBox;
    Label18: TLabel;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit8: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    ListBox5: TListBox;
    GroupBox6: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit9: TEdit;
    Panel11: TPanel;
    Panel12: TPanel;
    ListBox6: TListBox;
    GroupBox7: TGroupBox;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    GroupBox8: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel17Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure loeschen;
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel16Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Anzeigen;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type datensatz=record
  Rspannung,Rstrom,Messstrom:array[0..2,0..4] of extended;
  Unetz,Ubatt:extended;
  end;

var
  Form8: TForm8;
  messdat:datensatz;
  mstrom,sstrom,mr,sr,rechenIm,rechenIs,absabw,relabw:array[0..2] of extended;

implementation

uses main;

{$R *.dfm}

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form8.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form8.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm8.Panel17Click(Sender: TObject);
begin
form8.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm8.Panel13Click(Sender: TObject);
begin
 loeschen; //Neu
end;


procedure Tform8.loeschen;
var i,e:integer;
begin                  //Felder löschen
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
edit5.Text:='';
edit6.Text:='';
edit7.Text:='';
edit8.Text:='';
edit9.Text:='';
edit10.text:='';
edit11.Text:='';

listbox1.Clear;
listbox2.Clear;
listbox3.Clear;
listbox4.Clear;
listbox5.Clear;
listbox6.Clear;

for i:=0 to 2 do
for e:=0 to 4 do
begin
messdat.Rspannung[i,e]:=-1;
messdat.Rstrom[i,e]:=-1;
messdat.Messstrom[i,e]:=-1;
end;
messdat.Unetz:=-1;
messdat.Ubatt:=-1;


end;


procedure TForm8.Panel1Click(Sender: TObject);
begin
if (edit1.text<>'') and  (edit2.text<>'') and (listbox1.Items.Count<5)
then
begin                                                                    //daten  für R hinzu
listbox1.items.Add(edit1.Text+' - '+edit2.text);
messdat.Rspannung[0,listbox1.Items.Count-1]:=strtofloat(edit1.text);
messdat.Rstrom[0,listbox1.Items.Count-1]:=strtofloat(edit2.text);
edit1.Text:='';
edit2.text:='';
end;
end;

procedure TForm8.FormCreate(Sender: TObject);
var i,e:integer;
begin
for i:=0 to 2 do                  //Einstellung auf Starwerte setzen
for e:=0 to 4 do
begin
messdat.Rspannung[i,e]:=-1;
messdat.Rstrom[i,e]:=-1;
messdat.Messstrom[i,e]:=-1;
end;
messdat.Unetz:=-1;
messdat.Ubatt:=-1;
end;

procedure TForm8.Panel3Click(Sender: TObject);
begin
if (edit3.text<>'') and  (edit4.text<>'') and (listbox2.Items.Count<5)
then
begin                                                                    //daten für R hinzu
listbox2.items.Add(edit3.Text+' - '+edit4.text);
messdat.Rspannung[1,listbox2.Items.Count-1]:=strtofloat(edit3.text);
messdat.Rstrom[1,listbox2.Items.Count-1]:=strtofloat(edit4.text);
edit3.Text:='';
edit4.text:='';
end;
end;

procedure TForm8.Panel5Click(Sender: TObject);
begin
if (edit5.text<>'') and  (edit6.text<>'') and (listbox3.Items.Count<5)
then
begin                                                                    //daten für R hinzu
listbox3.items.Add(edit5.Text+' - '+edit6.text);
messdat.Rspannung[2,listbox3.Items.Count-1]:=strtofloat(edit5.text);
messdat.Rstrom[2,listbox3.Items.Count-1]:=strtofloat(edit6.text);
edit5.Text:='';
edit6.text:='';
end;
end;

procedure TForm8.Panel7Click(Sender: TObject);
begin
if (edit7.text<>'') and (listbox4.Items.Count<5)
then
begin                                                                    //daten für I hinzu
listbox4.items.Add(edit7.Text);
messdat.messstrom[0,listbox4.Items.Count-1]:=strtofloat(edit7.text);
edit7.Text:='';
end;
end;

procedure TForm8.Panel9Click(Sender: TObject);
begin
if (edit8.text<>'') and (listbox5.Items.Count<5)
then
begin                                                                    //daten für I hinzu
listbox5.items.Add(edit8.Text);
messdat.messstrom[1,listbox5.Items.Count-1]:=strtofloat(edit8.text);
edit8.Text:='';
end;
end;

procedure TForm8.Panel11Click(Sender: TObject);
begin
if (edit9.text<>'') and (listbox6.Items.Count<5)
then
begin                                                                    //daten für I hinzu
listbox6.items.Add(edit9.Text);
messdat.messstrom[2,listbox6.Items.Count-1]:=strtofloat(edit9.text);
edit9.Text:='';
end;
end;

procedure TForm8.Panel2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true                     // R daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox1.Items.Delete(a);
messdat.Rspannung[0,a]:=-1;
messdat.RStrom[0,a]:=-1;
end;

end;

procedure TForm8.Panel4Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.items.count-1 do
if listbox2.Selected[i]=true                     // R daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox2.Items.Delete(a);
messdat.Rspannung[1,a]:=-1;
messdat.RStrom[1,a]:=-1;
end;

end;

procedure TForm8.Panel6Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox3.Selected[i]=true                     // R daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox3.Items.Delete(a);
messdat.Rspannung[2,a]:=-1;
messdat.RStrom[2,a]:=-1;
end;

end;

procedure TForm8.Panel8Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox4.items.count-1 do
if listbox4.Selected[i]=true                     // I daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox4.Items.Delete(a);
messdat.messstrom[0,a]:=-1;
end;

end;

procedure TForm8.Panel10Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox5.items.count-1 do
if listbox5.Selected[i]=true                     // I daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox5.Items.Delete(a);
messdat.messstrom[1,a]:=-1;
end;
end;

procedure TForm8.Panel12Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox6.items.count-1 do
if listbox6.Selected[i]=true                     // I daten  löschen
then
a:=i;

if a<>-1
then
begin
listbox6.Items.Delete(a);
messdat.messstrom[2,a]:=-1;
end;

end;

procedure TForm8.Panel16Click(Sender: TObject);
var i,e,c:integer;
nenner,U1,U2:extended;
dr:array[0..2,0..2] of extended;

begin             //Berechnen
messdat.Unetz:=strtofloat(edit10.text);
messdat.Ubatt:=strtofloat(edit11.text);      //Daten einlesen

for i:=0 to 2 do
begin
mr[i]:=0;
sr[i]:=0;
mstrom[i]:=0;            //Null setzen
sstrom[i]:=0;

c:=0;
for e:=0 to 4 do
if (messdat.Rspannung[i,e]<>-1) and  (messdat.Rstrom[i,e]<>-1) and (messdat.Rstrom[i,e]<>0)
then
begin
inc(c);                                //Mittelwert der Widerstände
mr[i]:=mr[i]+(messdat.Rspannung[i,e]/(messdat.Rstrom[i,e]/1000));
end;
mr[i]:=mr[i]/c;

for e:=0 to 4 do
if (messdat.Rspannung[i,e]<>-1) and  (messdat.Rstrom[i,e]<>-1) and (messdat.Rstrom[i,e]<>0)
then
begin
sr[i]:=sr[i]+sqr(mr[i]-(messdat.Rspannung[i,e]/(messdat.Rstrom[i,e]/1000)));
end;
sr[i]:=sr[i]/(c-1);            //Standardabweichung der Widerstände
sr[i]:=sqrt(sr[i]);



c:=0;
for e:=0 to 4 do
if (messdat.messstrom[i,e]<>-1) and (messdat.messstrom[i,e]<>0)
then
begin
inc(c);                                //Mittelwert der Ströme
mstrom[i]:=mstrom[i]+(messdat.messstrom[i,e]/1000);
end;
mstrom[i]:=mstrom[i]/c;

for e:=0 to 4 do
if (messdat.messstrom[i,e]<>-1) and (messdat.messstrom[i,e]<>0)
then
begin
sstrom[i]:=sstrom[i]+sqr(mstrom[i]-(messdat.messstrom[i,e]/1000));
end;
sstrom[i]:=sstrom[i]/(c-1);            //Standardabweichung der Ströme
sstrom[i]:=sqrt(sstrom[i]);


end;

rechenIm[0]:=(messdat.Unetz*(mr[1]+mr[2])+messdat.Ubatt*mr[2])/((mr[0]+mr[2])*mr[1]+mr[0]*mr[2]);
rechenIm[1]:=(messdat.Unetz+messdat.Ubatt-rechenIm[0]*mr[0])/mr[1];
rechenIm[2]:=rechenIm[0]-rechenIm[1];           //Ströme errechnen



nenner:=mr[0]*mr[1]+mr[1]*mr[2]+mr[0]*mr[2];
U1:=messdat.Unetz;
U2:=messdat.Ubatt;                                       //partielle Ableitungen

dr[0,0]:=-(U1*mr[1]+U1*mr[2]+U2*mr[2])*(mr[1]*mr[2]);
dr[1,0]:=nenner*U1-(U1*mr[1]+U1*mr[2]+U2*mr[2])*(mr[0]+mr[2]);
dr[2,0]:=nenner*(U1+U2)-(U1*mr[1]+U1*mr[2]+U2*mr[2])*(mr[1]+mr[0]);

dr[0,1]:=nenner*U2-(U1*mr[2]+U2*mr[0]+U2*mr[2])*(mr[1]*mr[2]);
dr[1,1]:=-(U1*mr[2]+U2*mr[0]+U2*mr[2])*(mr[0]+mr[2]);
dr[2,1]:=nenner*(U1+U2)-(U1*mr[2]+U2*mr[0]+U2*mr[2])*(mr[1]+mr[0]);

dr[0,2]:=-nenner*U2-(U1*mr[1]-U2*mr[0])*(mr[1]*mr[2]);
dr[1,2]:=nenner*U1-(U1*mr[1]-U2*mr[0])*(mr[0]+mr[2]);
dr[2,2]:=-(U1*mr[1]-U2*mr[0])*(mr[1]+mr[0]);

for i:=0 to 2 do
for e:=0 to 2 do
dr[i,e]:=dr[i,e]/sqr(nenner);

for i:=0 to 2 do
begin
rechenIs[i]:=sqr(dr[0,i]*sr[0])+sqr(dr[1,i]*sr[1])+sqr(dr[2,i]*sr[2]);
rechenIs[i]:=sqrt(rechenIs[i]);
end;



for i:=0 to 2 do
begin
absabw[i]:=mstrom[i]-rechenIm[i];
relabw[i]:=absabw[i]*100/rechenIm[i];
end;

Anzeigen;

end;

procedure TForm8.Panel15Click(Sender: TObject);
var F:file of datensatz;
begin
messdat.Unetz:=strtofloat(edit10.text);
messdat.Ubatt:=strtofloat(edit11.text); //daten einlesen

if savedialog1.Execute
then
begin
assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,messdat);
closefile(F);
end;

end;

procedure TForm8.Panel14Click(Sender: TObject);
var F:file of datensatz;
    i:integer;
begin
if opendialog1.Execute
then
begin
loeschen;
assignfile(F,opendialog1.FileName);
reset(F);
read(F,messdat);
closefile(F);

for i:=0 to 4 do
begin
listbox1.Items.Add(floattostr(messdat.Rspannung[0,i])+' - '+floattostr(messdat.Rspannung[0,i]));
listbox2.Items.Add(floattostr(messdat.Rspannung[1,i])+' - '+floattostr(messdat.Rspannung[1,i]));
listbox3.Items.Add(floattostr(messdat.Rspannung[2,i])+' - '+floattostr(messdat.Rspannung[2,i]));
listbox4.Items.Add(floattostr(messdat.messstrom[0,i]));
listbox5.Items.Add(floattostr(messdat.messstrom[1,i]));
listbox6.Items.Add(floattostr(messdat.messstrom[2,i]));          //Daten anzeigen
end;

edit10.text:=floattostr(messdat.Unetz);
edit11.text:=floattostr(messdat.Ubatt);
end;

end;

procedure TForm8.Anzeigen;
begin                          //ergebnisse Anzeigen
label5.caption:='R1: ('+floattostr(roundto(mr[0],-4))+' +- '+floattostr(roundto(sr[0],-4))+') Ohm';
label10.caption:='R2: ('+floattostr(roundto(mr[1],-4))+' +- '+floattostr(roundto(sr[1],-4))+') Ohm';
label15.caption:='R3: ('+floattostr(roundto(mr[2],-4))+' +- '+floattostr(roundto(sr[2],-4))+') Ohm';

label18.caption:='I1: ('+floattostr(roundto(mstrom[0],-4))+' +- '+floattostr(roundto(sstrom[0],-4))+') A';
label21.caption:='I2: ('+floattostr(roundto(mstrom[1],-4))+' +- '+floattostr(roundto(sstrom[1],-4))+') A';
label24.caption:='I3: ('+floattostr(roundto(mstrom[2],-4))+' +- '+floattostr(roundto(sstrom[2],-4))+') A';

label25.caption:='errechneter I1: ('+floattostr(roundto(rechenIm[0],-4))+' +- '+floattostr(roundto(rechenIs[0],-4))+') A';
label26.caption:='errechneter I2: ('+floattostr(roundto(rechenIm[1],-4))+' +- '+floattostr(roundto(rechenIs[1],-4))+') A';
label27.caption:='errechneter I3: ('+floattostr(roundto(rechenIm[2],-4))+' +- '+floattostr(roundto(rechenIs[2],-4))+') A';

label28.Caption:='absolute Abweichung des Mittelwerts von I1: '+floattostr(roundto(absabw[0],-4))+' A';
label29.Caption:='absolute Abweichung des Mittelwerts von I2: '+floattostr(roundto(absabw[1],-4))+' A';
label30.Caption:='absolute Abweichung des Mittelwerts von I3: '+floattostr(roundto(absabw[2],-4))+' A';

label31.caption:='relative Abweichung(I1): '+floattostr(roundto(relabw[0],-2))+'%';;
label32.caption:='relative Abweichung(I2): '+floattostr(roundto(relabw[1],-2))+'%';;
label33.caption:='relative Abweichung(I3): '+floattostr(roundto(relabw[2],-2))+'%';;

end;


end.
