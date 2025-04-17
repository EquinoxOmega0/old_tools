unit show3D;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GL3dform;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses main;

{$R *.dfm}

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form4.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form4.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.Visible:=false;
Form1.Visible:=true;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
form4.visible:=False;
form5.laden;
Form5.Bildschirmvoll;
form5.Visible:=true;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
if opendialog1.Execute
then
begin
edit1.text:=opendialog1.FileName;
end;
end;

procedure TForm4.Button4Click(Sender: TObject);
var s:string;
    lang:integer;
    TF:Textfile;
begin

s:=edit1.Text;
lang:=length(s);
s[lang-7]:='i';
s[lang-6]:='n';
s[lang-5]:='f';
s[lang-4]:='o';

assignfile(TF,s);
reset(TF);
readln(TF,s);
Label2.Caption:='x-Auflösung: '+s;
readln(TF,s);
Label3.Caption:='y-Auflösung: '+s;
readln(TF,s);
Label4.Caption:='k-Auflösung: '+s;
readln(TF,s);
Label5.Caption:='kmin: '+s;
readln(TF,s);
Label6.Caption:='kmax: '+s;
readln(TF,s);
Label7.Caption:='Iterationen: '+s;
closefile(TF);
end;

end.
