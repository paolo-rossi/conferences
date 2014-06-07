program RESTGitHub;

uses
  FMX.Forms,
  REST.Form.Main in 'REST.Form.Main.pas' {frmMain},
  REST.Data.Main in 'REST.Data.Main.pas' {dmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
