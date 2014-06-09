unit MainFormUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Edit, FMX.Layouts, FMX.Memo, Fmx.Platform, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile, System.Actions,
  FMX.ActnList;

type
  TForm1 = class(TForm)
    ButtonScan: TButton;
    ButtonProduce: TButton;
    ComboBoxFormat: TComboBox;
    Memo1: TMemo;
    LayoutTop: TLayout;
    LayoutBottom: TLayout;
    ButtonClearLog: TButton;
    Button1: TButton;
    ActionList1: TActionList;
    actAggiungi: TAction;
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Button2: TButton;
    procedure ButtonScanClick(Sender: TObject);
    procedure ButtonProduceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonClearLogClick(Sender: TObject);
    procedure TetheringManager1PairedToRemote(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure TetheringManager1EndManagersDiscovery(const Sender: TObject;
      const RemoteManagers: TTetheringManagerInfoList);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FClipboardService: IFMXClipboardService;
    FApplicationEventService: IFMXApplicationEventService;
    FWaitingForResults: Boolean;

    procedure DoScanSuccessful(const AContent: string);

    function ApplicationEventHandler(AAppEvent: TApplicationEvent; AContext: TObject): Boolean;
    procedure ClearLog;
    procedure Log(const AString: string);

    property WaitingForResults: Boolean read FWaitingForResults write FWaitingForResults;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{$IFDEF ANDROID}
uses
  Androidapi.JNI.GraphicsContentViewText,
  FMX.Helpers.Android,
  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers;
{$ENDIF}

procedure TForm1.ButtonScanClick(Sender: TObject);
{$IFDEF ANDROID}
var
  Intent: JIntent;
{$ENDIF}
begin
{$IFDEF ANDROID}
  // empty the clipboard (to be sure not to match previous results)
  FClipBoardService.SetClipboard('');
  WaitingForResults := True;

  // launch Barcode Scanner in SCAN mode
  Intent := TJIntent.JavaClass.init(StringToJString('com.google.zxing.client.android.SCAN'));
  Intent.setPackage(StringToJString('com.google.zxing.client.android'));

  Intent.putExtra(StringToJString('SCAN_MODE'), StringToJString('ONE_D_MODE,QR_CODE_MODE,PRODUCT_MODE,DATA_MATRIX_MODE'));

  SharedActivityContext.startActivity(Intent);
{$ENDIF}
end;

procedure TForm1.ClearLog;
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.DoScanSuccessful(const AContent: string);
begin
  Log('Result: ' + AContent);

  TetheringAppProfile1.Resources.FindByName('Barcode').Value := AContent;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FWaitingForResults := False;
{$IFDEF ANDROID}
  if not TPlatformServices.Current.SupportsPlatformService(IFMXClipboardService, IInterface(FClipBoardService)) then
    raise Exception.Create('Cannot get access to clipboard service!');

  if not TPlatformServices.Current.SupportsPlatformService(IFMXApplicationEventService, IInterface(FApplicationEventService)) then
    raise Exception.Create('Cannot get application event service');
  FApplicationEventService.SetApplicationEventHandler(ApplicationEventHandler);
{$ENDIF}
end;

function TForm1.ApplicationEventHandler(AAppEvent: TApplicationEvent;
  AContext: TObject): Boolean;
var
  LClipboardContent: string;
  LFound: Boolean;
begin
  case AAppEvent of
    TApplicationEvent.BecameActive:
      begin
        if WaitingForResults then
        begin
          WaitingForResults := False;
          LClipboardContent := FClipBoardService.GetClipboard.AsString;
          LFound := LClipboardContent <> '';

          if LFound then
            DoScanSuccessful(LClipboardContent)
          else
            Log('Scan failed (please retry)');
        end;
      end;
  end;
  Result := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  actAggiungi.Execute;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TetheringManager1.AutoConnect;
end;

procedure TForm1.ButtonClearLogClick(Sender: TObject);
begin
  ClearLog;
end;

procedure TForm1.ButtonProduceClick(Sender: TObject);
{$IFDEF ANDROID}
var
  Intent: JIntent;
{$ENDIF}
begin
{$IFDEF ANDROID}
  Intent := TJIntent.JavaClass.init(StringToJString('com.google.zxing.client.android.ENCODE'));
  Intent.setPackage(StringToJString('com.google.zxing.client.android'));

  Intent.putExtra(StringToJString('ENCODE_TYPE'), StringToJString('TEXT_TYPE'));
  Intent.putExtra(StringToJString('ENCODE_FORMAT'), StringToJString(ComboBoxFormat.Items[ComboboxFormat.ItemIndex]));
  Intent.putExtra(StringToJString('ENCODE_DATA'), StringToJString(Memo1.Lines.Text));

  SharedActivityContext.startActivity(Intent);
{$ENDIF}
end;

procedure TForm1.Log(const AString: string);
begin
  Memo1.Lines.Add(DateTimeToStr(Now) + ': ' + AString);
end;

procedure TForm1.TetheringManager1EndManagersDiscovery(const Sender: TObject;
  const RemoteManagers: TTetheringManagerInfoList);
begin
  Log('EndManagersDiscovery: ' + RemoteManagers.Count.ToString);
end;

procedure TForm1.TetheringManager1PairedToRemote(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  Log('Paired to Remote: ' + TetheringManager1.RemoteProfiles.Count.ToString);
end;

end.
