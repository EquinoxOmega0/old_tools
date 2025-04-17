object Form1: TForm1
  Left = 206
  Top = 118
  BorderStyle = bsDialog
  Caption = 'Interpolations- und Extrapolationsprogramm'
  ClientHeight = 652
  ClientWidth = 871
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 72
    Width = 4
    Height = 13
    Caption = #176
    Visible = False
  end
  object Label2: TLabel
    Left = 184
    Top = 72
    Width = 2
    Height = 13
    Caption = #39
    Visible = False
  end
  object Label3: TLabel
    Left = 250
    Top = 72
    Width = 5
    Height = 13
    Caption = '"'
    Visible = False
  end
  object Label4: TLabel
    Left = 8
    Top = 536
    Width = 60
    Height = 13
    Caption = 'f'#252'r Zeitpunkt'
  end
  object Label5: TLabel
    Left = 8
    Top = 592
    Width = 67
    Height = 16
    Caption = 'Ergebnis:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 568
    Width = 55
    Height = 13
    Caption = 'aus Werten'
  end
  object Label7: TLabel
    Left = 160
    Top = 568
    Width = 13
    Height = 13
    Caption = 'bis'
  end
  object Label8: TLabel
    Left = 200
    Top = 536
    Width = 54
    Height = 13
    Caption = ' berechnen'
  end
  object PaintBox1: TPaintBox
    Left = 264
    Top = 8
    Width = 600
    Height = 600
    Cursor = crCross
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 57
    Caption = 'Programmmodus'
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 8
      Top = 24
      Width = 113
      Height = 17
      Cursor = crHandPoint
      Caption = 'Interpolation'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 128
      Top = 24
      Width = 113
      Height = 17
      Cursor = crHandPoint
      Caption = 'Extrapolation'
      TabOrder = 1
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 72
    Width = 129
    Height = 21
    TabOrder = 1
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 185
    Height = 57
    Caption = 'Eingabe- und Ausgabeformat'
    TabOrder = 2
    object RadioButton3: TRadioButton
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Gleitkommazahl'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 112
      Top = 24
      Width = 49
      Height = 17
      Cursor = crHandPoint
      Caption = #176' '#39' "'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
  end
  object Edit2: TEdit
    Left = 144
    Top = 72
    Width = 41
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object Edit3: TEdit
    Left = 192
    Top = 72
    Width = 57
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 200
    Width = 249
    Height = 321
    ItemHeight = 13
    TabOrder = 5
  end
  object Button1: TButton
    Left = 8
    Top = 104
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Caption = 'Hinzuf'#252'gen'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 104
    Width = 89
    Height = 25
    Cursor = crHandPoint
    Caption = 'L'#246'schen'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 104
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Caption = '+'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 232
    Top = 104
    Width = 25
    Height = 25
    Cursor = crHandPoint
    Caption = '-'
    TabOrder = 9
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 344
    Top = 616
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Liste laden'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 512
    Top = 615
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Liste speichern'
    TabOrder = 11
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 615
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Berechnen'
    TabOrder = 12
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 176
    Top = 615
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Grafik anzeigen'
    TabOrder = 13
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 680
    Top = 615
    Width = 185
    Height = 33
    Cursor = crHandPoint
    Caption = 'Programm beenden'
    TabOrder = 14
    OnClick = Button9Click
  end
  object Edit4: TEdit
    Left = 72
    Top = 528
    Width = 129
    Height = 21
    TabOrder = 15
  end
  object Button10: TButton
    Left = 200
    Top = 136
    Width = 57
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sortiere ^'
    TabOrder = 16
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 200
    Top = 168
    Width = 57
    Height = 25
    Cursor = crHandPoint
    Caption = 'Sortiere v'
    TabOrder = 17
    OnClick = Button11Click
  end
  object SpinEdit1: TSpinEdit
    Left = 72
    Top = 560
    Width = 81
    Height = 22
    MaxValue = 1000000000
    MinValue = 1
    TabOrder = 18
    Value = 1
  end
  object SpinEdit2: TSpinEdit
    Left = 176
    Top = 560
    Width = 81
    Height = 22
    MaxValue = 1000000000
    MinValue = 1
    TabOrder = 19
    Value = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 808
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 840
    Top = 8
  end
end
