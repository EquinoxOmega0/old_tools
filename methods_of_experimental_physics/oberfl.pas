unit oberfl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, math;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox1: TListBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    ListBox2: TListBox;
    GroupBox4: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    ListBox3: TListBox;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Panel10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure dateneinlesen;
    procedure rechnen(nr:integer);
    procedure Panel11Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel13Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure resetfelder;
    procedure Panel8Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Tfluessig=record
  dichte:extended;
  n:integer;
  spannung:array[0..11] of extended;
  end;
                                  //Daten records
  type TOfs=record
  fl:array[1..3] of Tfluessig;
  Rring,r,luft:extended;
  end;

var
  Form3: TForm3;
  OFS:TOFS;
  F:file of TOFS;

implementation

uses main;


{$R *.dfm}

procedure TForm3.Panel10Click(Sender: TObject);
begin
form3.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form3.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form3.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm3.Panel1Click(Sender: TObject);
begin
if (listbox1.Items.count<12) and (edit5.text<>'')
then
listbox1.Items.add(edit5.text);           //Messwerte Flüssigkeit 1 hinzufügen
edit5.text:='';
end;

procedure TForm3.Panel3Click(Sender: TObject);
begin
if (listbox2.Items.count<12) and (edit7.text<>'')
then
listbox2.Items.add(edit7.text);           //Messwerte Flüssigkeit 2 hinzufügen
edit7.text:='';
end;

procedure TForm3.Panel5Click(Sender: TObject);
begin
if (listbox3.Items.count<12) and (edit9.text<>'')
then
listbox3.Items.add(edit9.text);           //Messwerte Flüssigkeit 3 hinzufügen
edit9.text:='';
end;

procedure TForm3.Panel2Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.Selected[i]=true                     //Messwert Flüssigkeit 1 löschen
then
a:=i;

if a<>-1
then
listbox1.Items.Delete(a);

end;

procedure TForm3.Panel4Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox2.items.count-1 do
if listbox2.Selected[i]=true                     //Messwert Flüssigkeit 2 löschen
then
a:=i;

if a<>-1
then
listbox2.Items.Delete(a);

end;

procedure TForm3.Panel6Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox3.items.count-1 do
if listbox3.Selected[i]=true                     //Messwert Flüssigkeit 3 löschen
then
a:=i;

if a<>-1
then
listbox3.Items.Delete(a);

end;

    procedure Tform3.dateneinlesen;
    var i:integer;
    begin                                 //Daten in Speicher einlesen
    OFS.Rring:=strtofloat(edit1.text);
    OFS.r:=strtofloat(edit2.text);
    OFS.luft:=strtofloat(edit3.text);
    OFS.fl[1].dichte:=strtofloat(edit4.text);
  OFS.fl[2].dichte:=strtofloat(edit6.text);
  OFS.fl[3].dichte:=strtofloat(edit8.text);
  
    OFS.fl[1].n:=listbox1.Items.Count;
     OFS.fl[2].n:=listbox2.Items.Count;
      OFS.fl[3].n:=listbox3.Items.Count;

      for i:=0 to listbox1.Items.Count-1 do
      OFS.fl[1].spannung[i]:=strtofloat(listbox1.Items.Strings[i]);

            for i:=0 to listbox2.Items.Count-1 do
      OFS.fl[2].spannung[i]:=strtofloat(listbox2.Items.Strings[i]);

            for i:=0 to listbox3.Items.Count-1 do
      OFS.fl[3].spannung[i]:=strtofloat(listbox3.Items.Strings[i]);


    end;

    procedure Tform3.rechnen(nr:integer);
    var i:integer;
    mittelwert,sigma,korr,korrsigma,ospann,ospannsigma:extended;
    begin

    Mittelwert:=0;
    sigma:=0;                                   //Berechnung des Mittelwert und Standardabweichung

    for i:=0 to OFS.fl[nr].n-1 do
    mittelwert:=mittelwert+OFS.fl[nr].spannung[i];

    mittelwert:=mittelwert/OFS.fl[nr].n;

    for i:=0 to OFS.fl[nr].n-1 do
    sigma:=sigma+((OFS.fl[nr].spannung[i]-mittelwert)*(OFS.fl[nr].spannung[i]-mittelwert));

    sigma:=sigma/(OFS.fl[nr].n-1);

    sigma:=sqrt(sigma);
                                                       //In Formeln einsetzen
                                                       //Fehlerfortzpflanzung nach Gauss
    korr:=1.07*(0.7250+sqrt((0.01452*mittelwert/(4*OFS.Rring*PI*OFS.Rring*PI*(OFS.fl[nr].dichte-OFS.luft)))+0.04534-(1.679/(OFS.Rring/OFS.r))));

    korrsigma:=(1.07/2)/sqrt((0.01452*mittelwert/(4*OFS.Rring*PI*OFS.Rring*PI*(OFS.fl[nr].dichte-OFS.luft)))+0.04534-(1.679/(OFS.Rring/OFS.r)))*0.01452/(4*PI*PI*OFS.Rring*OFS.Rring*(OFS.fl[nr].dichte-OFS.luft));



    ospannsigma:=abs((korrsigma*mittelwert+korr)*sigma);
  

    korrsigma:=abs(korrsigma*sigma);

    ospann:=korr*mittelwert;

    case nr of
    1:begin                   //Anzeigen der Ergebnisse
    label12.caption:='Mittelwert: '+floattostr(roundto(mittelwert,-4))+' mN/m';
    label13.caption:='sigma: '+floattostr(roundto(sigma,-4))+' mN/m';
    label11.caption:='Korrekturfaktor: '+floattostr(roundto(korr,-4))+' +- '+floattostr(roundto(korrsigma,-4));
    label14.caption:='OFS: ('+floattostr(roundto(ospann,-4))+' +- '+floattostr(roundto(ospannsigma,-4))+') mN/m';
    end;
    2:begin
    label20.caption:='Mittelwert: '+floattostr(roundto(mittelwert,-4))+' mN/m';
    label21.caption:='sigma: '+floattostr(roundto(sigma,-4))+' mN/m';
    label19.caption:='Korrekturfaktor: '+floattostr(roundto(korr,-4))+' +- '+floattostr(roundto(korrsigma,-4));
    label22.caption:='OFS: ('+floattostr(roundto(ospann,-4))+' +- '+floattostr(roundto(ospannsigma,-4))+') mN/m';
    end;
    3:begin
    label28.caption:='Mittelwert: '+floattostr(roundto(mittelwert,-4))+' mN/m';
    label29.caption:='sigma: '+floattostr(roundto(sigma,-4))+' mN/m';
    label27.caption:='Korrekturfaktor: '+floattostr(roundto(korr,-4))+' +- '+floattostr(roundto(korrsigma,-4));
    label30.caption:='OFS: ('+floattostr(roundto(ospann,-4))+' +- '+floattostr(roundto(ospannsigma,-4))+') mN/m';
    end;
    end;

    end;



procedure TForm3.Panel11Click(Sender: TObject);
begin
dateneinlesen;    //Start der Berechnung für Flüssigkeit 1
rechnen(1);
end;

procedure TForm3.Panel12Click(Sender: TObject);
begin
dateneinlesen;    //Start der Berechnung für Flüssigkeit 2
rechnen(2);
end;

procedure TForm3.Panel13Click(Sender: TObject);
begin
dateneinlesen;    //Start der Berechnung für Flüssigkeit 3
rechnen(3);
end;

procedure TForm3.Panel7Click(Sender: TObject);
begin
resetfelder; //Neu
end;




    procedure TForm3.resetfelder;
    begin       //Alle daten aus Felder entfernen
    edit1.Text:='';
    edit2.Text:='';
    edit3.Text:='';
    edit4.Text:='';
    edit5.Text:='';
    edit6.Text:='';
    edit7.Text:='';
    edit8.Text:='';
    edit9.Text:='';

    listbox1.Clear;
    listbox2.Clear;
    listbox3.Clear;

    label12.caption:='Mittelwert: ';
    label13.caption:='sigma: ';
    label11.caption:='Korrekturfaktor: ';
    label14.caption:='Oberflächenspannung: ';

    label20.caption:='Mittelwert: ';
    label21.caption:='sigma: ';
    label19.caption:='Korrekturfaktor: ';
    label22.caption:='Oberflächenspannung: ';

    label28.caption:='Mittelwert: ';
    label29.caption:='sigma: ';
    label27.caption:='Korrekturfaktor: ';
    label30.caption:='Oberflächenspannung: ';

    end;


procedure TForm3.Panel8Click(Sender: TObject);
var i:integer;
begin
if opendialog1.Execute
then
begin                         //Öffnen
resetfelder;
assignfile(F,opendialog1.FileName);
reset(F);
read(F,OFS);
closefile(F);

edit1.text:=floattostr(OFS.Rring);
edit2.text:=floattostr(OFS.r);
edit3.text:=floattostr(OFS.luft);
edit4.text:=floattostr(OFS.fl[1].dichte);
edit6.text:=floattostr(OFS.fl[2].dichte);
edit8.text:=floattostr(OFS.fl[3].dichte);

for i:=0 to OFS.fl[1].n-1 do
listbox1.Items.Add(floattostr(OFS.fl[1].spannung[i]));

for i:=0 to OFS.fl[2].n-1 do
listbox2.Items.Add(floattostr(OFS.fl[2].spannung[i]));

for i:=0 to OFS.fl[2].n-1 do
listbox3.Items.Add(floattostr(OFS.fl[3].spannung[i]));


end;
end;

procedure TForm3.Panel9Click(Sender: TObject);
begin
if savedialog1.Execute
then                              //Speichern
begin
dateneinlesen;
assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,OFS);
closefile(F);

end;
end;

end.
