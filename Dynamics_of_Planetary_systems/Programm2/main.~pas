unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    SpinEdit2: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit3: TSpinEdit;
    Label5: TLabel;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Button6: TButton;
    Button7: TButton;
    Label8: TLabel;
    Button8: TButton;
    Memo1: TMemo;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
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
close;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
listbox1.Clear;
Label6.caption:='0';
label7.caption:='0';
end;

procedure TForm1.Button1Click(Sender: TObject);
var F:textfile;
    s,z:string;
    i,e,a:integer;
    info:boolean;
begin

if opendialog1.Execute
then
begin
assignfile(F,opendialog1.filename);
reset(F);
Readln(F,s);
Readln(F,s);
Readln(F,s);
Readln(F,s);
while EOF(F)=false do
begin
for i:=1 to spinedit2.value do
begin
readln(F,s);
if i=spinedit1.Value
then
begin
z:='';
a:=-1;
info:=false;
For e:=0 to length(s) do
begin
if s[e]<>' '
then
begin

if info=false
then
begin
inc(a);
info:=true;
end;

if a=spinedit3.Value
then
begin
if s[e]='.'
then
z:=z+','
else
z:=z+s[e];
end;

end
else
info:=false;

end;
listbox1.Items.Add(z);
end;
end;

end;

closefile(F);
end;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
if savedialog1.Execute
then
listbox1.Items.SaveToFile(savedialog1.filename);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,a:integer;
begin
a:=0;
for i:=1 to listbox1.Items.Count-1 do
begin
if (listbox1.Items.Strings[i])>(listbox1.Items.Strings[a])
then
a:=i;

end;

Label6.Caption:=inttostr(a)+' = '+listbox1.Items.Strings[a];

end;

procedure TForm1.Button5Click(Sender: TObject);
var i,a:integer;
begin
a:=0;
for i:=1 to listbox1.Items.Count-1 do
begin
if (listbox1.Items.Strings[i])<(listbox1.Items.Strings[a])
then
a:=i;
end;

Label7.Caption:=inttostr(a)+' = '+listbox1.Items.Strings[a];

end;

procedure TForm1.Button7Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;
for i:=0 to listbox1.items.count-1 do
if listbox1.selected[i]=true
then
a:=i;
if a<>-1
then
Label8.caption:=inttostr(a);
end;

procedure TForm1.Button8Click(Sender: TObject);
var ii,e,a,i:integer;
    F:textfile;
    s,z:string;
    info:boolean;
begin
if opendialog1.Execute
then
begin
for ii:=2 to 12 do
begin
spinedit1.Value:=ii;
listbox1.Clear;




assignfile(F,opendialog1.filename);
reset(F);
Readln(F,s);
Readln(F,s);
Readln(F,s);
Readln(F,s);
while EOF(F)=false do
begin
for i:=1 to spinedit2.value do
begin
readln(F,s);
if i=spinedit1.Value
then
begin
z:='';
a:=-1;
info:=false;
For e:=0 to length(s)-1 do
begin
if s[e]<>' '
then
begin

if info=false
then
begin
inc(a);
info:=true;
end;

if a=spinedit3.Value
then
begin
if s[e]='.'
then
z:=z+','
else
z:=z+s[e];
end;

end
else
info:=false;

end;
listbox1.Items.Add(z);
end;
end;

end;

closefile(F);




a:=0;
for e:=1 to listbox1.Items.Count-1 do
begin
if (listbox1.Items.Strings[e]>listbox1.Items.Strings[a])
then
a:=i;
end;
Memo1.Lines.Add(listbox1.Items.Strings[a]);
listbox1.Clear;
end;

end; end;

end.
