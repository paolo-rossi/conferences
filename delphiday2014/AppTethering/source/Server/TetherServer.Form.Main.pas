unit TetherServer.Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, System.Tether.Manager,
  System.Tether.AppProfile, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    TetheringManagerServer: TTetheringManager;
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
    Timer1: TTimer;
    lblTime: TLabel;
    mmoLog: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure actShowExecute(Sender: TObject);
    procedure actAggiungiExecute(Sender: TObject);
    procedure actSottraiExecute(Sender: TObject);
    procedure actResetExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TetheringManagerServerPairedFromLocal(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringManagerServerPairedToRemote(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
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

procedure TfrmMain.FormShow(Sender: TObject);
begin
  TetheringManagerServer.AutoConnect;
end;

procedure TfrmMain.TetheringManagerServerPairedFromLocal(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  mmoLog.Lines.Add('Paired Local ' + AManagerInfo.ManagerName);
end;

procedure TfrmMain.TetheringManagerServerPairedToRemote(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  mmoLog.Lines.Add('Paired Remote ' + AManagerInfo.ManagerName);
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  lblTime.Caption := FormatDateTime('hh:nn:ss', Now);
  TetheringAppProfile1.Resources.FindByName('CurTime').Value := lblTime.Caption;
end;

end.
