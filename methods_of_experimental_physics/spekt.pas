unit spekt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, math, StdCtrls, ExtCtrls;

type
  TForm11 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Edit4: TEdit;
    Label10: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox1: TListBox;
    Panel3: TPanel;
    Label11: TLabel;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit5: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    ListBox2: TListBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    ListBox3: TListBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Label15: TLabel;
    Edit6: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit7: TEdit;
    Label18: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    ListBox4: TListBox;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel10Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel14Click(Sender: TObject);
    procedure Einlesen;
    procedure Panel9Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
      private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Tspektdat = record
  gitter,f1,f2:extended;
  rot,blau:array[0..1,0..2] of extended;
  end;

var
  Form11: TForm11;
  sdat:Tspektdat;

implementation

uses main;

{$R *.dfm}

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form11.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm11.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form11.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm11.Panel10Click(Sender: TObject);
begin
form11.visible:=false;
form1.visible:=true;    //Ins Hauptmenü wechseln
end;

procedure TForm11.Panel7Click(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';    //Neu
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.text:='';
edit7.text:='';

listbox1.Clear;
listbox2.Clear;
listbox3.Clear;
listbox4.clear;
end;

procedure TForm11.Panel1Click(Sender: TObject);
begin
if (listbox1.Items.count<3) and (edit4.text<>'')
then
listbox1.Items.add(edit4.text);           //Messwerte rot l hinzu
edit4.text:='';
end;

procedure TForm11.Panel4Click(Sender: TObject);
begin
if (listbox2.Items.count<3) and (edit5.text<>'')
then
listbox2.Items.add(edit5.text);           //Messwerte blau l hinzu
edit5.text:='';
end;

procedure TForm11.Panel11Click(Sender: TObject);
begin
if (listbox3.Items.count<3) and (edit6.text<>'')
then
listbox3.Items.add(edit6.text);           //Messwerte rot r hinzu
edit6.text:='';
end;

procedure TForm11.Panel14Click(Sender: TObject);
begin
if (listbox4.Items.count<3) and (edit7.text<>'')
then
listbox4.Items.add(edit7.text);           //Messwerte blau r hinzu
edit7.text:='';
end;

Procedure Tform11.einlesen;
var i:integer;
begin                             //Einlesen der Werte
sdat.gitter:=strtofloat(edit1.Text);
sdat.f1:=strtofloat(edit2.Text);
sdat.f2:=strtofloat(edit3.Text);

for i:=0 to 2 do
begin
sdat.rot[0,i]:=strtofloat(listbox1.Items.Strings[i]);
sdat.blau[0,i]:=strtofloat(listbox2.Items.Strings[i]);
sdat.rot[1,i]:=strtofloat(listbox3.Items.Strings[i]);
sdat.blau[1,i]:=strtofloat(listbox4.Items.Strings[i]);
end;

end;

procedure TForm11.Panel9Click(Sender: TObject);
var F:file of Tspektdat;
begin
if savedialog1.Execute
then                    //Speichern
begin
einlesen;
assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,sdat);
closefile(F);
end;
end;

procedure TForm11.Panel8Click(Sender: TObject);
var F:file of Tspektdat;
i:integer;
begin
if opendialog1.Execute
then
begin
assignfile(F,opendialog1.FileName);
reset(F);
read(F,sdat);
closefile(F);

edit1.text:=floattostr(sdat.gitter);
edit2.text:=floattostr(sdat.f1);
edit3.text:=floattostr(sdat.f1);

Edit4.Text:='';
Edit5.Text:='';
Edit6.text:='';
edit7.text:='';

listbox1.Clear;
listbox2.Clear;
listbox3.Clear;
listbox4.clear;

for i:=0 to 2 do
begin
listbox1.Items.Add(floattostr(sdat.rot[0,i]));
listbox2.Items.Add(floattostr(sdat.blau[0,i]));
listbox3.Items.Add(floattostr(sdat.rot[1,i]));
listbox4.Items.Add(floattostr(sdat.blau[1,i]));
end;

end;
end;

procedure TForm11.Panel3Click(Sender: TObject);
begin
einlesen;  //Berechne rot


end;

procedure TForm11.Panel6Click(Sender: TObject);
begin
einlesen;  //Berechne blau


end;

end.
