unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, einzel, rechen3D, show3D, opti3D;

type
  TForm1 = class(TForm)
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button4Click(Sender: TObject);
begin
close;  
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
form1.Visible:=false;
Form2.Visible:=true;  
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.Visible:=false;
Form3.Visible:=true;  
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
form1.Visible:=false;
Form4.Visible:=true;  
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Form1.visible:=false;
form6.visible:=true;
end;

end.
