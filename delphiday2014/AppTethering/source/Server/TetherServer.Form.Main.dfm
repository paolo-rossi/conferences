object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Server Thetering App'
  ClientHeight = 289
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
  object TetheringManager1: TTetheringManager
    Text = 'X'
    Left = 64
    Top = 64
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'TetheringAppProfile1'
    Group = 'Test1'
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
    Resources = <>
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
end
