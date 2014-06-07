unit REST.Form.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Layouts, FMX.Memo, FMX.TabControl, System.Rtti,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  FMX.Grid, FMX.ListView.Types, FMX.ListView, Data.DB;

type
  TfrmMain = class(TForm)
    btnHelloWorld: TButton;
    btnUser: TButton;
    btnCustom: TButton;
    ctrlResponse: TTabControl;
    tabHeaders: TTabItem;
    tabContent: TTabItem;
    mmoContent: TMemo;
    mmoHeaders: TMemo;
    StatusBar1: TStatusBar;
    tabGrid: TTabItem;
    gridResponse: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Edit1: TEdit;
    ListView1: TListView;
    procedure btnHelloWorldClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnCustomClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure ParseHyperMedia(ADataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  System.JSON, REST.Json, REST.Module.Main;

{$R *.fmx}

procedure TfrmMain.btnCustomClick(Sender: TObject);
begin
  mmoContent.Lines.Text := dmMain.DoRequestCustom(Edit1.Text);
  mmoHeaders.Lines.Text := dmMain.ResponseGitHub.Headers.Text;
  dmMain.ResponseTable.Open;
end;

procedure TfrmMain.btnHelloWorldClick(Sender: TObject);
begin
  ShowMessage(dmMain.DoRequestHello);
end;

procedure TfrmMain.btnUserClick(Sender: TObject);
begin
  mmoContent.Lines.Text := dmMain.DoRequestUser('paolo-rossi');
  mmoHeaders.Lines.Text := dmMain.ResponseGitHub.Headers.Text;
  dmMain.ResponseTable.Open;

  ParseHyperMedia(dmMain.ResponseTable);
end;

procedure TfrmMain.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  ShowMessage(AItem.Detail);
end;

procedure TfrmMain.ParseHyperMedia(ADataSet: TDataSet);
var
  LIndex: Integer;
  LItem: TListViewItem;
begin
  ADataSet.First;
  if not ADataSet.Eof then
  begin
    for LIndex := 0 to ADataSet.Fields.Count - 1 do
    begin
      if Pos('_url', ADataSet.Fields[LIndex].FieldName) > 0 then
      begin
        LItem := ListView1.Items.Add;
        LItem.Text := ADataSet.Fields[LIndex].FieldName;
        LItem.Detail := ADataSet.Fields[LIndex].AsString;
      end;
    end;
  end;

end;

end.
