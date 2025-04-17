unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    Button3: TButton;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
close;  //Programm beenden
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if savedialog1.Execute
then                                     //Liste der Primzahlen speichern
listbox1.Items.SaveToFile(savedialog1.FileName);
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,e,m:longint;
    a:boolean;
    primz:array of longint;
begin                             //Berechne Primzahlen
listbox1.Clear;

m:=1;
setlength(primz,m);
primz[0]:=2;

for i:=1 to trunc((spinedit1.Value-1)/2) do
begin
a:=false;
e:=0;
repeat
if (((i*2)+1) mod primz[e]) = 0
then
a:=true;

inc(e);
until (a=true) or (e>m-1);

if a=false
then
begin
inc(m);
setlength(primz,m);
primz[m-1]:=(i*2)+1;
end;


{

listbox1.items.add(inttostr(2));
for i:=1 to round(spinedit1.Value/2) do
begin
a:=0;
e:=1;
repeat
e:=e+2;
if (((i*2)+1) mod e) = 0
then
inc(a);
until a=1;
if ((i*2)+1)=e
then
listbox1.items.add(inttostr((i*2)+1));

{
for i:=2 to spinedit1.value do
for e:=2 to i-1 do
if (i mod e) = 0
then                          ALTERNATIVE FORMEL, ABER WENIGER OPTIMIERT(SCHNELL)
inc(a);
if a=0
then
listbox1.Items.Add(inttostr(i));  }
end;

for i:=0 to m-1 do
listbox1.Items.Add(inttostr(primz[i]));
label2.Caption:=inttostr(listbox1.Items.Count)+' Primzahlen < '+inttostr(spinedit1.Value+1);
end;

end.
