program smap;

uses
  Forms,
  main in 'main.pas' {Form1},
  einzel in 'einzel.pas' {Form2},
  rechen3D in 'rechen3D.pas' {Form3},
  show3D in 'show3D.pas' {Form4},
  GL3Dform in 'GL3Dform.pas' {Form5},
  opti3D in 'opti3D.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
