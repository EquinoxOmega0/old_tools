unit serien;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure holebasispfads(pfad:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a:integer;
  p1:string;

implementation

{$R *.dfm}
uses main;

procedure TForm3.Button6Click(Sender: TObject);
begin
form3.Visible:=false;
form1.listbox4.Items.LoadFromFile(p1+'/serienliste.dat'); //Schließen und Aktualisieren
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
listbox1.Items.SaveToFile(p1+'/serienliste.dat');    //Speichern
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
if edit1.text<>''                          //Hinzufügen
then
listbox1.Items.Add(edit1.text);
end;

procedure TForm3.Button2Click(Sender: TObject);
var i:integer;
begin

a:=-1;

for i:=0 to listbox1.Items.count-1 do
if listbox1.Selected[i]=true                //Bearbeiten
then
a:=i;
edit1.Text:=listbox1.Items.Strings[a];

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
a:=-1;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin

if (a<>-1) and (edit1.text<>'')
then                                        //Akzeptieren
listbox1.Items.Strings[a]:=edit1.Text;

a:=-1;

end;

procedure TForm3.Button5Click(Sender: TObject);
var i:integer;
begin

a:=-1;

for i:=0 to listbox1.Items.count-1 do
if listbox1.Selected[i]=true                //Löschen
then
a:=i;

if a<>-1
THEN
listbox1.Items.Delete(a);

a:=-1;
end;


  procedure Tform3.holebasispfads(pfad:string);
  begin
  p1:=pfad;                                          //Basispfad übertragen

  end;

end.
