unit grafik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ExtDlgs, StdCtrls, Spin;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label3: TLabel;
    RadioButton3: TRadioButton;
    Panel3: TPanel;
    Edit1: TEdit;
    RadioButton4: TRadioButton;
    Panel4: TPanel;
    RadioButton5: TRadioButton;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses main;

{$R *.dfm}

procedure TForm2.Panel1Click(Sender: TObject);
begin
form2.Visible:=False; //fenster schlieﬂen
end;

procedure TForm2.Panel2Click(Sender: TObject);
begin
form1.druckereinstellen; //drucker einstellen
end;

procedure TForm2.Panel3Click(Sender: TObject);
begin
form1.drucken; //drucken
end;

procedure TForm2.Panel4Click(Sender: TObject);
begin
form1.bildspeichern;        //Bild speichern
end;

procedure TForm2.SpinEdit3Change(Sender: TObject);
begin
if checkbox1.checked=true
then                                 //Verh‰ltnisse wahren
spinedit4.Value:=spinedit3.Value;
end;

procedure TForm2.SpinEdit4Change(Sender: TObject);
begin
if checkbox1.checked=true
then                                 //Verh‰ltnisse wahren
spinedit3.Value:=spinedit4.Value;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if checkbox1.checked=true
then                                 //Verh‰ltnisse wahren
spinedit4.Value:=spinedit3.Value;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form2.Visible:=False; //fenster schlieﬂen
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form2.Visible:=False; //fenster schlieﬂen
end;

end.
