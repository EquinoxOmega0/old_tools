unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, zaehe, oberfl, warm, gas, batt, glueh, wider, beug, linsen, spekt;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Panel1Click(Sender: TObject);
begin
form1.Visible:=false;
form2.Visible:=true;     //�ffne Formular Z�higkeit
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
close;               //beende Programm
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
form1.visible:=false;
form3.Visible:=true;           //�ffne Formular Oberfl�chenspannung
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
form1.visible:=false;    //�ffne Fornmular W�rmekapazit�ten
form4.Visible:=true;
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Gasthermometer
form5.Visible:=true;
end;

procedure TForm1.Panel6Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Batterie
form6.Visible:=true;
end;

procedure TForm1.Panel7Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Gl�hbirne
form7.Visible:=true;
end;

procedure TForm1.Panel8Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Widerst�nde
form8.Visible:=true;
end;

procedure TForm1.Panel9Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Gitterbeugung
form9.Visible:=true;
end;

procedure TForm1.Panel10Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Linsensysteme
form10.Visible:=true;
end;

procedure TForm1.Panel11Click(Sender: TObject);
begin
form1.Visible:=false;  //�ffne Formular Spektroskop
form11.Visible:=true;
end;

end.
