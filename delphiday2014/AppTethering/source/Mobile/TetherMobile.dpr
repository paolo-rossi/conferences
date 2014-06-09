program TetherMobile;

uses
  System.StartUpCopy,
  FMX.MobilePreview,
  FMX.Forms,
  TetherApp.Form.Main in 'TetherApp.Form.Main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
