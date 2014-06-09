unit TetherServer.Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, System.Tether.Manager,
  System.Tether.AppProfile;

type
  TfrmMain = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    ActionList1: TActionList;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    actAggiungi: TAction;
    actSottrai: TAction;
    actReset: TAction;
    actShow: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure actAggiungiExecute(Sender: TObject);
    procedure actSottraiExecute(Sender: TObject);
    procedure actResetExecute(Sender: TObject);
  private
    { Private declarations }
    FCounter: Integer;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.actAggiungiExecute(Sender: TObject);
begin
  FCounter := FCounter + 1;
  actShow.Execute;
end;

procedure TfrmMain.actResetExecute(Sender: TObject);
begin
  FCounter := 0;
  actShow.Execute;
end;

procedure TfrmMain.actShowExecute(Sender: TObject);
begin
  Label1.Caption := IntToStr(FCounter);
end;

procedure TfrmMain.actSottraiExecute(Sender: TObject);
begin
  FCounter := FCounter - 1;
  actShow.Execute;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FCounter := 0;
  actShow.Execute;
end;

end.
