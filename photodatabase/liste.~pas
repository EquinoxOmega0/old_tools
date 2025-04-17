unit liste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ListBox1: TListBox;
    RadioButton3: TRadioButton;
    ListBox2: TListBox;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    RadioButton5: TRadioButton;
    Edit2: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
uses main;

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.Visible:=false;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin

form1.NeuListe(true);
form4.Visible:=false;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin

form1.NeuListe(false);
form4.Visible:=false;
end;

end.
