program RESTGitHub;

uses
  FMX.Forms,
  REST.Form.Main in 'REST.Form.Main.pas' {frmMain},
  REST.Module.Main in 'REST.Module.Main.pas' {dmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
