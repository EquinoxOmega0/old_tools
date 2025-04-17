program photodatabase;

uses
  Forms,
  main in 'main.pas' {Form1},
  namen in 'namen.pas' {Form2},
  serien in 'serien.pas' {Form3},
  liste in 'liste.pas' {Form4},
  diaeinstellen in 'diaeinstellen.pas' {Form5},
  diashow in 'diashow.pas' {Form6},
  pdhilfe in 'pdhilfe.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
