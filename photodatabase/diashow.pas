unit diashow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm6 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    PaintBox1: TPaintBox;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure zeigbild(index:integer);
    procedure setaktu(n:integer);
    procedure holepfaddia(pfad:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

    type Tphotodata=record
  namencount,n:integer;                         //Verwaltungstyp für Datenbank
  id,bezeichnung,fotoserie:string;
  personen:array of string;
  anmerkungen:Pchar;
  end;


var
  Form6: TForm6;
  aktu,z:Integer;
  pic:TBitmap;
  p1:string;
  info:Tphotodata;

implementation

uses main,diaeinstellen;

{$R *.dfm}

procedure TForm6.Timer1Timer(Sender: TObject);
var i:integer;
begin
if getasynckeystate(27)<>0
then
form6.Visible:=false;

if timer2.enabled=false
then
begin

if z<10
then
inc(z)
else
z:=0;

if z<>0
then
begin
for i:=0 to 255 do
if getasynckeystate(i)<>0
then
begin
z:=z;
end;

end
else
begin

if getasynckeystate(33)<>0
then
begin
if aktu<form1.ListView1.Items.Count-1
then
inc(aktu)
else
aktu:=0;
zeigbild(aktu);
end;

if getasynckeystate(34)<>0
then
begin
if aktu>1
then
dec(aktu)                               //manuelle Steuerung
else
aktu:=form1.ListView1.Items.Count-1;
zeigbild(aktu);
end;

if getasynckeystate(35)<>0
then
begin
aktu:=form1.ListView1.Items.Count-1;
zeigbild(aktu);
end;

if getasynckeystate(36)<>0
then
begin
aktu:=0;
zeigbild(aktu);
end;
   end;
end;



end;

procedure TForm6.FormCreate(Sender: TObject);
begin
form6.Top:=0;
form6.Left:=0;                        //Initialisieren
form6.Width:=screen.Width;
form6.Height:=screen.Height;
pic:=Tbitmap.Create;
   z:=0;
end;

procedure TForm6.Timer2Timer(Sender: TObject);
begin                //automatischer Wechsel
zeigbild(aktu);
if aktu<form1.ListView1.Items.Count-1
then
inc(aktu)
else
aktu:=0;
end;


 procedure Tform6.zeigbild(index:integer);
 var x,y:integer;
 AspectRatio,OutputWidth,Outputheight:extended;
 begin           //Bild anzeigen

 info:=Tphotodata(form1.listview1.items[index].data^);

 image1.Picture.LoadFromFile(info.id);
 pic.width:=image1.Picture.Width;
 pic.Height:=image1.Picture.Height;
 pic.canvas.draw(0,0,image1.picture.Graphic);



 x:=screen.Width div 2;
 y:=screen.Height div 2;

  paintbox1.canvas.Brush.color:=clblack;
 paintbox1.Canvas.FillRect(rect(0,0,screen.width,screen.height));


if form5.RadioButton5.Checked=true
then
 paintbox1.Canvas.draw(x- pic.width div 2,y- pic.height div 2,pic);

if form5.RadioButton3.Checked=true
then
begin
 OutputWidth := pic.Width;
    OutputHeight := pic.Height;

    AspectRatio := OutputWidth / OutputHeight;
    if (OutputWidth < screen.Width) and
      (OutputHeight < screen.Height) then
    begin
      if OutputWidth < OutputHeight then

      begin
        OutputHeight := screen.Height;
        OutputWidth := OutputHeight * AspectRatio;
      end
      else
      begin
        OutputWidth := screen.Width;
        OutputHeight := OutputWidth / AspectRatio;
      end
    end;
    if OutputWidth > screen.Width then
    begin
      OutputWidth := screen.Width;
      OutputHeight := OutputWidth / AspectRatio;
    end;
    if OutputHeight > screen.Height then

    begin
      OutputHeight := screen.Height;
      OutputWidth := OutputHeight * AspectRatio;
    end;

    paintbox1.Canvas.StretchDraw(Rect(x-Trunc(OutputWidth/2), y-Trunc(OutputHeight/2),x+Trunc(OutputWidth/2), y+Trunc(OutputHeight/2)),pic);
end;


if form5.RadioButton4.checked=true
then
paintbox1.canvas.stretchdraw(Rect(0,0,screen.width,screen.height),pic);


if form5.RadioButton6.checked=true
then
paintbox1.canvas.stretchdraw(rect(x-form5.SpinEdit2.Value div 2,y-form5.spinedit3.value div 2, x+form5.SpinEdit2.Value div 2,y+form5.spinedit3.value div 2),pic);




 end;

    procedure Tform6.setaktu(n:integer);
    begin            //Startbild setzten
     aktu:=n;

    end;

 procedure Tform6.holepfaddia(pfad:string);
 begin
 p1:=pfad;                         //Universalpfad importieren
 end;

end.
