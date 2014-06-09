unit TetherApp.Form.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Tether.AppProfile, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, System.Actions, FMX.ActnList;

type
  TForm1 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    ActionList1: TActionList;
    actAggiungi: TAction;
    procedure Button1Click(Sender: TObject);
    procedure TetheringManager1PairedToRemote(const Sender: TObject;
      const AManagerInfo: TTetheringManagerInfo);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure Log(const AText: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TetheringManager1.AutoConnect;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  actAggiungi.Execute;
end;

procedure TForm1.Log(const AText: string);
begin
  Memo1.Lines.Add(DateTimeToStr(Now) + ': ' + AText);
end;

procedure TForm1.TetheringManager1PairedToRemote(const Sender: TObject;
  const AManagerInfo: TTetheringManagerInfo);
begin
  Log('OnPairedToRemote');
end;

end.
