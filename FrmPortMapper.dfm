object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PortMapper'
  ClientHeight = 141
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 50
    Height = 13
    Caption = 'Remote IP'
  end
  object Label2: TLabel
    Left = 32
    Top = 40
    Width = 67
    Height = 13
    Caption = 'Remote PORT'
  end
  object Label3: TLabel
    Left = 32
    Top = 67
    Width = 54
    Height = 13
    Caption = 'Local PORT'
  end
  object Button1: TButton
    Left = 32
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 158
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 8
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 112
    Top = 32
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 112
    Top = 59
    Width = 121
    Height = 21
    Alignment = taRightJustify
    TabOrder = 2
  end
  object IdMappedPortTCP1: TIdMappedPortTCP
    Bindings = <>
    DefaultPort = 0
    MappedPort = 0
    Left = 224
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 240
    Top = 32
    object S1: TMenuItem
      Caption = '&Show PortMapper'
      OnClick = S1Click
    end
    object N1: TMenuItem
      Caption = '&Hide PortMapper'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object A1: TMenuItem
      Caption = '&About'
      OnClick = A1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = 'E&xit'
      OnClick = N3Click
    end
  end
end
