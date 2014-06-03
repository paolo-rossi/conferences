program RESTGitHub;

uses
  FMX.Forms,
  REST.Form.Main in 'REST.Form.Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
