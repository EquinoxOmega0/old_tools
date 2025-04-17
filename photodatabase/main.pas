unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ExtDlgs, serien, namen, liste, jpeg,
  ComCtrls, diaeinstellen, diashow, pdhilfe;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    GroupBox1: TGroupBox;
    OpenPictureDialog1: TOpenPictureDialog;
    Edit1: TEdit;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label2: TLabel;
    ListBox4: TListBox;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    Progamm1: TMenuItem;
    Schlieen1: TMenuItem;
    Einstellungen1: TMenuItem;
    Hilfe1: TMenuItem;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Memo2: TMemo;
    Label5: TLabel;
    Personen1: TMenuItem;
    Serien1: TMenuItem;
    Diashow1: TMenuItem;
    Image1: TImage;
    Memo3: TMemo;
    ListView1: TListView;
    ListBox1: TListBox;
    Einstellungen2: TMenuItem;
    Starten1: TMenuItem;
    aktuellesBildexportieren1: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    procedure Schlieen1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Personen1Click(Sender: TObject);
    procedure Serien1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure speichern;
    procedure laden;
    procedure ListView1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure NeuListe(loeschen:boolean);
    procedure Einstellungen2Click(Sender: TObject);
    procedure Starten1Click(Sender: TObject);
    procedure aktuellesBildexportieren1Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button9Click(Sender: TObject);
    procedure Hilfe1Click(Sender: TObject);
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
  Form1: TForm1;
  photodata:array of Tphotodata;
  pdcount:integer;
  bild,showpic,pic:Tbitmap;
  pfad:string;
  litem:TListitem;
  p:^Tphotodata;
  aktuphoto:Tphotodata;
  bearbeit:boolean;

implementation

{$R *.dfm}

procedure TForm1.Schlieen1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var x,y:integer;
 AspectRatio,OutputWidth,OutputHeight:extended;
begin
if openpicturedialog1.Execute
then
begin                                            //Bild auswählen
edit1.Text:=openpicturedialog1.FileName;
image1.Picture.LoadFromFile(edit1.text);
pic.Height:=image1.Picture.Height;
pic.Width:=image1.Picture.Width;
pic.canvas.Draw(0,0,image1.Picture.Graphic);




x:=paintbox1.Width div 2;
y:=paintbox1.height div 2;

OutputWidth := pic.Width;
    OutputHeight := pic.Height;

    AspectRatio := OutputWidth / OutputHeight;
    if (OutputWidth < Paintbox1.Width) and
      (OutputHeight < Paintbox1.Height) then
    begin
      if OutputWidth < OutputHeight then

      begin
        OutputHeight := Paintbox1.Height;
        OutputWidth := OutputHeight * AspectRatio;
      end
      else
      begin
        OutputWidth := Paintbox1.Width;
        OutputHeight := OutputWidth / AspectRatio;
      end
    end;
    if OutputWidth > Paintbox1.Width then
    begin
      OutputWidth := Paintbox1.Width;
      OutputHeight := OutputWidth / AspectRatio;
    end;
    if OutputHeight > Paintbox1.Height then

    begin
      OutputHeight := Paintbox1.Height;
      OutputWidth := OutputHeight * AspectRatio;
    end;

    
    showpic.Height:=600;
    showpic.Width:=800;
    showpic.Canvas.Brush.Color:=clskyblue;
    showpic.Canvas.FillRect(rect(0,0,800,600));
    showpic.Canvas.StretchDraw(Rect(x-Trunc(OutputWidth/2), y-Trunc(OutputHeight/2),x+Trunc(OutputWidth/2), y+Trunc(OutputHeight/2)),pic);
    paintbox1.Canvas.draw(0,0,showpic);
end;
end;

procedure TForm1.Personen1Click(Sender: TObject);
begin
form2.ListBox1.Items.LoadFromFile(pfad+'/namenliste.dat');
form2.visible:=true;
end;

procedure TForm1.Serien1Click(Sender: TObject);
begin
form3.ListBox1.Items.LoadFromFile(pfad+'/serienliste.dat');
form3.Visible:=true;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
form4.visible:=true;
form4.ListBox1.Clear;
form4.ListBox1.Items.LoadFromFile(pfad+'/serienliste.dat');
form4.ListBox1.Items.Add('ohne Zuordnung');
form4.ListBox2.Clear;
form4.ListBox2.Items.LoadFromFile(pfad+'/namenliste.dat');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

pdcount:=0;
Bild:=TBitmap.create;
showpic:=Tbitmap.create;
pic:=Tbitmap.create;
getdir(0,pfad);
form2.holebasispfadn(pfad);
form3.holebasispfads(pfad);
form6.holepfaddia(pfad);
listbox3.Items.LoadFromFile(pfad+'/namenliste.dat');     //Listen laden
listbox4.Items.LoadFromFile(pfad+'/serienliste.dat');
laden;
bearbeit:=false;
end;

procedure TForm1.Button5Click(Sender: TObject);
var a,i:integer;
begin
a:=-1;

for i:=0 to listbox4.Items.count-1 do
if listbox4.Selected[i]=true
then
a:=i;                                 //Serie auswählen

if a<>-1
then
edit2.Text:=listbox4.Items.Strings[a];

end;

procedure TForm1.Button3Click(Sender: TObject);
var a,i:integer;
c:boolean;
begin           //Namen hinzufügen

a:=-1;
for i:=0 to listbox3.Items.count-1 do
if listbox3.Selected[i]=true
then
a:=i;


if a<>-1
then
begin
c:=false;



for i:=0 to listbox2.Items.Count-1 do              //Check ob schon vorhanden
if listbox2.Items.Strings[i]=listbox3.Items.Strings[a]
then
c:=true;

if c=false
then
listbox2.Items.Add(listbox3.Items.Strings[a])

end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var a,i:integer;
begin           //Namen löschen

a:=-1;
for i:=0 to listbox2.Items.count-1 do
if listbox2.Selected[i]=true
then
a:=i;

if a<>-1
then
listbox2.Items.Delete(a); 

end;

procedure TForm1.Button2Click(Sender: TObject);
var i,a:longint;

begin


if bearbeit=true            //Überprüfung
then
begin
bearbeit:=false;
aktuphoto:=Tphotodata(listview1.selected.data^);
a:=aktuphoto.n;

photodata[a].namencount:=listbox2.Items.Count;

photodata[a].bezeichnung:=edit3.Text;

photodata[a].n:=pdcount;

if edit2.text=''
then
photodata[a].fotoserie:='ohne Zuordnung'
else
photodata[a].fotoserie:=edit2.Text;

photodata[a].anmerkungen:=memo1.Lines.GetText;

setlength(photodata[a].personen,photodata[a].namencount);
for i:=0 to photodata[a].namencount-1 do
photodata[a].personen[i]:=listbox2.Items.Strings[i];

new(p);
p^:=photodata[a];
listview1.selected.data:=p;
listview1.Selected.Caption:=photodata[a].bezeichnung;
speichern;
end
else
begin
if  (edit1.text<>'') and (edit3.text<>'')
then
                           //Foto in Datenbank aufnehmen

begin
setlength(photodata,pdcount+1);


photodata[pdcount].namencount:=listbox2.Items.Count;

photodata[pdcount].bezeichnung:=edit3.Text;

photodata[pdcount].n:=pdcount;

if edit2.text=''
then
photodata[pdcount].fotoserie:='ohne Zuordnung'
else
photodata[pdcount].fotoserie:=edit2.Text;

photodata[pdcount].anmerkungen:=memo1.Lines.GetText;

setlength(photodata[pdcount].personen,photodata[pdcount].namencount);
for i:=0 to photodata[pdcount].namencount-1 do
photodata[pdcount].personen[i]:=listbox2.Items.Strings[i];

inc(pdcount);

   {
assignfile(f,pfad+'\idcount.dat');
reset(F);                        //Universalzähler laden
readln(F,s);
count:=strtoint(s);
closefile(F);


photodata[pdcount-1].id:=count;


inc(count);


assignfile(f,pfad+'\idcount.dat');
rewrite(F);                        //Universalzähler aktualisieren
s:=inttostr(count);
writeln(F,s);
closefile(F);
                                 }
photodata[pdcount-1].id:=edit1.text;

                                  
image1.Picture.LoadFromFile(edit1.text);



litem:=Listview1.items.add;
litem.caption:=format('%s',[photodata[pdcount-1].bezeichnung]);
new(p);
p^:=photodata[pdcount-1];
litem.Data:=p;


speichern;
bearbeit:=false;

end;
listbox2.Clear;
edit3.Text:='';
edit1.Text:='';
end;

end;



procedure Tform1.speichern;
var i,e:integer;
F:Textfile;
s:string;
begin                                          //Datenbank speichern

assignfile(F,pfad+'\daten\info.dat');
rewrite(F);

s:=inttostr(pdcount);
writeln(F,s);

for i:=0 to pdcount-1 do
begin

writeln(F,photodata[i].id);

s:=inttostr(photodata[i].namencount);
writeln(F,s);

writeln(F,photodata[i].bezeichnung);

writeln(F,photodata[i].fotoserie);

writeln(F,photodata[i].anmerkungen);
writeln(F,'#');

for e:=0 to photodata[i].namencount-1 do
writeln(F,photodata[i].personen[e]);

end;


closefile(F);


end;


procedure Tform1.laden;
var i,e:integer;
F:Textfile;
s:string;
begin                   //Datenbank laden

assignfile(F,pfad+'\daten\info.dat');
reset(F);

readln(F,s);
pdcount:=strtoint(s);

setlength(photodata,pdcount);

for i:=0 to pdcount-1 do
begin


readln(F,s);
photodata[i].id:=s;

readln(F,s);
photodata[i].namencount:=strtoint(s);

setlength(photodata[i].personen,photodata[i].namencount);

readln(F,photodata[i].bezeichnung);

readln(F,photodata[i].fotoserie);

photodata[i].n:=i;

readln(F,s);

memo3.Clear;
while s<>'#' do
begin
memo3.Lines.Add(s);
readln(F,s);
end;
photodata[i].anmerkungen:=memo3.Lines.GetText;

for e:=0 to photodata[i].namencount-1 do
readln(F,photodata[i].personen[e]);



end;


closefile(F);


end;




procedure TForm1.ListView1Click(Sender: TObject);
var i,x,y:integer;
 AspectRatio,OutputWidth,OutputHeight:extended;
begin
bearbeit:=false;

if listview1.selcount=1
then
begin
aktuphoto:=Tphotodata(listview1.selected.data^);

listbox1.Clear;

label4.caption:='Name: '+aktuphoto.bezeichnung;
label3.Caption:='Serie: '+aktuphoto.fotoserie;
for i:=0 to aktuphoto.namencount-1 do
listbox1.Items.Add(aktuphoto.personen[i]);

memo2.Clear;
memo2.Lines.SetText(aktuphoto.anmerkungen);

image1.picture.LoadFromFile(aktuphoto.id);
pic.width:=image1.picture.width;
pic.Height:=image1.Picture.Height;
pic.Canvas.draw(0,0,image1.Picture.Graphic);

x:=paintbox1.Width div 2;
y:=paintbox1.height div 2;

OutputWidth := pic.Width;
    OutputHeight := pic.Height;

    AspectRatio := OutputWidth / OutputHeight;
    if (OutputWidth < Paintbox1.Width) and
      (OutputHeight < Paintbox1.Height) then
    begin
      if OutputWidth < OutputHeight then

      begin
        OutputHeight := Paintbox1.Height;
        OutputWidth := OutputHeight * AspectRatio;
      end
      else
      begin
        OutputWidth := Paintbox1.Width;
        OutputHeight := OutputWidth / AspectRatio;
      end
    end;
    if OutputWidth > Paintbox1.Width then
    begin
      OutputWidth := Paintbox1.Width;
      OutputHeight := OutputWidth / AspectRatio;
    end;
    if OutputHeight > Paintbox1.Height then

    begin
      OutputHeight := Paintbox1.Height;
      OutputWidth := OutputHeight * AspectRatio;
    end;

    
    showpic.Height:=600;
    showpic.Width:=800;
    showpic.Canvas.Brush.Color:=clskyblue;
    showpic.Canvas.FillRect(rect(0,0,800,600));
    showpic.Canvas.StretchDraw(Rect(x-Trunc(OutputWidth/2), y-Trunc(OutputHeight/2),x+Trunc(OutputWidth/2), y+Trunc(OutputHeight/2)),pic);

    paintbox1.Canvas.Draw(0,0,showpic);


end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var i:integer;
begin

if listview1.SelCount=1
then                                               //Foto bearbeiten
begin
aktuphoto:=Tphotodata(listview1.selected.data^);

bearbeit:=true;
edit1.Text:='';
listbox2.Clear;
for i:=0 to aktuphoto.namencount-1 do
listbox2.Items.Add(aktuphoto.personen[i]);
edit2.Text:=aktuphoto.fotoserie;
edit3.Text:=aktuphoto.bezeichnung;
memo1.Clear;
memo1.Lines.SetText(aktuphoto.anmerkungen);
end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var a:integer;
begin

if listview1.SelCount=1
then
if MessageDlg('Wollen Sie dieses Bild wirklich aus der Datenbank entfernen?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then

begin                                                          //Foto löschen
aktuphoto:=Tphotodata(listview1.selected.data^);

a:=aktuphoto.n;

photodata[pdcount-1].n:=a;
photodata[a]:=photodata[pdcount-1];


listview1.selected.data:=listview1.Items[listview1.Items.count-1].data;
listview1.Selected.Caption:=photodata[pdcount-1].bezeichnung;
listview1.Items.Delete(listview1.Items.count-1);




dec(pdcount);

setlength(photodata,pdcount);

speichern;
end;
end;

   procedure TForm1.NeuListe(loeschen:boolean);
   var i,e,ii,a,l:integer;
   c:boolean;
   s,t:string;
   tt:Pchar;
   begin             //Neue Liste laden

   if loeschen=true
   then
   listview1.Clear;

   if form4.RadioButton1.checked=true
   then                        //Ganze Datenbank
   begin

   for i:=0 to pdcount-1 do
   begin
   litem:=Listview1.items.add;
   litem.caption:=format('%s',[photodata[i].bezeichnung]);
   new(p);
   p^:=photodata[i];
   litem.Data:=p;
   
   end;



   end;


   if form4.RadioButton2.checked=true
   then                        //Nur bestimmte Serien
   begin

   for i:=0 to pdcount-1 do
   begin

   for e:=0 to form4.listbox1.items.count-1 do
   if form4.ListBox1.Selected[e]=true
   then
   if form4.ListBox1.Items[e]=photodata[i].fotoserie
   then
      begin
   litem:=Listview1.items.add;
   litem.caption:=format('%s',[photodata[i].bezeichnung]);
   new(p);
   p^:=photodata[i];
   litem.Data:=p;
   end;

   end;


   end;


   if form4.RadioButton3.checked=true
   then                        //Nur bestimmte Namen
   begin

   for i:=0 to pdcount-1 do
   begin

   for e:=0 to form4.listbox2.items.count-1 do
   begin
   if form4.ListBox2.Selected[e]=true
   then
   begin
   c:=false;
   for a:=0 to photodata[i].namencount-1 do
   if form4.ListBox2.Items[e]=photodata[i].personen[a]
   then
   c:=true;

   if c=true
   then
      begin
   litem:=Listview1.items.add;
   litem.caption:=format('%s',[photodata[i].bezeichnung]);
   new(p);
   p^:=photodata[i];
   litem.Data:=p;
   end;
   end;
   end;
   end;


   end;



   if form4.RadioButton4.checked=true
   then                        //Suche nach Titel
   begin

   s:=form4.Edit1.Text;
   a:=length(s);
   for i:=1 to a do
   s[i]:=upcase(s[i]);

   for i:=0 to pdcount-1 do
   begin

   c:=false;
   t:=photodata[i].bezeichnung;
   l:=length(t);
   
   for e:=1 to l do
   t[e]:=upcase(t[e]);

   for e:=1 to l do
   if t[e]=s[1]
   then
   if (l-e)>=(a-1)
   then
   begin
   c:=true;
   for ii:=1 to a do
   if s[ii]<>t[e+ii-1]
   then
   c:=false;
   
   end;

     if c=true
     then
      begin
   litem:=Listview1.items.add;
   litem.caption:=format('%s',[photodata[i].bezeichnung]);
   new(p);
   p^:=photodata[i];
   litem.Data:=p;
   end;

   end;


   end;



   if form4.RadioButton5.checked=true
   then                        //Suche nach Anmerkungen
   begin

   s:=form4.Edit1.Text;
   a:=length(s);
   for i:=1 to a do
   s[i]:=upcase(s[i]);

   for i:=0 to pdcount-1 do
   begin

   c:=false;
   tt:=photodata[i].anmerkungen;
   l:=length(tt);

   for e:=1 to l do
   tt[e]:=upcase(tt[e]);

   for e:=1 to l do
   if tt[e]=s[1]
   then
   if (l-e)>=(a-1)
   then
   begin
   c:=true;
   for ii:=1 to a do
   if s[ii]<>tt[e+ii-1]
   then
   c:=false;
   
   end;

     if c=true
     then
      begin
   litem:=Listview1.items.add;
   litem.caption:=format('%s',[photodata[i].bezeichnung]);
   new(p);
   p^:=photodata[i];
   litem.Data:=p;
   end;

   end;

   end;



   end;



procedure TForm1.Einstellungen2Click(Sender: TObject);
begin
form5.Visible:=true;
end;

procedure TForm1.Starten1Click(Sender: TObject);
begin                             //Start Diashow

if listview1.Items.count>0
then
begin

if form5.RadioButton1.checked=true
then
begin
form6.Timer2.Enabled:=true;
form6.Timer2.Interval:=form5.SpinEdit1.Value;
end
else
begin
form6.Timer2.Enabled:=false;
end;




form6.setaktu(0);
form6.visible:=true;
form6.zeigbild(0);

end;
end;

procedure TForm1.aktuellesBildexportieren1Click(Sender: TObject);
begin
if listview1.selcount=1
then
begin
aktuphoto:=Tphotodata(listview1.selected.data^);

SavePictureDialog1.DefaultExt := GraphicExtension(Tbitmap);
SavePictureDialog1.Filter := GraphicFilter(TBitmap);
if SavePictureDialog1.Execute
then
begin

image1.Picture.LoadFromFile(aktuphoto.id);
showpic.Width:=image1.Picture.Width;
showpic.height:=image1.Picture.height;
showpic.canvas.Draw(0,0,image1.Picture.Graphic);

showpic.SaveToFile(savepicturedialog1.filename);
end;
paintbox1.Canvas.FillRect(rect(0,0,800,600));
paintbox1.Canvas.Draw(0,0,showpic);
end;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
paintbox1.Canvas.Draw(0,0,showpic);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
if listview1.selcount=1
then                                          //Foto aus Liste entfernen
listview1.Items.Delete(listview1.Selected.index);
end;

procedure TForm1.Hilfe1Click(Sender: TObject);
begin
form7.Memo1.Lines.LoadFromFile(pfad+'/help.dat');      //Lade Hilfe
form7.visible:=true;
end;

end.
