unit linsen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, math, StdCtrls, ExtCtrls;

type
  TForm10 = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    GroupBox5: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    GroupBox6: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    GroupBox7: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Panel2: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Panel3: TPanel;
    Label57: TLabel;
    Label58: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    GroupBox8: TGroupBox;
    Label59: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GroupBox9: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    GroupBox10: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    GroupBox11: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Panel7: TPanel;
    Label87: TLabel;
    Label88: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Panel1Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure NeuNeu;
    procedure Einlesen1;
    procedure Einlesen2;
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel7Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type Tbildgegen=record
  b,g:array[0..1,0..2] of extended;
  end;

  type Tlinsendat =record
  linse1,linse2,system:TBildgegen;
  end;

var
  Form10: TForm10;
  ldat:Tlinsendat;

implementation

uses main;

{$R *.dfm}

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form10.visible:=false;
form1.visible:=true;    //Ins Hauptmen� wechseln
end;

procedure TForm10.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form10.visible:=false;
form1.visible:=true;    //Ins Hauptmen� wechseln
end;

procedure TForm10.Panel1Click(Sender: TObject);
begin
form10.visible:=false;
form1.visible:=true;    //Ins Hauptmen� wechseln
end;

procedure TForm10.Panel4Click(Sender: TObject);
begin                       //Neu
NeuNeu;
end;

   procedure Tform10.NeuNeu;
   begin                //Felder l�schen
   edit1.Text:='';
   edit2.Text:='';
   edit3.Text:='';
   edit4.Text:='';
   edit5.Text:='';
   edit6.Text:='';
   edit7.Text:='';
   edit8.Text:='';
   edit9.Text:='';
   edit10.Text:='';
   edit11.Text:='';
   edit12.Text:='';
   edit13.Text:='';
   edit14.Text:='';
   edit15.Text:='';
   edit16.Text:='';
   edit17.Text:='';
   edit18.Text:='';
   edit19.Text:='';
   edit20.Text:='';
   edit21.Text:='';
   edit22.Text:='';
   edit23.Text:='';
   edit24.Text:='';
   edit25.Text:='';
   edit26.Text:='';
   edit27.Text:='';
   edit28.Text:='';
   edit29.Text:='';
   edit30.Text:='';
   edit31.Text:='';
   edit32.Text:='';
   edit33.Text:='';
   edit34.Text:='';
   edit35.Text:='';
   edit36.Text:='';
   
   end;
   
    procedure Tform10.Einlesen1;
    begin          //Einlesen der Daten  Besslsches
    
    ldat.linse1.g[0,0]:=strtofloat(edit1.text);
    ldat.linse1.b[0,0]:=strtofloat(edit2.text);
    ldat.linse1.g[1,0]:=strtofloat(edit3.text);
    ldat.linse1.b[1,0]:=strtofloat(edit4.text);

    ldat.linse1.g[0,1]:=strtofloat(edit5.text);
    ldat.linse1.b[0,1]:=strtofloat(edit6.text);
    ldat.linse1.g[1,1]:=strtofloat(edit7.text);
    ldat.linse1.b[1,1]:=strtofloat(edit8.text);

    ldat.linse1.g[0,2]:=strtofloat(edit9.text);
    ldat.linse1.b[0,2]:=strtofloat(edit10.text);
    ldat.linse1.g[1,2]:=strtofloat(edit11.text);
    ldat.linse1.b[1,2]:=strtofloat(edit12.text);

    ldat.linse2.g[0,0]:=strtofloat(edit13.text);
    ldat.linse2.b[0,0]:=strtofloat(edit14.text);
    ldat.linse2.g[1,0]:=strtofloat(edit15.text);
    ldat.linse2.b[1,0]:=strtofloat(edit16.text);

    ldat.linse2.g[0,1]:=strtofloat(edit17.text);
    ldat.linse2.b[0,1]:=strtofloat(edit18.text);
    ldat.linse2.g[1,1]:=strtofloat(edit19.text);
    ldat.linse2.b[1,1]:=strtofloat(edit20.text);

    ldat.linse2.g[0,2]:=strtofloat(edit21.text);
    ldat.linse2.b[0,2]:=strtofloat(edit22.text);
    ldat.linse2.g[1,2]:=strtofloat(edit23.text);
    ldat.linse2.b[1,2]:=strtofloat(edit24.text);
    end;


        procedure Tform10.Einlesen2;
    begin          //Einlesen der Daten  System

    ldat.system.g[0,0]:=strtofloat(edit25.text);
    ldat.system.b[0,0]:=strtofloat(edit26.text);
    ldat.system.g[1,0]:=strtofloat(edit27.text);
    ldat.system.b[1,0]:=strtofloat(edit28.text);

    ldat.system.g[0,1]:=strtofloat(edit29.text);
    ldat.system.b[0,1]:=strtofloat(edit30.text);
    ldat.system.g[1,1]:=strtofloat(edit31.text);
    ldat.system.b[1,1]:=strtofloat(edit32.text);

    ldat.system.g[0,2]:=strtofloat(edit33.text);
    ldat.system.b[0,2]:=strtofloat(edit34.text);
    ldat.system.g[1,2]:=strtofloat(edit35.text);
    ldat.system.b[1,2]:=strtofloat(edit36.text);

    end;

procedure TForm10.Panel2Click(Sender: TObject);
begin
Einlesen1;   //Bessler Berechnung



end;

procedure TForm10.Panel3Click(Sender: TObject);
begin
Einlesen1; //direkt Berechnung



end;

procedure TForm10.Panel7Click(Sender: TObject);
begin
Einlesen1;
Einlesen2;     //Streuungslinse berechnen


end;

procedure TForm10.Panel6Click(Sender: TObject);
var F:file of Tlinsendat;
begin
if savedialog1.Execute               //Speichern
then
begin
Einlesen1;
Einlesen2;

assignfile(F,savedialog1.FileName);
rewrite(F);
write(F,ldat);
closefile(F);

end;


end;

procedure TForm10.Panel5Click(Sender: TObject);
var F:file of Tlinsendat;                          //Laden
begin

if opendialog1.Execute
then
begin
assignfile(F,opendialog1.FileName);
reset(F);
read(F,ldat);
closefile(F);

    edit1.text:=floattostr(ldat.linse1.g[0,0]);
    edit2.text:=floattostr(ldat.linse1.b[0,0]);
    edit3.text:=floattostr(ldat.linse1.g[1,0]);
    edit4.text:=floattostr(ldat.linse1.b[1,0]);

    edit5.text:=floattostr(ldat.linse1.g[0,1]);
    edit6.text:=floattostr(ldat.linse1.b[0,1]);
    edit7.text:=floattostr(ldat.linse1.g[1,1]);
    edit8.text:=floattostr(ldat.linse1.b[1,1]);

    edit9.text:=floattostr(ldat.linse1.g[0,2]);
    edit10.text:=floattostr(ldat.linse1.b[0,2]);
    edit11.text:=floattostr(ldat.linse1.g[1,2]);
    edit12.text:=floattostr(ldat.linse1.b[1,2]);

    edit13.text:=floattostr(ldat.linse2.g[0,0]);
    edit14.text:=floattostr(ldat.linse2.b[0,0]);
    edit15.text:=floattostr(ldat.linse2.g[1,0]);
    edit16.text:=floattostr(ldat.linse2.b[1,0]);

    edit17.text:=floattostr(ldat.linse2.g[0,1]);
    edit18.text:=floattostr(ldat.linse2.b[0,1]);
    edit19.text:=floattostr(ldat.linse2.g[1,1]);
    edit20.text:=floattostr(ldat.linse2.b[1,1]);

    edit21.text:=floattostr(ldat.linse2.g[0,2]);
    edit22.text:=floattostr(ldat.linse2.b[0,2]);
    edit23.text:=floattostr(ldat.linse2.g[1,2]);
    edit24.text:=floattostr(ldat.linse2.b[1,2]);

    edit25.text:=floattostr(ldat.system.g[0,0]);
    edit26.text:=floattostr(ldat.system.b[0,0]);
    edit27.text:=floattostr(ldat.system.g[1,0]);
    edit28.text:=floattostr(ldat.system.b[1,0]);

    edit29.text:=floattostr(ldat.system.g[0,1]);
    edit30.text:=floattostr(ldat.system.b[0,1]);
    edit31.text:=floattostr(ldat.system.g[1,1]);
    edit32.text:=floattostr(ldat.system.b[1,1]);

    edit33.text:=floattostr(ldat.system.g[0,2]);
    edit34.text:=floattostr(ldat.system.b[0,2]);
    edit35.text:=floattostr(ldat.system.g[1,2]);
    edit36.text:=floattostr(ldat.system.b[1,2]);

end;

end;

end.
