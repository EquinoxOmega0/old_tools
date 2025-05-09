unit turtle;


interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, math;

type TTurtle= class(TObject)
public
pic:TBitmap;
x,y,kurs:extended;
farbe:longint;
procedure init(Formular:TForm);
procedure clear;
procedure turnl(winkel:extended);
procedure turnr(winkel:extended);
procedure draw(lang:extended);
procedure hide(lang:extended);
procedure jumpcoord(cx,cy:extended);
procedure linetocoord(cx,cy:extended);
procedure setcourse(course:extended);
procedure setcolor(f:longint);
procedure setimage(w,h:integer);
procedure setwidth(w:integer);


end;


implementation

procedure TTurtle.init(Formular:TForm);
begin           //erstellen;
pic:=TBitmap.Create;
setimage(250,250);
x:=0;
y:=0;
kurs:=0;
farbe:=clblack;
setcolor(farbe);
clear;
end;

procedure TTurtle.clear;
begin           //l�schen
pic.Canvas.Brush.Color:=clwhite;
pic.canvas.FillRect(rect(0,0,pic.Width,pic.height));
end;

procedure TTurtle.turnl(winkel:extended);
begin            //links drehen
kurs:=kurs-winkel;
end;


procedure TTurtle.turnr(winkel:extended);
begin              //rechts drehen
kurs:=kurs+winkel;
end;


procedure TTurtle.draw(lang:extended);
begin                //linie zeichnen
pic.Canvas.moveto(round(x),round(y));
x:=x+lang*cos(kurs/180*PI);
y:=y-lang*sin(kurs/180*PI);
pic.Canvas.LineTo(round(x),round(y));
end;


procedure TTurtle.hide(lang:extended);
begin               //unsichtbar bewegen
x:=x+lang*cos(kurs/180*PI);
y:=y-lang*sin(kurs/180*PI);
end;


procedure TTurtle.jumpcoord(cx,cy:extended);
begin                      //springen zu
x:=cx;
y:=cy;
end;


procedure TTurtle.linetocoord(cx,cy:extended);
begin                      //linie zu zeichnen
pic.Canvas.MoveTo(round(x),round(y));
x:=cx;
y:=cy;
pic.Canvas.lineto(round(x),round(y));
end;


procedure TTurtle.setcourse(course:extended);
begin                         //kurs setzen
kurs:=course;
end;


procedure TTurtle.setcolor(f:longint);
begin                      //farbe setzen
pic.Canvas.Pen.Color:=f;
end;


procedure TTurtle.setimage(w,h:integer);
begin               //Format des Bildes setzen
pic.Width:=w;
pic.Height:=h;
end;


procedure TTurtle.setwidth(w:integer);
begin              //pinsel dicke setzen
pic.Canvas.Pen.Width:=w;
end;







end.
 