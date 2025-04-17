unit gas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, math;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    Edit2: TEdit;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    ListBox3: TListBox;
    ListBox4: TListBox;
    Edit4: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label9: TLabel;
    Edit5: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit6: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Edit7: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Edit8: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit9: TEdit;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label19: TLabel;
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel11Click(Sender: TObject);
    procedure resetvalues;
    procedure Panel9Click(Sender: TObject);
    procedure dateneinlesen;
    procedure Panel1Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Tdatasave=record
  pluft,Vk,Vs,Tzimmer,pzimmer:extended;
  h0,Twarm,hwarm:array[0..3] of extended;
  end;

var
  Form5: TForm5;
  datasave:Tdatasave;
  F:file of Tdatasave;
  
implementation

uses main;

{$R *.dfm}

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin

form5.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

form5.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln

end;

procedure TForm5.Panel11Click(Sender: TObject);
begin

form5.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln

end;

  procedure Tform5.resetvalues;
  begin //Werte zurücksetzen
  listbox2.clear;
  listbox3.Clear;
  listbox4.Clear;

  edit2.text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  edit7.Text:='';
  edit8.Text:='';
  edit9.text:='';

  Label19.caption:='alpha: ';
  Label1.caption:='1/alpha: ';
  label2.caption:='Anteil des schlädlichen Volumens am gesammten System: ';
  Label20.caption:='Druck bei 0°C:';
  Label21.caption:='Raumtemperatur(errechnet mit Messwert):';
  Label22.caption:='Raumtemperatur(errechnet mit Theoriewert):';
  end;

procedure TForm5.Panel9Click(Sender: TObject);
begin      //Neu
resetvalues;
end;



   procedure Tform5.dateneinlesen;
   var i:integer;
   begin //Einlesen der Daten
   datasave.pluft:=strtofloat(edit5.Text);
   datasave.Tzimmer:=strtofloat(edit7.text);
   datasave.pzimmer:=strtofloat(edit6.text);
   datasave.Vk:=strtofloat(edit8.text);
   datasave.Vs:=strtofloat(edit9.text);

   for i:=0 to 3 do
   begin
   datasave.h0[i]:=strtofloat(listbox2.Items.Strings[i]);
   datasave.twarm[i]:=strtofloat(listbox3.Items.Strings[i]);
   datasave.hwarm[i]:=strtofloat(listbox4.Items.Strings[i]);
   end;

  end;


procedure TForm5.Panel1Click(Sender: TObject);
var pnull,ptemp,alpha:array[0..3] of extended;
malpha,sigmaa,Vges,prozent,pnullm,pnullsigma,rt,rtsigma,pt:extended;
i:integer;
begin         //Berechnen
dateneinlesen;
for i:=0 to 3 do
begin
pnull[i]:=datasave.pluft+datasave.h0[i]-datasave.pzimmer;
ptemp[i]:=datasave.pluft+datasave.hwarm[i]-datasave.pzimmer;       //alpha berechnen
alpha[i]:=((ptemp[i]-pnull[i])/(pnull[i]))/datasave.twarm[i];
end;

malpha:=0;
sigmaa:=0;

for i:=0 to 3 do
malpha:=malpha+alpha[i];                             //Mittelwert bilden

malpha:=malpha/4;

for i:=0 to 3 do
sigmaa:=sigmaa+((alpha[i]-malpha)*(alpha[i]-malpha));

sigmaa:=sigmaa/3;

sigmaa:=sqrt(sigmaa);

                                         //Standardabweichung berechnen
label19.Caption:='alpha: ('+floattostr(roundto(malpha,-6))+' +- '+floattostr(roundto(sigmaa,-6))+') 1/K';
label1.caption:='1/alpha: '+floattostr(roundto(1/malpha,-4));

vges:=datasave.Vs+datasave.Vk;
if datasave.Vs<>0
then
begin                                                    //schädliche Volumen
prozent:=datasave.Vs*100/vges;
label2.caption:='Anteil des schlädlichen Volumens am gesammten System: '+floattostr(roundto(prozent,-2))+'%' ;
end
else
label2.caption:='Anteil des schlädlichen Volumens am gesammten System: 0%';

pnullm:=0;
pnullsigma:=0;

for i:=0 to 3 do
pnullm:=pnullm+pnull[i];

pnullm:=pnullm/4;

for i:=0 to 3 do
pnullsigma:=pnullsigma+(sqr(pnull[i]-pnullm));

pnullsigma:=pnullsigma/3;

pnullsigma:=sqrt(pnullsigma);

pt:=datasave.pluft;

rt:=((pt-pnullm)/pnullm)/malpha;

rtsigma:=sqr(pt/(malpha*sqr(pnullm)))*sqr(pnullsigma)+sqr((pnullm-pt)/(sqr(malpha)*pnullm))*sqr(sigmaa);
rtsigma:=sqrt(rtsigma);

  Label20.caption:='Druck bei 0°C: ('+floattostr(roundto(pnullm,-4))+' +- '+floattostr(roundto(pnullsigma,-4))+') mmHg';
  Label21.caption:='Raumtemperatur(errechnet mit Messwert): ('+floattostr(roundto(rt,-4))+' +- '+floattostr(roundto(rtsigma,-4))+') °C';

rt:=((pt-pnullm)/pnullm)*273.15;

rtsigma:=sqr(pt/((1/273.15)*sqr(pnullm)))*sqr(pnullsigma);
rtsigma:=sqrt(rtsigma);

  Label22.caption:='Raumtemperatur(errechnet mit Theoriewert): ('+floattostr(roundto(rt,-4))+' +- '+floattostr(roundto(rtsigma,-4))+') °C';
end;

procedure TForm5.Panel12Click(Sender: TObject);
begin         //Speichern
dateneinlesen;

if savedialog1.execute
then
begin
assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,datasave);
closefile(F);
end;

end;

procedure TForm5.Panel10Click(Sender: TObject);
var i:integer;
begin
if opendialog1.Execute                  //Öffnen
then
begin
resetvalues;
assignfile(F,opendialog1.FileName);
reset(F);
read(F,datasave);
closefile(F);

   edit5.text:=floattostr(datasave.pluft);
   edit7.Text:=floattostr(datasave.Tzimmer);
   edit6.Text:=floattostr(datasave.pzimmer);
   edit8.Text:=floattostr(datasave.Vk);
   edit9.Text:=floattostr(datasave.Vs);


   for i:=0 to 3 do
   begin
   listbox2.Items.Add(floattostr(datasave.h0[i]));
   listbox3.Items.Add(floattostr(datasave.twarm[i]));
   listbox4.Items.Add(floattostr(datasave.hwarm[i]));
   end;


end;

end;

procedure TForm5.Panel4Click(Sender: TObject);
begin
if (listbox2.Items.count<4) and (edit2.text<>'')
then
listbox2.Items.add(edit2.text);           //Messwerte Hg Säule kalt
edit2.text:='';
end;

procedure TForm5.Panel5Click(Sender: TObject);
begin
if (listbox3.Items.count<4) and (edit3.text<>'')
then
listbox3.Items.add(edit3.text);           //Messwerte Temperatur
edit3.text:='';
end;

procedure TForm5.Panel8Click(Sender: TObject);
begin
if (listbox4.Items.count<4) and (edit4.text<>'')
then
listbox4.Items.add(edit4.text);           //Messwerte Hg Säule warm
edit4.text:='';
end;

procedure TForm5.Panel3Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.items.count-1 do
if listbox2.Selected[i]=true                     //Messwert Hg Säule kalt   löschen
then
a:=i;

if a<>-1
then
listbox2.Items.Delete(a);

end;

procedure TForm5.Panel6Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox3.items.count-1 do
if listbox3.Selected[i]=true                     //Messwert Temperatur     löschen
then
a:=i;

if a<>-1
then
listbox3.Items.Delete(a);


end;

procedure TForm5.Panel7Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox4.items.count-1 do
if listbox4.Selected[i]=true                     //Messwert Hg Säule warm  löschen
then
a:=i;

if a<>-1
then
listbox4.Items.Delete(a);

end;



end.


