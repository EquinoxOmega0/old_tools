object Form1: TForm1
  Left = 490
  Top = 188
  BorderStyle = bsDialog
  Caption = 'Standard-Mapping 3D'
  ClientHeight = 202
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 8
    Top = 8
    Width = 297
    Height = 41
    Cursor = crHandPoint
    Caption = '3D-Berechnung'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 104
    Width = 297
    Height = 41
    Cursor = crHandPoint
    Caption = '3D-Darstellung'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 152
    Width = 297
    Height = 41
    Cursor = crHandPoint
    Caption = 'Programm beenden'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 56
    Width = 297
    Height = 41
    Cursor = crHandPoint
    Caption = '3D-Optimierung'
    TabOrder = 3
    OnClick = Button5Click
  end
end
