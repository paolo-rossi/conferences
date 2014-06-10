unit TetherWin.Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, IPPeerServer,
  Vcl.StdCtrls, System.Tether.Manager, System.Tether.AppProfile;

type
  TfrmMain = class(TForm)
    lblTime: TLabel;
    btnSubscription: TButton;
    TetheringManagerDesktop: TTetheringManager;
    TetheringAppProfileDesktop: TTetheringAppProfile;
    procedure btnSubscriptionClick(Sender: TObject);
    procedure TetheringAppProfileDesktopResourceUpdated(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure FormShow(Sender: TObject);
    procedure TetheringAppProfileDesktopAcceptResource(const Sender: TObject;
      const AProfileId: string; const AResource: TCustomRemoteItem;
      var AcceptResource: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnSubscriptionClick(Sender: TObject);
var
  LProfile: TTetheringProfileInfo;
  LResource: TRemoteResource;
begin
  LProfile := TetheringManagerDesktop.RemoteProfiles[0];

  {
  for LProfile in TetheringManagerDesktop.RemoteProfiles do
  begin
    if LProfile.ProfileGroup = 'BarcodeGroup' then
      Break;
  end;
  }
  LResource := TetheringAppProfileDesktop.GetRemoteResourceValue(LProfile, 'CurTime');

  TetheringAppProfileDesktop.SubscribeToRemoteItem(LProfile, 'CurTime');
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  TetheringManagerDesktop.AutoConnect;
end;

procedure TfrmMain.TetheringAppProfileDesktopAcceptResource(
  const Sender: TObject; const AProfileId: string;
  const AResource: TCustomRemoteItem; var AcceptResource: Boolean);
begin
  AcceptResource := True;
end;

procedure TfrmMain.TetheringAppProfileDesktopResourceUpdated(
  const Sender: TObject; const AResource: TRemoteResource);
begin
  lblTime.Caption := AResource.Value.AsString;
end;

end.
