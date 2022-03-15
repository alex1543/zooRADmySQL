object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
  ClientHeight = 354
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 360
    Top = 8
    Width = 87
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072':'
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 320
    Height = 120
    TabOrder = 0
    ColWidths = (
      64
      64
      40
      126
      64)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Memo1: TMemo
    Left = 352
    Top = 32
    Width = 308
    Height = 177
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 453
    Top = 5
    Width = 140
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 587
    Top = 215
    Width = 65
    Height = 25
    Caption = 'Open'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 372
    Top = 215
    Width = 75
    Height = 25
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 453
    Top = 215
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 595
    Top = 3
    Width = 65
    Height = 25
    Caption = #1054#1073#1079#1086#1088'...'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 248
    Top = 134
    Width = 65
    Height = 25
    Caption = 'Refresh'
    TabOrder = 7
    OnClick = Button5Click
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 576
    Top = 40
  end
end
