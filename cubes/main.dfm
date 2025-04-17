object Form1: TForm1
  Left = 197
  Top = 118
  Width = 896
  Height = 697
  Caption = 'n-dim W'#252'rfel'
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
  object PaintBox1: TPaintBox
    Left = 8
    Top = 8
    Width = 600
    Height = 600
    Cursor = crCross
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
  end
  object Label8: TLabel
    Left = 616
    Top = 184
    Width = 113
    Height = 13
    Caption = 'Position der Maus: (0/0)'
  end
  object Panel1: TPanel
    Left = 8
    Top = 616
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Berechnen'
    TabOrder = 0
    OnClick = Panel1Click
  end
  object GroupBox1: TGroupBox
    Left = 616
    Top = 8
    Width = 177
    Height = 169
    Caption = 'Einstellung'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 55
      Height = 13
      Caption = 'Dimension: '
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Ursprung x:'
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 54
      Height = 13
      Caption = 'Ursprung y:'
    end
    object Label6: TLabel
      Left = 8
      Top = 120
      Width = 33
      Height = 13
      Caption = 'Zoom: '
    end
    object Label7: TLabel
      Left = 144
      Top = 120
      Width = 21
      Height = 13
      Caption = 'fach'
    end
    object SpinEdit1: TSpinEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 22
      MaxValue = 1000000
      MinValue = 2
      TabOrder = 0
      Value = 3
    end
    object SpinEdit2: TSpinEdit
      Left = 72
      Top = 48
      Width = 89
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object SpinEdit3: TSpinEdit
      Left = 72
      Top = 80
      Width = 89
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object Edit3: TEdit
      Left = 48
      Top = 112
      Width = 89
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 144
      Width = 153
      Height = 17
      Caption = 'bei Mausklick rezentrieren'
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 616
    Top = 200
    Width = 177
    Height = 409
    Caption = 'Basisvektorsystem'
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 39
      Height = 13
      Caption = 'Winkel: '
    end
    object Label5: TLabel
      Left = 8
      Top = 48
      Width = 36
      Height = 13
      Caption = 'L'#228'nge: '
    end
    object Edit1: TEdit
      Left = 56
      Top = 16
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 56
      Top = 40
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 8
      Top = 72
      Width = 161
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hinzuf'#252'gen'
      TabOrder = 2
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 8
      Top = 104
      Width = 161
      Height = 25
      Cursor = crHandPoint
      Caption = 'L'#246'schen'
      TabOrder = 3
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 8
      Top = 136
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Caption = 'Bearbeiten'
      TabOrder = 4
      OnClick = Panel4Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 168
      Width = 81
      Height = 209
      ItemHeight = 13
      TabOrder = 5
      OnClick = ListBox1Click
    end
    object ListBox2: TListBox
      Left = 88
      Top = 168
      Width = 81
      Height = 209
      ItemHeight = 13
      TabOrder = 6
      OnClick = ListBox2Click
    end
    object Panel9: TPanel
      Left = 120
      Top = 136
      Width = 49
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      TabOrder = 7
      OnClick = Panel9Click
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 384
      Width = 161
      Height = 17
      Caption = 'Basisvektoren verwenden'
      TabOrder = 8
    end
  end
  object Panel5: TPanel
    Left = 616
    Top = 616
    Width = 265
    Height = 41
    Cursor = crHandPoint
    Caption = 'Programm beenden'
    TabOrder = 3
    OnClick = Panel5Click
  end
  object Panel6: TPanel
    Left = 160
    Top = 616
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Grafik verwenden'
    TabOrder = 4
    OnClick = Panel6Click
  end
  object Panel7: TPanel
    Left = 312
    Top = 616
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Daten speichern'
    TabOrder = 5
    OnClick = Panel7Click
  end
  object Panel8: TPanel
    Left = 464
    Top = 616
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Daten laden'
    TabOrder = 6
    OnClick = Panel8Click
  end
  object GroupBox3: TGroupBox
    Left = 800
    Top = 8
    Width = 81
    Height = 601
    Caption = 'Farben'
    TabOrder = 7
    object Shape1: TShape
      Left = 8
      Top = 56
      Width = 65
      Height = 17
      Cursor = crHandPoint
      Brush.Color = clBlack
      OnMouseDown = Shape1MouseDown
    end
    object Label9: TLabel
      Left = 16
      Top = 40
      Width = 43
      Height = 13
      Caption = 'Standard'
    end
    object Label10: TLabel
      Left = 16
      Top = 208
      Width = 52
      Height = 13
      Caption = 'BB GG RR'
    end
    object ListBox3: TListBox
      Left = 8
      Top = 224
      Width = 65
      Height = 369
      ItemHeight = 13
      TabOrder = 0
    end
    object Panel10: TPanel
      Left = 8
      Top = 80
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 1
      OnClick = Panel10Click
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 16
      Width = 65
      Height = 17
      Caption = 'aktivieren'
      TabOrder = 2
    end
    object Panel11: TPanel
      Left = 8
      Top = 112
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 3
      OnClick = Panel11Click
    end
    object Panel12: TPanel
      Left = 8
      Top = 144
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Auf'
      TabOrder = 4
      OnClick = Panel12Click
    end
    object Panel13: TPanel
      Left = 8
      Top = 176
      Width = 65
      Height = 25
      Cursor = crHandPoint
      Caption = 'Ab'
      TabOrder = 5
      OnClick = Panel13Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 40
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 8
    Top = 8
  end
  object PrintDialog1: TPrintDialog
    Left = 104
    Top = 8
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 72
    Top = 8
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 136
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 168
    Top = 8
  end
end
