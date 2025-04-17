unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AxCtrls, OleCtrls, VCF1, StdCtrls, Grids, Spin;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox8: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    F1Book1: TF1Book;
    SpinEdit1: TSpinEdit;
    Label9: TLabel;
    Label10: TLabel;
    SpinEdit2: TSpinEdit;
    F1Book2: TF1Book;
    Label11: TLabel;
    SpinEdit3: TSpinEdit;
    F1Book3: TF1Book;
    Label12: TLabel;
    SpinEdit4: TSpinEdit;
    F1Book4: TF1Book;
    Label13: TLabel;
    SpinEdit5: TSpinEdit;
    F1Book5: TF1Book;
    F1Book6: TF1Book;
    Label14: TLabel;
    SpinEdit6: TSpinEdit;
    F1Book7: TF1Book;
    SpinEdit7: TSpinEdit;
    Label15: TLabel;
    F1Book8: TF1Book;
    SpinEdit8: TSpinEdit;
    Label16: TLabel;
    F1Book9: TF1Book;
    F1Book10: TF1Book;
    F1Book11: TF1Book;
    F1Book12: TF1Book;
    SpinEdit9: TSpinEdit;
    SpinEdit10: TSpinEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SpinEdit11: TSpinEdit;
    Label20: TLabel;
    SpinEdit12: TSpinEdit;
    Label21: TLabel;
    SpinEdit13: TSpinEdit;
    Label22: TLabel;
    SpinEdit14: TSpinEdit;
    Label23: TLabel;
    SpinEdit15: TSpinEdit;
    Label24: TLabel;
    SpinEdit16: TSpinEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox6: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure SpinEdit5Change(Sender: TObject);
    procedure SpinEdit8Change(Sender: TObject);
    procedure SpinEdit6Change(Sender: TObject);
    procedure SpinEdit7Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpinEdit9Change(Sender: TObject);
    procedure SpinEdit10Change(Sender: TObject);
    procedure SpinEdit11Change(Sender: TObject);
    procedure SpinEdit12Change(Sender: TObject);
    procedure SpinEdit13Change(Sender: TObject);
    procedure SpinEdit14Change(Sender: TObject);
    procedure SpinEdit15Change(Sender: TObject);
    procedure SpinEdit16Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function Typenerkennung(t:string):integer;
    procedure Addition;
    procedure Subtraktion;
    procedure Multiplikation(art:integer);
    Procedure Dimensionscheck;
    procedure Ausgabe;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type  Tspalte=record
  spalte:array of extended;
  end;

  type TWerte=record
  zeile:array of Tspalte;
  end;

var
  Form1: TForm1;
  sss:string;
 operator:string;
    va:array[1..3] of integer;
   dim:array[1..3,1..2] of integer;
  daten:array[1..3] of string;
  werte:array[1..3] of TWerte;
  metriktyp:integer;

implementation

{$R *.dfm}

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
F1Book1.MaxRow:=spinedit1.Value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
F1Book2.MaxRow:=spinedit2.Value;
end;

procedure TForm1.SpinEdit3Change(Sender: TObject);
begin
F1Book3.MaxRow:=spinedit3.Value;
end;

procedure TForm1.SpinEdit4Change(Sender: TObject);
begin
F1Book4.MaxRow:=spinedit4.Value;
end;

procedure TForm1.SpinEdit5Change(Sender: TObject);
begin
F1Book5.MaxRow:=spinedit5.Value;
end;

procedure TForm1.SpinEdit8Change(Sender: TObject);
begin
F1Book8.MaxRow:=spinedit8.Value;
end;

procedure TForm1.SpinEdit6Change(Sender: TObject);
begin
F1Book6.MaxRow:=spinedit6.Value;
end;

procedure TForm1.SpinEdit7Change(Sender: TObject);
begin
F1Book7.MaxRow:=spinedit7.Value;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
memo1.Clear;

end;

procedure TForm1.SpinEdit9Change(Sender: TObject);
begin
F1Book9.MaxCol:=spinedit9.Value;
end;

procedure TForm1.SpinEdit10Change(Sender: TObject);
begin
F1Book9.MaxRow:=spinedit10.Value;
end;

procedure TForm1.SpinEdit11Change(Sender: TObject);
begin
F1Book10.MaxCol:=spinedit11.Value;
end;

procedure TForm1.SpinEdit12Change(Sender: TObject);
begin
F1Book10.MaxRow:=spinedit12.Value;
end;

procedure TForm1.SpinEdit13Change(Sender: TObject);
begin
F1Book11.MaxCol:=spinedit13.Value;
end;

procedure TForm1.SpinEdit14Change(Sender: TObject);
begin
F1Book11.MaxRow:=spinedit14.Value;
end;

procedure TForm1.SpinEdit15Change(Sender: TObject);
begin
F1Book12.MaxCol:=spinedit15.Value;
end;

procedure TForm1.SpinEdit16Change(Sender: TObject);
begin
F1Book12.MaxRow:=spinedit16.Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
sss:=Memo1.Lines.Strings[0];
if sss[2]='='
then
begin
daten[3]:=sss[1];
daten[1]:=sss[3];
operator:=sss[4];
daten[2]:=sss[5];
end
else
Memo1.Lines.Add('Syntax Fehler!');

for i:=1 to 3 do
va[i]:=typenerkennung(daten[i]);


Dimensionscheck;

if operator='+'
then
begin

if va[1]=va[2]
then
begin
if va[1]=va[3]
then
Addition;
end
else
Memo1.Lines.Add('Typen nicht kompatibel!');

end
else if operator='-'
then
begin


if va[1]=va[2]
then
begin
if va[1]=va[3]
then
Subtraktion;
end
else
Memo1.Lines.Add('Typen nicht kompatibel!');

end
else
if operator='*'
then
begin

if (va[1]=1) and (va[2]=1)
then
begin
if va[3]=1
then
Multiplikation(1)           //2 Sklare
else
Memo1.Lines.Add('Typen nicht kompatibel!');
end;

if ((va[1]=2) and (va[2]=1) ) or ((va[1]=1) and (va[2]=2))
then
begin
if va[3]=2
then
Multiplikation(2)         //Sklare  mit Vektor
else
Memo1.Lines.Add('Typen nicht kompatibel!');
end;

if ((va[1]=3) and (va[2]=1) ) or ((va[1]=1) and (va[2]=3))
then
begin
if va[3]=3
then
Multiplikation(3)         //Sklare  mit Einsform
else
Memo1.Lines.Add('Typen nicht kompatibel!');
end;

if ((va[1]=4) and (va[2]=1) ) or ((va[1]=1) and (va[2]=4))
then
begin
if va[3]=4
then
Multiplikation(4)         //Sklare  mit Matrix
else
Memo1.Lines.Add('Typen nicht kompatibel!');
end;

if ((va[1]=2) and (va[2]=3) ) or ((va[1]=3) and (va[2]=2)) or ((va[1]=2) and (va[2]=2) ) or ((va[1]=3) and (va[2]=3))
then
begin
if va[3]=1
then
Multiplikation(5)                 // Vektor mit Einsform = Sklara
else if (va[3]=2) or (va[3]=3)
then
Multiplikation(6)                 // Vektor mit Einsform  = Vektor oder Einsform
else if va[3]=4
then
Multiplikation(7)                 // Vektor mit Einsform = Matrix
else
Memo1.Lines.Add('Typen nicht kompatibel!');
end;

if ((va[1]=4) and (va[2]=2))  or ((va[1]=4) and (va[2]=3)) or ((va[1]=2) and (va[2]=4))  or ((va[1]=3) and (va[2]=4))  or ((va[1]=4) and (va[2]=4))
then
begin
if va[3]=4
then
Multiplikation(7)     //Vektor/Einsform mit Matrix  oder Matrix mit Matrix = Matrix
else
Memo1.Lines.Add('Typen nicht kompatibel!');
end;

end
else
Memo1.Lines.Add('Syntax Fehler!');
Ausgabe;
end;

function TForm1.Typenerkennung(t:string):integer;
begin
if (t='a') or  (t='b') or (t='g') or (t='d') or (t='m') or (t='c') or (t='x') or (t='r')
then
Typenerkennung:=1
else if (t='v') or (t='w') or (t='e') or (t='n')
then
Typenerkennung:=2
else if (t='h') or (t='j') or (t='k') or (t='l')
then
Typenerkennung:=3
else if (t='R') or (t='S') or (t='T') or (t='U')
then
Typenerkennung:=4
else
begin
Memo1.Lines.Add('Syntax Fehler!');
Typenerkennung:=0;
end;

end;


 procedure TForm1.Addition;
 var i1,i2:integer;
 begin        //+
 if (Dim[1,1]=Dim[2,1]) and  (Dim[1,1]=Dim[3,1])
 then if (Dim[1,2]=Dim[2,2]) and (Dim[1,2]=Dim[3,2])
 then
 begin
 for i1:=0 to Dim[1,1]-1 do
 for i2:=0 to Dim[1,2]-1 do
 werte[3].zeile[i1].spalte[i2]:=werte[1].zeile[i1].spalte[i2]+werte[2].zeile[i1].spalte[i2];

 end
 else
 Memo1.Lines.Add('Dimensionen nicht verträglich!');

 end;


    procedure TForm1.Subtraktion;
     var i1,i2:integer;
 begin        //-
 if (Dim[1,1]=Dim[2,1]) and  (Dim[1,1]=Dim[3,1])
 then if (Dim[1,2]=Dim[2,2]) and (Dim[1,2]=Dim[3,2])
 then
 begin
 for i1:=0 to Dim[1,1]-1 do
 for i2:=0 to Dim[1,2]-1 do
 werte[3].zeile[i1].spalte[i2]:=werte[1].zeile[i1].spalte[i2]+werte[2].zeile[i1].spalte[i2];

 end
 else
 Memo1.Lines.Add('Dimensionen nicht verträglich!');
 end;

    procedure TForm1.Multiplikation(art:integer);
    var i,ii,iii:integer;
        aa,bb,cc:array[1..3] of extended;
     begin        //*
     case art of

     1:begin
     werte[3].zeile[0].spalte[0]:=werte[1].zeile[0].spalte[0]*werte[2].zeile[0].spalte[0];
     end;

     2:begin
     if va[1]=2
     then
     begin
     for i:=0 to dim[1,1]-1 do
     werte[3].zeile[i].spalte[0]:=werte[1].zeile[i].spalte[0]*werte[2].zeile[0].spalte[0];
     end
     else
     begin
     for i:=0 to dim[2,1]-1 do
     werte[3].zeile[i].spalte[0]:=werte[1].zeile[0].spalte[0]*werte[2].zeile[i].spalte[0];
     end;
     end;

     3:begin
     if va[1]=3
     then
     begin
     for i:=0 to dim[1,2]-1 do
     werte[3].zeile[0].spalte[i]:=werte[1].zeile[0].spalte[i]*werte[2].zeile[0].spalte[0];
     end
     else
     begin
     for i:=0 to dim[2,2]-1 do
     werte[3].zeile[0].spalte[i]:=werte[1].zeile[0].spalte[0]*werte[2].zeile[0].spalte[i];
     end;
     end;

     4:begin
     if va[1]=4
     then
     begin
     for i:=0 to dim[1,1]-1 do
     for ii:=0 to dim[1,2]-1 do
     werte[3].zeile[i].spalte[ii]:=werte[1].zeile[i].spalte[ii]*werte[2].zeile[0].spalte[0];
     end
     else
     begin
     for i:=0 to dim[2,1]-1 do
     for ii:=0 to dim[2,2]-1 do
     werte[3].zeile[i].spalte[ii]:=werte[1].zeile[0].spalte[0]*werte[2].zeile[i].spalte[ii];
     end;
     end;

     5:begin
     
     if va[1]=va[2]
     then
     begin
     if va[1]=2
     then
     begin
     case metriktyp of
     1:begin
     werte[3].zeile[0].spalte[0]:=0;
     for i:=0 to Dim[1,1]-1 do
     werte[3].zeile[0].spalte[0]:=werte[3].zeile[0].spalte[0]+werte[1].zeile[i].spalte[0]*werte[2].zeile[i].spalte[0];
     end;
     2:begin
     if dim[1,1]=4
     then
     begin
     werte[3].zeile[0].spalte[0]:=-werte[1].zeile[0].spalte[0]*werte[2].zeile[0].spalte[0];;
     for i:=1 to 3 do
     werte[3].zeile[0].spalte[0]:=werte[3].zeile[0].spalte[0]+werte[1].zeile[i].spalte[0]*werte[2].zeile[i].spalte[0];
     end;
     end;
     3:begin

     end;
     end;
     end
     else
     begin
     case metriktyp of
     1:begin
     werte[3].zeile[0].spalte[0]:=0;
     for i:=0 to Dim[1,2]-1 do
     werte[3].zeile[0].spalte[0]:=werte[3].zeile[0].spalte[0]+werte[1].zeile[0].spalte[i]*werte[2].zeile[0].spalte[i];
     end;
     2:begin
     if dim[1,2]=4
     then
     begin
     werte[3].zeile[0].spalte[0]:=-werte[1].zeile[0].spalte[0]*werte[2].zeile[0].spalte[0];;
     for i:=1 to 3 do
     werte[3].zeile[0].spalte[0]:=werte[3].zeile[0].spalte[0]+werte[1].zeile[0].spalte[i]*werte[2].zeile[0].spalte[i];
     end;
     end;
     3:begin

     end;
     end;
     end;
     end
     else
     begin
     if va[1]=2
     then
     begin
     werte[3].zeile[0].spalte[0]:=0;
     for i:=0 to Dim[1,1]-1 do
     werte[3].zeile[0].spalte[0]:=werte[3].zeile[0].spalte[0]+werte[1].zeile[i].spalte[0]*werte[2].zeile[0].spalte[i];
     end
     else
     begin
     werte[3].zeile[0].spalte[0]:=0;
     for i:=0 to Dim[2,1]-1 do
     werte[3].zeile[0].spalte[0]:=werte[3].zeile[0].spalte[0]+werte[2].zeile[i].spalte[0]*werte[1].zeile[0].spalte[i];
     end;
     end;
     
     end;

     6:begin
     if va[1]=2
     then
     for i:=0 to 2 do
     aa[i+1]:=werte[1].zeile[i].spalte[0]
     else
     for i:=0 to 2 do
     aa[i+1]:=werte[1].zeile[0].spalte[i];
     if va[2]=2
     then
     for i:=0 to 2 do
     bb[i+1]:=werte[2].zeile[i].spalte[0]
     else
     for i:=0 to 2 do
     bb[i+1]:=werte[2].zeile[0].spalte[i];

     cc[1]:=aa[2]*bb[3]-aa[3]*bb[2];
     cc[2]:=aa[3]*bb[1]-aa[1]*bb[3];
     cc[3]:=aa[1]*bb[2]-aa[2]*bb[1];

     if va[3]=2
     then
     for i:=0 to 2 do
     werte[3].zeile[i].spalte[0]:=cc[i+1]
     else
     for i:=0 to 2 do
     werte[3].zeile[0].spalte[i]:=cc[i+1];
     
     end;

     7:begin
     if (dim[1,2]=dim[2,1])
     then
     begin
     for i:=0 to dim[3,1] do
     for ii:=0 to dim[3,2] do
     begin
     werte[3].zeile[i].spalte[ii]:=0;
     for iii:=0 to dim[1,2]-1 do
     werte[3].zeile[i].spalte[ii]:=werte[3].zeile[i].spalte[ii]+werte[1].zeile[i].spalte[iii]*werte[2].zeile[iii].spalte[ii];

     end;
     
     end
     else
     Memo1.Lines.Add('Dimensionen nicht verträglich!');
     end;

     end;
                                   

 end;
     

     Procedure Tform1.Dimensionscheck;
 var i,i1,i2:integer;
 begin               //
 
 for i:=1 to 3 do
 begin

if (daten[i]='a') 
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;
setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit1.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit1.Text);

end;


if   (daten[i]='b')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;
setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit2.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit2.Text);


end;

if   (daten[i]='g')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit3.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit3.Text);

end;

if   (daten[i]='d')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit4.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit4.Text);

end;

if   (daten[i]='m')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit5.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit5.Text);

end;

if   (daten[i]='c')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;
setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit6.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit6.Text);

end;

if   (daten[i]='x')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit7.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit7.Text);

end;

if   (daten[i]='o')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);
if edit8.text<>''
then
werte[i].zeile[0].spalte[0]:=strtofloat(edit8.Text);

end;



if (daten[i]='v')
then
begin
Dim[i,1]:=spinedit1.Value;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);
werte[i].zeile[i1].spalte[0]:=strtofloat(F1Book1.TextRC[i1+1,1]);
end;

end;                                

if (daten[i]='w')
then
begin
Dim[i,1]:=spinedit2.Value;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);
werte[i].zeile[i1].spalte[0]:=strtofloat(F1Book2.TextRC[i1+1,1]);
end;

end;                

if (daten[i]='e')
then
begin
Dim[i,1]:=spinedit3.Value;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);
werte[i].zeile[i1].spalte[0]:=strtofloat(F1Book3.TextRC[i1+1,1]);
end;

end;

if (daten[i]='n')
then
begin
Dim[i,1]:=spinedit4.Value;
Dim[i,2]:=1;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);
werte[i].zeile[i1].spalte[0]:=strtofloat(F1Book4.TextRC[i1+1,1]);
end;

end;

if (daten[i]='h')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=spinedit5.Value;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);

for i1:=0 to Dim[i,2]-1 do
werte[i].zeile[0].spalte[i1]:=strtofloat(F1Book5.TextRC[i1+1,1]);


end;

if (daten[i]='j')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=spinedit6.Value;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);

for i1:=0 to Dim[i,2]-1 do
werte[i].zeile[0].spalte[i1]:=strtofloat(F1Book6.TextRC[i1+1,1]);

end;

if (daten[i]='k')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=spinedit7.Value;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);

for i1:=0 to Dim[i,2]-1 do
werte[i].zeile[0].spalte[i1]:=strtofloat(F1Book7.TextRC[i1+1,1]);

end;

if (daten[i]='l')
then
begin
Dim[i,1]:=1;
Dim[i,2]:=spinedit8.Value;

setlength(werte[i].zeile,Dim[i,1]);
setlength(werte[i].zeile[0].spalte,Dim[i,2]);

for i1:=0 to Dim[i,2]-1 do
werte[i].zeile[0].spalte[i1]:=strtofloat(F1Book8.TextRC[i1+1,1]);

end;

if (daten[i]='R')
then
begin
Dim[i,1]:=spinedit9.Value;
Dim[i,2]:=spinedit10.Value;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);

for i2:=0 to Dim[i,2]-1 do
werte[i].zeile[i1].spalte[i2]:=strtofloat(F1Book9.TextRC[i1+1,i2+1]);

end;


end;

if (daten[i]='S')
then
begin
Dim[i,1]:=spinedit11.Value;
Dim[i,2]:=spinedit12.Value;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);

for i2:=0 to Dim[i,2]-1 do
werte[i].zeile[i1].spalte[i2]:=strtofloat(F1Book10.TextRC[i1+1,i2+1]);

end;

end;

if (daten[i]='T')
then
begin
Dim[i,1]:=spinedit13.Value;
Dim[i,2]:=spinedit14.Value;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);

for i2:=0 to Dim[i,2]-1 do
werte[i].zeile[i1].spalte[i2]:=strtofloat(F1Book11.TextRC[i1+1,i2+1]);

end;

end;

if (daten[i]='U')
then
begin
Dim[i,1]:=spinedit15.Value;
Dim[i,2]:=spinedit16.Value;

setlength(werte[i].zeile,Dim[i,1]);
for i1:=0 to Dim[i,1]-1 do
begin
setlength(werte[i].zeile[i1].spalte,Dim[i,2]);

for i2:=0 to Dim[i,2]-1 do
werte[i].zeile[i1].spalte[i2]:=strtofloat(F1Book12.TextRC[i1+1,i2+1]);

end;

end;


 end;
 
 end;


     procedure Tform1.Ausgabe;
     var i1,i2:integer;
     begin               //

     if (daten[3]='a')
then
edit1.Text:=floattostr(werte[3].zeile[0].spalte[0]);


if   (daten[3]='b')
then
edit2.Text:=floattostr(werte[3].zeile[0].spalte[0]);

if   (daten[3]='g')
then
edit3.Text:=floattostr(werte[3].zeile[0].spalte[0]);

if   (daten[3]='d')
then
edit4.Text:=floattostr(werte[3].zeile[0].spalte[0]);

if   (daten[3]='m')
then
edit5.Text:=floattostr(werte[3].zeile[0].spalte[0]);

if   (daten[3]='c')
then
edit6.Text:=floattostr(werte[3].zeile[0].spalte[0]);

if   (daten[3]='x')
then
edit7.Text:=floattostr(werte[3].zeile[0].spalte[0]);

if   (daten[3]='o')
then
edit8.Text:=floattostr(werte[3].zeile[0].spalte[0]);



if (daten[3]='v')
then
for i1:=0 to Dim[3,1]-1 do
F1Book1.TextRC[i1+1,1]:=floattostr(werte[3].zeile[i1].spalte[0]);




if (daten[3]='w')
then
for i1:=0 to Dim[3,1]-1 do
F1Book2.TextRC[i1+1,1]:=floattostr(werte[3].zeile[i1].spalte[0]);

if (daten[3]='e')
then
for i1:=0 to Dim[3,1]-1 do
F1Book3.TextRC[i1+1,1]:=floattostr(werte[3].zeile[i1].spalte[0]);

if (daten[3]='n')
then
for i1:=0 to Dim[3,1]-1 do
F1Book4.TextRC[i1+1,1]:=floattostr(werte[3].zeile[i1].spalte[0]);

if (daten[3]='h')
then
for i1:=0 to Dim[3,2]-1 do
F1Book5.TextRC[i1+1,1]:=floattostr(werte[3].zeile[0].spalte[i1]);


if (daten[3]='j')
then
for i1:=0 to Dim[3,2]-1 do
F1Book6.TextRC[i1+1,1]:=floattostr(werte[3].zeile[0].spalte[i1]);

if (daten[3]='k')
then
for i1:=0 to Dim[3,2]-1 do
F1Book7.TextRC[i1+1,1]:=floattostr(werte[3].zeile[0].spalte[i1]);

if (daten[3]='l')
then
for i1:=0 to Dim[3,2]-1 do
F1Book8.TextRC[i1+1,1]:=floattostr(werte[3].zeile[0].spalte[i1]);


if (daten[3]='R')
then
for i1:=0 to Dim[3,1]-1 do
for i2:=0 to Dim[3,2]-1 do
F1Book9.TextRC[i1+1,i2+1]:=floattostr(werte[3].zeile[i1].spalte[i2]);


if (daten[3]='S')
then
for i1:=0 to Dim[3,1]-1 do
for i2:=0 to Dim[3,2]-1 do
F1Book10.TextRC[i1+1,i2+1]:=floattostr(werte[3].zeile[i1].spalte[i2]);

if (daten[3]='T')
then
for i1:=0 to Dim[3,1]-1 do
for i2:=0 to Dim[3,2]-1 do
F1Book11.TextRC[i1+1,i2+1]:=floattostr(werte[3].zeile[i1].spalte[i2]);

if (daten[3]='U')
then
for i1:=0 to Dim[3,1]-1 do
for i2:=0 to Dim[3,2]-1 do
F1Book12.TextRC[i1+1,i2+1]:=floattostr(werte[3].zeile[i1].spalte[i2]);

     end;


procedure TForm1.FormCreate(Sender: TObject);
begin
metriktyp:=1;
end;

end.
