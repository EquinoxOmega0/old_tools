unit zaehe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, math;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label12: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Edit8: TEdit;
    ListBox2: TListBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel5: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label37: TLabel;
    GroupBox3: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    ListBox3: TListBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Edit12: TEdit;
    ListBox4: TListBox;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Edit13: TEdit;
    Label41: TLabel;
    Edit14: TEdit;
    Label42: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    GroupBox4: TGroupBox;
    ListBox5: TListBox;
    Edit15: TEdit;
    Panel15: TPanel;
    Panel16: TPanel;
    Label43: TLabel;
    Label44: TLabel;
    Panel17: TPanel;
    procedure Panel14Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel5Click(Sender: TObject);
    procedure berechne(nr:integer);
    procedure datenlesen;
    procedure Panel10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure resetdata;
    procedure Panel13Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel15Click(Sender: TObject);
    procedure Panel17Click(Sender: TObject);
    procedure dichterechnung;
    procedure Panel16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type TMaterial = Record
  Dichte,Durchmesser:extended;
  zeit1,zeit2:array[0..9] of extended;
  n1,n2:integer;
  end;

                                         //Datenverwaltungstypen

  type TDaten = Record
  material:array[1..2] of TMaterial;
  dgefaesz,temperatur,fallstrecke,sigmat,sigmafall,sigmadurch:extended;
  dichte:array[0..9] of extended;
  nd:integer;
  end;

var
  Form2: TForm2;
  d:TDaten;
  F:file of Tdaten;
  roh,rohsigma:extended;

implementation

uses main;

{$R *.dfm}

procedure TForm2.Panel14Click(Sender: TObject);
begin
Form2.visible:=false;
Form1.visible:=true;               //Ins Hauptmenü wechseln
end;

procedure TForm2.Panel1Click(Sender: TObject);
begin
if (listbox1.Items.count<10) and (edit1.text<>'')
then
Listbox1.Items.Add(edit1.text);            //Messwerte Stoppuhr1 Material 1 hinzufügen
edit1.text:='';
end;

procedure TForm2.Panel3Click(Sender: TObject);
begin
if (listbox2.Items.count<10) and (edit8.text<>'')
then
listbox2.Items.add(edit8.text);           //Messwerte Stoppuhr2 Material 1 hinzufügen
edit8.text:='';
end;

procedure TForm2.Panel2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true                     //Messwert Stoppuhr1 Material 1 löschen
then
a:=i;

if a<>-1
then
listbox1.Items.Delete(a);

end;

procedure TForm2.Panel4Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.items.count-1 do
if listbox2.Selected[i]=true
then                                              //Messwert Stoppuhr2 Material 1 löschen
a:=i;

if a<>-1
then
listbox2.Items.Delete(a);

end;


procedure TForm2.Panel7Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox3.items.count-1 do
if listbox3.Selected[i]=true                              //Messwert Stoppuhr1 Material 2 löschen
then
a:=i;

if a<>-1
then
listbox3.Items.Delete(a);

end;


procedure TForm2.Panel9Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox4.items.count-1 do
if listbox4.Selected[i]=true
then                                                 //Messwert Stoppuhr2 Material 2 löschen
a:=i;

if a<>-1
then
listbox4.Items.Delete(a);

end;


procedure TForm2.Panel6Click(Sender: TObject);
begin
if (listbox3.Items.count<10) and (edit9.text<>'')
then
Listbox3.items.add(edit9.text);                 //Messwerte Stoppuhr1 Material 2 hinzufügen
edit9.text:='';
end;

procedure TForm2.Panel8Click(Sender: TObject);
begin
if (listbox4.Items.count<10) and (edit12.text<>'')       //Messwerte Stoppuhr2 Material 2 hinzufügen
then
Listbox4.items.add(edit12.text);
edit12.text:='';
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Form2.visible:=false;                //Ins Hauptmenü wechseln
Form1.visible:=true;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

Form2.visible:=false;
Form1.visible:=true;              //Ins Hauptmenü wechseln
end;

procedure TForm2.Panel5Click(Sender: TObject);
begin
datenlesen;
          dichterechnung;
                         //Start der Berechnung Material 1
berechne(1);
end;


Procedure TForm2.berechne(nr:integer);
var i:integer;
mittelwert,sigma:array[1..3] of extended;
v,sigmav,k,sigmak,eta,sigmaeta,reynold,sigmareynold,h:extended;

begin
for i:=1 to 3 do
begin
mittelwert[i]:=0;                 //Startwerte = 0 setzen
sigma[i]:=0;
end;

for i:=0 to d.material[nr].n1-1 do
begin
mittelwert[1]:=mittelwert[1]+d.material[nr].zeit1[i];
mittelwert[3]:=mittelwert[3]+d.material[nr].zeit1[i];      //Mittelwert Stoppuhr1 berechnen
                                                        //nebenbei auch schon für gesammten Mittelwert mitrechnen
end;
mittelwert[1]:=mittelwert[1]/d.material[nr].n1;



for i:=0 to d.material[nr].n2-1 do
begin
mittelwert[2]:=mittelwert[2]+d.material[nr].zeit2[i];
mittelwert[3]:=mittelwert[3]+d.material[nr].zeit2[i];    //Mittelwert Stoppuhr2 berechnen
                                                        //nebenbei auch schon für gesammten Mittelwert mitrechnen

end;
mittelwert[2]:=mittelwert[2]/d.material[nr].n2;

mittelwert[3]:=mittelwert[3]/(d.material[nr].n1+d.material[nr].n2);   //gesammter Mittelwert berechnen

for i:=0 to d.material[nr].n1-1 do
begin
h:=d.material[nr].zeit1[i]-mittelwert[1];
sigma[1]:=sigma[1]+h*h;                         //Standardabweichung bereichnen, nach gleicher Methode wie Mittelwert
sigma[3]:=sigma[3]+(d.material[nr].zeit1[i]-mittelwert[3])*(d.material[nr].zeit1[i]-mittelwert[3]);
end;
sigma[1]:=sigma[1]/(d.material[nr].n1-1);

sigma[1]:=sqrt(sigma[1]);

for i:=0 to d.material[nr].n2-1 do
begin
sigma[2]:=sigma[2]+(d.material[nr].zeit2[i]-mittelwert[2])*(d.material[nr].zeit2[i]-mittelwert[2]);
sigma[3]:=sigma[3]+(d.material[nr].zeit2[i]-mittelwert[3])*(d.material[nr].zeit2[i]-mittelwert[3]);
end;
sigma[2]:=sigma[2]/(d.material[nr].n2-1);

sigma[2]:=sqrt(sigma[2]);

sigma[3]:=sigma[3]/((d.material[nr].n1+d.material[nr].n2)-1);

sigma[3]:=sqrt(sigma[3]);

//Sigma wird ab jetzt immer durch das Fehlerfortpflanzungsgesetz für Potenzreihen berechnet

v:=d.fallstrecke/mittelwert[3];         //Fallgeschwindigkeit und ihr Sigma berechnen

sigmav:=abs((d.sigmafall/d.fallstrecke+sigma[3]/mittelwert[3])*v);


k:=2.4*d.material[nr].Durchmesser/d.dgefaesz;            //Korrekturfaktor und sein Sigma berechnen

sigmak:=abs((d.sigmadurch/d.dgefaesz+d.sigmadurch/d.material[nr].Durchmesser)*k);

k:=k+1;



eta:=(d.material[nr].Durchmesser)*(d.material[nr].Durchmesser)*(d.material[nr].Dichte-roh)*9.81/(18*v*k);

                                                       //Eta und sein Sigma berechnen  durch Gaussesches Fehlerfortpflanzungsgesetz


h:=d.material[nr].Durchmesser*(d.material[nr].Dichte-roh)*9.81/(9*k*v);

sigmaeta:=h*h*d.sigmadurch*d.sigmadurch;

h:=d.material[nr].Durchmesser*d.material[nr].Durchmesser*9.81/(18*k*v);

sigmaeta:=sigmaeta+h*h*rohsigma*rohsigma;

h:=d.material[nr].Durchmesser*d.material[nr].Durchmesser*(d.material[nr].Dichte-roh)*9.81/(18*v*k*k);

sigmaeta:=sigmaeta+h*h*sigmak*sigmak;

h:=d.material[nr].Durchmesser*d.material[nr].Durchmesser*(d.material[nr].Dichte-roh)*9.81/(18*v*v*k);

sigmaeta:=sigmaeta+h*h*sigmav*sigmav;

sigmaeta:=sqrt(sigmaeta);


reynold:=roh*v*d.material[nr].Durchmesser/eta;
                                                      //Reynoldszahl und ihr Sigma berechnen
sigmareynold:=abs((rohsigma/roh+sigmav/v+d.sigmadurch/d.material[nr].Durchmesser+sigmaeta/eta)*reynold);







if nr=1
then                        //Anzeigen der Ergebnisse(auf die 4 Dezimale gerundet)
begin
Label13.Caption:='Mittelwert: '+floattostr(roundto(mittelwert[1],-4))+' sec';
Label15.Caption:='Mittelwert: '+floattostr(roundto(mittelwert[2],-4))+' sec';
Label14.Caption:='sigma: '+floattostr(roundto(sigma[1],-4))+' sec';
Label16.Caption:='sigma: '+floattostr(roundto(sigma[2],-4))+' sec';
label17.Caption:='Fallgeschwindigkeit: ('+floattostr(roundto(v,-4))+' +- '+floattostr(roundto(sigmav,-4))+' ) m/sec';
Label19.caption:='Korrekturfaktor: '+floattostr(roundto(k,-4))+' +- '+floattostr(roundto(sigmak,-4));
label20.caption:='Eta Flüssigkeit: ( '+floattostr(roundto(eta,-4))+' +- '+floattostr(roundto(sigmaeta,-4))+' ) kg/(m*sec)';
label37.Caption:='Reynoldszahl: '+floattostr(roundto(reynold,-4))+' +- '+floattostr(roundto(sigmareynold,-4));
end
else
begin
Label27.Caption:='Mittelwert: '+floattostr(roundto(mittelwert[1],-4))+' sec';
Label29.Caption:='Mittelwert: '+floattostr(roundto(mittelwert[2],-4))+' sec';
Label28.Caption:='sigma: '+floattostr(roundto(sigma[1],-4))+' sec';
Label30.Caption:='sigma: '+floattostr(roundto(sigma[2],-4))+' sec';
label31.Caption:='Fallgeschwindigkeit: ('+floattostr(roundto(v,-4))+' +- '+floattostr(roundto(sigmav,-4))+' ) m/sec';
Label33.caption:='Korrekturfaktor: '+floattostr(roundto(k,-4))+' +- '+floattostr(roundto(sigmak,-4));
label34.caption:='Eta Flüssigkeit: ( '+floattostr(roundto(eta,-4))+' +- '+floattostr(roundto(sigmaeta,-4))+' ) kg/(m*sec)';
label38.Caption:='Reynoldszahl: '+floattostr(roundto(reynold,-4))+' +- '+floattostr(roundto(sigmareynold,-4));
end;

end;


procedure TForm2.Panel10Click(Sender: TObject);
begin
datenlesen;
 dichterechnung;                        //Start der Berechnung Material 1
berechne(2);
end;


   procedure Tform2.datenlesen;
  var i:integer;
begin

for i:=0 to listbox1.Items.Count-1 do
d.material[1].zeit1[i]:=strtofloat(listbox1.Items.Strings[i]);

for i:=0 to listbox2.Items.Count-1 do
d.material[1].zeit2[i]:=strtofloat(listbox2.Items.Strings[i]);

d.material[1].n1:=listbox1.Items.Count;             //Einlesen der Daten von Material 1
d.material[1].n2:=listbox2.Items.Count;

d.material[1].Dichte:=strtofloat(edit2.text);

d.material[1].Durchmesser:=strtofloat(edit4.text);

for i:=0 to listbox3.Items.Count-1 do
d.material[2].zeit1[i]:=strtofloat(listbox3.Items.Strings[i]);

for i:=0 to listbox4.Items.Count-1 do                  //Einlesen der Daten von Material 2
d.material[2].zeit2[i]:=strtofloat(listbox4.Items.Strings[i]);

d.material[2].n1:=listbox3.Items.Count;
d.material[2].n2:=listbox4.Items.Count;

d.material[2].Dichte:=strtofloat(edit10.text);

d.material[2].Durchmesser:=strtofloat(edit11.text);

d.dgefaesz:=strtofloat(edit3.text);
d.temperatur:=strtofloat(edit5.text);
d.fallstrecke:=strtofloat(edit6.text);         //Einlesen der Basisdaten
d.sigmat:=strtofloat(edit7.text);
d.sigmafall:=strtofloat(edit14.text);
d.sigmadurch:=strtofloat(edit13.text);

for i:=0 to listbox5.Items.Count-1 do
d.dichte[i]:=strtofloat(listbox5.Items.Strings[i]);

d.nd:=listbox5.items.count;

   end;


procedure TForm2.Panel11Click(Sender: TObject);
begin
resetdata;               //Neu 
end;


 procedure Tform2.resetdata;
 begin
 edit1.Text:='';
 edit2.Text:='';
 edit3.Text:='';
 edit4.Text:='';
 edit5.Text:='';
 edit6.Text:='';
 edit7.Text:='';
 edit8.Text:='';
 edit9.Text:='';
 edit10.Text:='';
 edit11.Text:='';
 edit12.Text:='';
 edit13.Text:='';                   //Alle Felder und sonstiges löschen und auf Startwerte setzen
 edit14.Text:='';
 edit15.Text:='';

 listbox1.Clear;
 listbox2.Clear;
 listbox3.Clear;
 listbox4.Clear;
 listbox5.Clear;

label13.Caption:='Mittelwert: ';
Label15.Caption:='Mittelwert: ';
Label14.Caption:='sigma: ';
Label16.Caption:='sigma: ';
label17.Caption:='Fallgeschwindigkeit:';
Label19.caption:='Korrekturfaktor: ';
label20.caption:='Eta Flüssigkeit: ';
label37.Caption:='Reynoldszahl: ';
Label27.Caption:='Mittelwert: ';
Label29.Caption:='Mittelwert: ';
Label28.Caption:='sigma: ';
Label30.Caption:='sigma: ';
label31.Caption:='Fallgeschwindigkeit: ';
Label33.caption:='Korrekturfaktor: ';
label34.caption:='Eta Flüssigkeit: ';
label38.Caption:='Reynoldszahl: ';
label43.caption:='Mittelwert: ';
label44.caption:='simga: ';

 end;



 procedure TForm2.Panel13Click(Sender: TObject);
begin
if savedialog1.Execute
then
begin
datenlesen;                            //Speichern der Daten
assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,d);
closefile(F);
end;

end;

procedure TForm2.Panel12Click(Sender: TObject);
var i:integer;
begin

if opendialog1.Execute
then
begin
 resetdata;
assignfile(F,opendialog1.FileName);         //Laden der Daten
reset(F);
read(F,d);
closefile(F);


for i:=0 to d.material[1].n1-1 do
listbox1.Items.Add(floattostr(d.material[1].zeit1[i]));

for i:=0 to d.material[1].n2-1 do
listbox2.Items.Add(floattostr(d.material[1].zeit2[i]));

edit2.Text:=floattostr(d.material[1].Dichte);
edit4.text:=floattostr(d.material[1].Durchmesser);
                                                          //Daten in Felder übertragen
for i:=0 to d.material[2].n1-1 do
listbox3.Items.Add(floattostr(d.material[2].zeit1[i]));

for i:=0 to d.material[2].n2-1 do
listbox4.Items.Add(floattostr(d.material[2].zeit2[i]));

for i:=0 to d.nd-1 do
listbox5.Items.Add(floattostr(d.dichte[i]));

edit10.Text:=floattostr(d.material[2].Dichte);
edit11.text:=floattostr(d.material[2].Durchmesser);


edit3.text:=floattostr(d.dgefaesz);
edit5.text:=floattostr(d.temperatur);
edit6.text:=floattostr(d.fallstrecke);
edit7.text:=floattostr(d.sigmat);
edit14.text:=floattostr(d.sigmafall);
edit13.text:=floattostr(d.sigmadurch);



end;
end;

procedure TForm2.Panel15Click(Sender: TObject);
begin
if (listbox5.Items.count<10) and (edit15.text<>'')
then
Listbox5.items.add(edit15.text);                 //Messwerte Dichte hinzufügen
edit15.text:='';
end;

procedure TForm2.Panel17Click(Sender: TObject);
begin
datenlesen;
dichterechnung; //Errechnen der Flüssigkeitsdichte
end;

procedure Tform2.dichterechnung;
var i:integer;
begin

roh:=0;             //Startwerte = 0 setzen
rohsigma:=0;

for i:=0 to d.nd-1 do
roh:=roh+d.dichte[i];      //Mittelwert Dichte berechnen

roh:=roh/d.nd;




for i:=0 to d.nd-1 do
rohsigma:=rohsigma+((d.dichte[i]-roh)*(d.dichte[i]-roh));
                                                              //Standardabweichung berechnen
rohsigma:=rohsigma/(d.nd-1);

rohsigma:=sqrt(rohsigma);

label43.caption:='Mittelwert: '+floattostr(roundto(roh,-4))+' kg/m³';
label44.caption:='simga: '+floattostr(roundto(rohsigma,-4))+' kg/m³';

end;

procedure TForm2.Panel16Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox5.items.count-1 do
if listbox5.Selected[i]=true
then                                                 //Messwert Dichte löschen
a:=i;

if a<>-1
then
listbox5.Items.Delete(a);


end;

end.
