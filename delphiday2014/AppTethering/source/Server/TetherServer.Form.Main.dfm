object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Server Thetering Application'
  ClientHeight = 512
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClick = actShowExecute
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 256
    Top = 64
    Width = 77
    Height = 33
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTime: TLabel
    Left = 486
    Top = 256
    Width = 60
    Height = 18
    Caption = 'hh:mm:ss'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'TechnicBold'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 256
    Top = 120
    Width = 75
    Height = 25
    Action = actAggiungi
    TabOrder = 0
  end
  object Button2: TButton
    Left = 258
    Top = 151
    Width = 75
    Height = 25
    Action = actSottrai
    TabOrder = 1
  end
  object Button3: TButton
    Left = 258
    Top = 182
    Width = 75
    Height = 25
    Action = actReset
    TabOrder = 2
  end
  object mmoLog: TMemo
    Left = 0
    Top = 277
    Width = 554
    Height = 235
    Align = alBottom
    Lines.Strings = (
      'mmoLog')
    TabOrder = 3
  end
  object TetheringManagerServer: TTetheringManager
    OnPairedFromLocal = TetheringManagerServerPairedFromLocal
    OnPairedToRemote = TetheringManagerServerPairedToRemote
    Text = 'TetheringManagerServer'
    Left = 64
    Top = 64
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManagerServer
    Text = 'TetheringAppProfile1'
    Group = 'BarcodeGroup'
    Actions = <
      item
        Name = 'actAggiungi'
        IsPublic = True
        Action = actAggiungi
        NotifyUpdates = False
      end
      item
        Name = 'actSottrai'
        IsPublic = True
        Action = actSottrai
        NotifyUpdates = False
      end
      item
        Name = 'actReset'
        IsPublic = True
        Action = actReset
        NotifyUpdates = False
      end>
    Resources = <
      item
        Name = 'CurTime'
        IsPublic = True
      end>
    Left = 64
    Top = 128
  end
  object ActionList1: TActionList
    Left = 152
    Top = 40
    object actAggiungi: TAction
      Caption = 'actAggiungi'
      OnExecute = actAggiungiExecute
    end
    object actSottrai: TAction
      Caption = 'actSottrai'
      OnExecute = actSottraiExecute
    end
    object actReset: TAction
      Caption = 'actReset'
      OnExecute = actResetExecute
    end
    object actShow: TAction
      Caption = 'actShow'
      OnExecute = actShowExecute
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 368
    Top = 24
  end
end
