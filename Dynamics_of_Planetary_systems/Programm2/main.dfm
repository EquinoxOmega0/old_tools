object Form1: TForm1
  Left = 313
  Top = 240
  BorderStyle = bsDialog
  Caption = 'Datenextrahierer'
  ClientHeight = 573
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 68
    Height = 13
    Caption = 'Datensatz Nr.:'
  end
  object Label2: TLabel
    Left = 136
    Top = 24
    Width = 18
    Height = 13
    Caption = 'von'
  end
  object Label3: TLabel
    Left = 216
    Top = 24
    Width = 42
    Height = 13
    Caption = 'auslesen'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 80
    Height = 13
    Caption = 'davon die Spalte'
  end
  object Label5: TLabel
    Left = 152
    Top = 56
    Width = 63
    Height = 13
    Caption = 'hier anzeigen'
  end
  object Label6: TLabel
    Left = 200
    Top = 488
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label7: TLabel
    Left = 200
    Top = 520
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label8: TLabel
    Left = 200
    Top = 552
    Width = 6
    Height = 13
    Caption = '0'
  end
  object SpinEdit1: TSpinEdit
    Left = 80
    Top = 16
    Width = 49
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 0
    Value = 1
  end
  object SpinEdit2: TSpinEdit
    Left = 160
    Top = 16
    Width = 49
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 1
    Value = 5
  end
  object SpinEdit3: TSpinEdit
    Left = 96
    Top = 48
    Width = 49
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 2
    Value = 1
  end
  object ListBox1: TListBox
    Left = 8
    Top = 112
    Width = 281
    Height = 353
    ItemHeight = 13
    TabOrder = 3
  end
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 65
    Height = 25
    Cursor = crHandPoint
    Caption = 'Ausf'#252'hren'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 80
    Width = 65
    Height = 25
    Cursor = crHandPoint
    Caption = 'Neu'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 224
    Top = 80
    Width = 65
    Height = 25
    Cursor = crHandPoint
    Caption = 'Beenden'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 480
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Maximum liegt bei Index Nr.'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 512
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'Minimum liegt bei Index Nr.'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 152
    Top = 80
    Width = 65
    Height = 25
    Cursor = crHandPoint
    Caption = 'Speichern'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 544
    Width = 177
    Height = 25
    Cursor = crHandPoint
    Caption = 'akutelle Index Nr.'
    TabOrder = 10
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 344
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Auto'
    TabOrder = 11
    OnClick = Button8Click
  end
  object Memo1: TMemo
    Left = 368
    Top = 256
    Width = 185
    Height = 89
    TabOrder = 12
  end
  object OpenDialog1: TOpenDialog
    Left = 272
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 272
    Top = 40
  end
end
