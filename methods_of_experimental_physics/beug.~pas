unit beug;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, math, StdCtrls, ExtCtrls;

type
  TForm9 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Edit4: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    ListBox2: TListBox;
    Edit5: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Label17: TLabel;
    Edit6: TEdit;
    Label18: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    ListBox3: TListBox;
    Label19: TLabel;
    Edit7: TEdit;
    Label20: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    ListBox4: TListBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel10Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure einlesen;
    procedure berechnen(g:byte);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Tbeugdat=record
  lambda,gitterschirm:extended;
  maxima:array[0..1,0..1,0..4] of extended;
  anzahl:array[0..1,0..1] of integer;
  end;

var
  Form9: TForm9;
  bdat:Tbeugdat;

implementation

uses main;
{$R *.dfm}

procedure TForm9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form9.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form9.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm9.Panel10Click(Sender: TObject);
begin
form9.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm9.Panel1Click(Sender: TObject);
begin
if (listbox1.Items.count<5) and (edit4.text<>'')
then
listbox1.Items.add(edit4.text);           //Messwerte Gitter 1 l hinzu
edit4.text:='';
end;

procedure TForm9.Panel3Click(Sender: TObject);
begin
if (listbox2.Items.count<5) and (edit5.text<>'')
then
listbox2.Items.add(edit5.text);           //Messwerte Gitter 2 l hinzu
edit5.text:='';
end;

procedure TForm9.Panel2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true                     //Messwert Gitter 1  l löschen
then
a:=i;

if a<>-1
then
listbox1.Items.Delete(a);
end;

procedure TForm9.Panel4Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.items.count-1 do
if listbox2.Selected[i]=true                     //Messwert Gitter 2 l löschen
then
a:=i;

if a<>-1
then
listbox2.Items.Delete(a);
end;

 procedure Tform9.einlesen;
 var i:integer;
 begin                       //einlesen der Datens
 bdat.lambda:=strtofloat(edit1.text);
 bdat.gitterschirm:=strtofloat(edit3.Text);

 bdat.anzahl[0,0]:=listbox1.Items.Count;
 bdat.anzahl[1,0]:=listbox2.Items.count;
  bdat.anzahl[0,1]:=listbox3.Items.Count;
 bdat.anzahl[1,1]:=listbox4.Items.count;

 for i:=0 to listbox1.Items.Count-1 do
 bdat.maxima[0,0,i]:=strtofloat(listbox1.Items.Strings[i]);

  for i:=0 to listbox2.Items.Count-1 do
 bdat.maxima[1,0,i]:=strtofloat(listbox2.Items.Strings[i]);

  for i:=0 to listbox3.Items.Count-1 do
 bdat.maxima[0,1,i]:=strtofloat(listbox3.Items.Strings[i]);

  for i:=0 to listbox4.Items.Count-1 do
 bdat.maxima[1,1,i]:=strtofloat(listbox4.Items.Strings[i]);

 end;

procedure Tform9.berechnen(g:byte);
var alpha,mittel,sigma,ab:extended;
i,e:integer;
d:array[0..1,0..4] of extended;
begin                //Berechnung des Gitterabstands
mittel:=0;
for e:=0 to 1 do
begin
ab:=0;
for i:=0 to bdat.anzahl[g,e]-1 do
begin
ab:=ab+bdat.maxima[g,e,i];
alpha:=arctan(ab/1000/bdat.gitterschirm);
d[e,i]:=(3+2*i)*bdat.lambda/1000000000/2/sin(alpha);
mittel:=mittel+d[e,i];
end;
end;
mittel:=mittel/(bdat.anzahl[g,0]+bdat.anzahl[g,1]);

sigma:=0;

for e:=0 to 1 do
for i:=0 to bdat.anzahl[g,e]-1 do
sigma:=sigma+sqr(mittel-d[e,i]);

sigma:=sigma/(bdat.anzahl[g,0]+bdat.anzahl[g,1]-1);

sigma:=sqrt(sigma);

mittel:=mittel*1000;
sigma:=sigma*1000;

if g=0
then
begin
label12.caption:='( '+floattostr(roundto(mittel,-4))+' +- '+floattostr(roundto(sigma,-4))+' ) mm';
label13.Caption:='= '+floattostr(roundto(10/mittel,-4))+' Strich/cm';
end
else
begin
label15.caption:='( '+floattostr(roundto(mittel,-4))+' +- '+floattostr(roundto(sigma,-4))+' ) mm';
label16.Caption:='= '+floattostr(roundto(10/mittel,-4))+' Strich/cm';
end;

end;









procedure TForm9.Panel5Click(Sender: TObject);
begin
einlesen;
berechnen(0);            //Start Berechnung Gitter 1
end;

procedure TForm9.Panel6Click(Sender: TObject);
begin
einlesen;
berechnen(1);            //Start Berechnung Gitter 2
end;

procedure TForm9.Panel11Click(Sender: TObject);
begin
if (listbox3.Items.count<5) and (edit6.text<>'')
then
listbox3.Items.add(edit6.text);           //Messwerte Gitter 1  r hinzu
edit6.text:='';
end;

procedure TForm9.Panel13Click(Sender: TObject);
begin
if (listbox4.Items.count<5) and (edit7.text<>'')
then
listbox4.Items.add(edit7.text);           //Messwerte Gitter 2  r hinzu
edit7.text:='';
end;

procedure TForm9.Panel12Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox3.items.count-1 do
if listbox3.Selected[i]=true                     //Messwert Gitter 1  r löschen
then
a:=i;

if a<>-1
then
listbox3.Items.Delete(a);
end;

procedure TForm9.Panel14Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox4.items.count-1 do
if listbox4.Selected[i]=true                     //Messwert Gitter 2  r löschen
then
a:=i;

if a<>-1
then
listbox4.Items.Delete(a);
end;

procedure TForm9.Panel7Click(Sender: TObject);
begin
edit1.Text:='';     //Neu
edit3.Text:='';
edit4.Text:='';
edit5.Text:='';
edit6.Text:='';
edit7.Text:='';
listbox1.clear;
listbox2.clear;
listbox3.clear;
listbox4.clear;
end;

procedure TForm9.Panel9Click(Sender: TObject);
var F: file of Tbeugdat;
begin
if savedialog1.Execute  //speichern
then
begin
einlesen;
assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,bdat);
closefile(F);

end;
end;

procedure TForm9.Panel8Click(Sender: TObject);
var F: file of Tbeugdat;
    i:integer;
begin
if opendialog1.Execute
then
begin                        //laden;
assignfile(F,opendialog1.FileName);
reset(F);
read(F,bdat);
closefile(F);

edit1.Text:=floattostr(bdat.lambda);
edit3.Text:=floattostr(bdat.gitterschirm);
edit4.Text:='';
edit5.Text:='';
edit6.Text:='';
edit7.Text:='';

listbox1.clear;
listbox2.clear;
listbox3.clear;
listbox4.clear;

for i:=0 to bdat.anzahl[0,0]-1 do
listbox1.Items.Add(floattostr(bdat.maxima[0,0,i]));

for i:=0 to bdat.anzahl[1,0]-1 do
listbox2.Items.Add(floattostr(bdat.maxima[1,0,i]));

for i:=0 to bdat.anzahl[0,1]-1 do
listbox3.Items.Add(floattostr(bdat.maxima[0,1,i]));

for i:=0 to bdat.anzahl[1,1]-1 do
listbox4.Items.Add(floattostr(bdat.maxima[1,1,i]));

end;

end;

end.
