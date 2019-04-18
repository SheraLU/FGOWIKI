program FGOWiki;

uses
  Forms,
  login in 'login.pas' {Form2},
  Main in 'Main.pas' {Form3},
  list in 'list.pas' {Form1},
  servant in 'servant.pas' {Form4},
  classe in 'classe.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
