unit GL3Dform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, GL, GLu, GLext, TGA, CgWindow, CgTexture, CgUtils, CgTypes, Menus,
  CgGeometry,  CgLight, StdCtrls, math, Spin;

type
  TForm5 = class(TCGForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Idle(Sender: TObject; var Done: Boolean);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Bildschirmvoll;
    procedure Bildschirmnormal;
        procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
      procedure laden;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TProc = FARPROC;
  // Extension function prototypes (do NOT forget to make them stdcall!!!):
  TExtProcf = procedure (pname: GLenum; param: GLfloat); stdcall;
  TExtProcfv = procedure (pname: GLenum; params: PGLfloat); stdcall;

// Required, but not in Windows.pas:
function wglGetProcAddress(proc: PChar): TProc; stdcall; external 'OPENGL32.DLL';

{ Even if EXT_point_params isn't supported on your ICD, this program should give
  you an idea of how to load and use an extension. If you want to use other
  extensions, look up their specification on OpenGL.org to see how they work.

  In case you're wondering what EXT_point_params does, it applies the point size
  in function of a point's eye distance. }

var
  // Extension functions:
  glPointParameterfEXT: TExtProcf;
  glPointParameterfvEXT: TExtProcfv;
 // light_position : array [0..3] of GLfloat;
const
  // Extension enumerants:
  GL_POINT_SIZE_MIN_EXT            = $8126;
  GL_POINT_SIZE_MAX_EXT            = $8127;
  GL_POINT_FADE_THRESHOLD_SIZE_EXT = $8128;
  GL_DISTANCE_ATTENUATION_EXT      = $8129;
  LD: array [0..3] of GLfloat = (1, 1, 1, 1);
  LA: array [0..3] of GLfloat = (0.5, 0.5, 0.5, 1);
  winkel: GLfloat =(180);
    qua: GLfloat = 0.005;

   type TPunkte=record
  k,x,y,r:integer;
  end;


  const Grav=6000.673;
        Msol=1.989;             //1000Pix = 10^11 m      //dt=100000sec
        Rsol=6.96;
        mjup=0.0018986;
        rjup=0.71492;
        Aein=1496;


var
  Form5: TForm5;
   cam: record                                           // Camera information
    pos: TCGVector;
    pitch, yaw: Single;
  end;
   mpos: TPoint;
   dList,starcount:integer;
   Punkt:array of TPunkte;
    count:longint;
   lpos:TCGVector;
    ldir:array[0..5] of TCGVector;
     // zeit:longint;
    maxmingravity,spx,spy,spz:extended;
    lauf:boolean;


   ddevmode,ddd,dzz:TDevMode;
  dd:integer;                    //Bildschirm Variablen
  ddc:hdc;
  dscrx,dscry,dfarb:integer;
  wurzel:extended;
  firstrun:boolean;

  xmax,ymax,kmax:longint;

implementation

uses show3D;

{$R *.dfm}

 
var
  fps: Single = 0;    // Sum of framerate samples.
  fpsc: Integer = 0;  // Number of framerate samples taken.

const
  FPS_SMOOVE = 20;    // Number of samples to use for smoothing the fps counter.

function HasExtension(name: String): Boolean;
var
  exts: PChar;
begin

  // Check OpenGL's extension string for the name of the extension we want to use.
  exts := PChar(glGetString(GL_EXTENSIONS));
  Result := (Pos(name, String(exts)) <> 0);

end;



procedure TForm5.Timer1Timer(Sender: TObject);
begin
if getasynckeystate(27)<>0
then
begin
Form5.visible:=false;
bildschirmnormal;
Form4.visible:=true;

end;
end;

  procedure TForm5.Bildschirmvoll;
    begin               //full screen
    form5.ClientWidth:=800;
    form5.ClientHeight:=600;

       ddc:=getdc(0);
dfarb:=1 shl getdevicecaps(ddc, Bitspixel);
releaseDC(0,ddc);
dscrx:=screen.width;
dscry:=screen.height;


ddevmode.dmsize:=Sizeof(TDevmode);
ddevmode.dmdriverextra:=0;
dd:=0;


while EnumDisplaySettings(nil,dd,ddevmode)  do

begin

inc(dd);
if (ddevmode.dmpelswidth=800) and (ddevmode.dmpelsheight=600) and ((1 shl ddevmode.dmbitsperpel)=65536)
then
begin
ddd:=ddevmode;
end;

if (ddevmode.dmpelswidth=dscrx) and (ddevmode.dmpelsheight=dscry) and ((1 shl ddevmode.dmbitsperpel)=dfarb)
then
begin
dzz:=ddevmode;
end;

end;

  changedisplaySettings(Tdevmode(ddd),0);




    end;


        procedure TForm5.Bildschirmnormal;
    begin               //full screen
      changedisplaySettings(Tdevmode(dzz),0);

    end;


procedure TForm5.FormCreate(Sender: TObject);
begin
  
InitGL;

randomize;

lauf:=false;
wurzel:=sqrt(2)/2;

 glMatrixMode(GL_MODELVIEW);


  ldir[0]:=(cgVector(0,0,1));
    ldir[1]:=(cgVector(0,0,-1));
      ldir[2]:=(cgVector(0,1,0));
    ldir[3]:=(cgVector(0,-1,0));
      ldir[4]:=(cgVector(1,0,0));
    ldir[5]:=(cgVector(-1,0,0));
    lpos := cgVector(0,0,0);

    glEnable(GL_LIGHTING);

         glEnable(GL_NORMALIZE);


   glEnable(GL_LIGHT0);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, @LD);
    glLightfv(GL_LIGHT0, GL_AMBIENT, @LA);
    glLightfv(GL_LIGHT0, GL_POSITION, @LPOS);
    glLightfv(GL_LIGHT0, GL_SPOT_CUTOFF, @winkel);
    glLightfv(GL_LIGHT0, GL_SPOT_DIRECTION , @ldir[0]);
      glLightfv(GL_LIGHT0, GL_LINEAR_ATTENUATION , @qua);


      glEnable(GL_LIGHT1);
    glLightfv(GL_LIGHT1, GL_DIFFUSE, @LD);
    glLightfv(GL_LIGHT1, GL_AMBIENT, @LA);
    glLightfv(GL_LIGHT1, GL_POSITION, @LPOS);
    glLightfv(GL_LIGHT1, GL_SPOT_CUTOFF, @winkel);
       glLightfv(GL_LIGHT1, GL_SPOT_DIRECTION , @ldir[1]);
         glLightfv(GL_LIGHT1, GL_LINEAR_ATTENUATION , @qua);


        glEnable(GL_LIGHT2);
    glLightfv(GL_LIGHT2, GL_DIFFUSE, @LD);
    glLightfv(GL_LIGHT2, GL_AMBIENT, @LA);
    glLightfv(GL_LIGHT2, GL_POSITION, @LPOS);
    glLightfv(GL_LIGHT2, GL_SPOT_CUTOFF, @winkel);
       glLightfv(GL_LIGHT2, GL_SPOT_DIRECTION , @ldir[2]);
         glLightfv(GL_LIGHT2, GL_LINEAR_ATTENUATION , @qua);


            glEnable(GL_LIGHT3);
    glLightfv(GL_LIGHT3, GL_DIFFUSE, @LD);
    glLightfv(GL_LIGHT3, GL_AMBIENT, @LA);
    glLightfv(GL_LIGHT3, GL_POSITION, @LPOS);
    glLightfv(GL_LIGHT3, GL_SPOT_CUTOFF, @winkel);
       glLightfv(GL_LIGHT3, GL_SPOT_DIRECTION , @ldir[3]);
         glLightfv(GL_LIGHT3, GL_LINEAR_ATTENUATION , @qua);


              glEnable(GL_LIGHT4);
    glLightfv(GL_LIGHT4, GL_DIFFUSE, @LD);
    glLightfv(GL_LIGHT4, GL_AMBIENT, @LA);
    glLightfv(GL_LIGHT4, GL_POSITION, @LPOS);
    glLightfv(GL_LIGHT4, GL_SPOT_CUTOFF, @winkel);
       glLightfv(GL_LIGHT4, GL_SPOT_DIRECTION , @ldir[4]);
         glLightfv(GL_LIGHT4, GL_LINEAR_ATTENUATION , @qua);

              glEnable(GL_LIGHT5);
    glLightfv(GL_LIGHT5, GL_DIFFUSE, @LD);
    glLightfv(GL_LIGHT5, GL_AMBIENT, @LA);
    glLightfv(GL_LIGHT5, GL_POSITION, @LPOS);
    glLightfv(GL_LIGHT5, GL_SPOT_CUTOFF, @winkel);
       glLightfv(GL_LIGHT5, GL_SPOT_DIRECTION , @ldir[5]);
         glLightfv(GL_LIGHT5, GL_LINEAR_ATTENUATION , @qua);

       glEnable(GL_COLOR_MATERIAL);
    glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, @LA);

   glClearColor(0, 0, 0, 0);

   Resize;

    cam.pos := cgVector(0, 0, 100);
    cam.pitch := -0;
    cam.yaw := 0;
    GetCursorPos(mpos);
    mpos := ScreenToClient(mpos);



// Check the extensions string.
  if not HasExtension('GL_EXT_point_parameters') then
  begin
    // Crash and burn if the extension is not supported.
    MessageDlg('Your OpenGL implementation does not support GL_EXT_point_parameters!',
               mtError, [mbOk], 0);
    Halt(1);
  end;

  // Load point params functions:
  glPointParameterfEXT := TExtProcf(wglGetProcAddress(PChar('glPointParameterfEXT')));
  glPointParameterfvEXT := TExtProcfv(wglGetProcAddress(PChar('glPointParameterfvEXT')));

  // Just some initializations:
    glViewport(0, 0, ClientWidth, ClientHeight);
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity;
  gluPerspective(60, (ClientWidth)/(ClientHeight), 0, 100000);
  glMatrixMode(GL_MODELVIEW);


  glEnable(GL_POINT_SMOOTH);
  glEnable(GL_BLEND);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


 cgStartTiming;
    Application.OnIdle := Idle;  //setstartwerte;
end;



procedure TForm5.Idle(Sender: TObject; var Done: Boolean);
var
  dt, speed: Single;
  v: TCGVector;
begin


  Done := FALSE;

  dt := cgTimeElapsed;
  cgStartTiming;
    
  // Take framerate sample.
  fps := fps + 1000/dt;
  INC(fpsc);

  // If number of samples is high enough, average them and display the result.
  if fpsc = FPS_SMOOVE then
  begin
    fpsc := 0;
    fps := fps / FPS_SMOOVE;
    Caption := Format('simulator -- %.0f fps', [fps]);
    fps := 0;
  end;

  if GetAsyncKeyState(VK_SHIFT) <> 0 then speed := 0.5
  else speed := 0.05;
  v := cgVector(0, 0, 0);
  if GetAsyncKeyState(VK_UP) <> 0 then v.z := -dt*speed
  else if GetAsyncKeyState(VK_DOWN) <> 0 then v.z := dt*speed;
  if GetAsyncKeyState(VK_LEFT) <> 0 then v.x := -dt*speed
  else if GetAsyncKeyState(VK_RIGHT) <> 0 then v.x := dt*speed;

  cgRotateX(v, cam.pitch*PI/180);
  cgRotateY(v, cam.yaw*PI/180);
  cam.pos := cgVecAdd(cam.pos, v);

  Paint;
 end;


procedure TForm5.FormPaint(Sender: TObject);
const    att: array [0..2] of Single = (0.25, 0, 1/60);
var i:integer;
Q : PGLUQuadric;
      begin
   if lauf=true
   then
   begin
         //Anzeigen der Grafik

   glClear(GL_COLOR_BUFFER_BIT);
   

    glMatrixMode(GL_MODELVIEW);
  glLoadIdentity;
   glRotatef(-cam.pitch, 1, 0, 0);
  glRotatef(-cam.yaw, 0, 1, 0);

  glTranslatef(-cam.pos.x, -cam.pos.y, -cam.pos.z);

if firstrun=true
then
begin
firstrun:=false;

     glenable(GL_CULL_FACE);
         glCullFace(GL_BACK);
            Q := gluNewQuadric;
          gluQuadricDrawStyle(Q, GLU_FILL);
dList := glGenLists(1);     
  glNewList(dList, GL_COMPILE);

  
    glPushMatrix();

  glTranslatef(0, 0, 0);
    glBegin(GL_QUADS);

      for i:=0 to count-1 do
                  begin
  
     glColor3f(punkt[i].x/xmax,punkt[i].y/ymax,punkt[i].k/kmax);
case punkt[i].r of
0:begin

 glVertex3f(punkt[i].x-0.5,punkt[i].y-0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y-0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y+0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y+0.5,punkt[i].k-0.5);

end;
1:begin

  glVertex3f(punkt[i].x+0.5,punkt[i].y-0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y+0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y+0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y-0.5,punkt[i].k+0.5);

end;
2:begin

 glVertex3f(punkt[i].x-0.5,punkt[i].y-0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y-0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y-0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y-0.5,punkt[i].k+0.5);

end;
3:begin

 glVertex3f(punkt[i].x-0.5,punkt[i].y-0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y+0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y+0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y-0.5,punkt[i].k+0.5);

end;
4:begin

 glVertex3f(punkt[i].x-0.5,punkt[i].y+0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y+0.5,punkt[i].k-0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y+0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y+0.5,punkt[i].k+0.5);

end;
5:begin

 glVertex3f(punkt[i].x-0.5,punkt[i].y-0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y-0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x+0.5,punkt[i].y+0.5,punkt[i].k+0.5);

 glVertex3f(punkt[i].x-0.5,punkt[i].y+0.5,punkt[i].k+0.5);

end;

end;

       
end;
    GLend();

      glPopMatrix();

         glFinish;
          glEndList;
          gluDeleteQuadric(Q);
        gldisable(GL_CULL_FACE);

      end;




    glCallList(dList); 
  LPOS.x:=cam.pos.x;
  LPOS.y:=cam.pos.y;
  LPOS.z:=cam.pos.z;


   glLightfv(GL_LIGHT0, GL_POSITION, @LPOS);
      glLightfv(GL_LIGHT1, GL_POSITION, @LPOS);
        glLightfv(GL_LIGHT2, GL_POSITION, @LPOS);
      glLightfv(GL_LIGHT3, GL_POSITION, @LPOS);
        glLightfv(GL_LIGHT4, GL_POSITION, @LPOS);
      glLightfv(GL_LIGHT5, GL_POSITION, @LPOS);

  
     PageFlip;
     end;
    end;


procedure TForm5.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

 if ssLeft in Shift then
  begin
    cam.pitch := cam.pitch - (Y - mpos.Y)/5;
    cam.yaw := cam.yaw - (X - mpos.X)/5;

    {if cam.pitch > 90 then cam.pitch := 90
    else if cam.pitch < -90 then cam.pitch := -90;
          }
    if cam.pitch > 360 then cam.pitch := cam.pitch - 360
    else if cam.pitch < 0 then cam.pitch := cam.pitch + 360;

    if cam.yaw > 360 then cam.yaw := cam.yaw - 360
    else if cam.yaw < 0 then cam.yaw := cam.yaw + 360;

  end;
  mpos := Point(X, Y);
end;

  procedure Tform5.laden;
  var s:string;
      F:file of Tpunkte;
      lang:longint;
      TF:textfile;
  begin

  s:=Form4.edit1.Text;
lang:=length(s);
s[lang-7]:='i';
s[lang-6]:='n';
s[lang-5]:='f';
s[lang-4]:='o';

assignfile(TF,s);
reset(TF);
readln(TF,s);
xmax:=strtoint(s);
readln(TF,s);
ymax:=strtoint(s);
readln(TF,s);
kmax:=strtoint(s);
closefile(TF);

  firstrun:=true;
 s:=form4.edit1.Text;
lang:=length(s);
s[lang-7]:='o';
s[lang-6]:='p';
s[lang-5]:='t';
s[lang-4]:='i';
assignfile(F,s);
reset(F);
lang:=0;
while EOF(F)=false do
begin
inc(lang);
setlength(punkt,lang);
read(F,punkt[lang-1]);
end;

count:=lang;
closefile(F);
        lauf:=true;
  end;

end.
