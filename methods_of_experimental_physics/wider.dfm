object Form8: TForm8
  Left = 85
  Top = 21
  Width = 800
  Height = 598
  Caption = 'Bestimmung von Widerst'#228'nden und Str'#246'men'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 201
    Height = 241
    Caption = 'R1'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Spannung:'
    end
    object Label2: TLabel
      Left = 168
      Top = 24
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Stromst'#228'rke:'
    end
    object Label4: TLabel
      Left = 168
      Top = 48
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label5: TLabel
      Left = 8
      Top = 216
      Width = 51
      Height = 13
      Caption = 'R1: () Ohm'
    end
    object Edit1: TEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 72
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 8
      Top = 73
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 2
      OnClick = Panel1Click
    end
    object Panel2: TPanel
      Left = 104
      Top = 73
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 3
      OnClick = Panel2Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 104
      Width = 185
      Height = 105
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 216
    Top = 0
    Width = 201
    Height = 241
    Caption = 'R2'
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Spannung:'
    end
    object Label7: TLabel
      Left = 168
      Top = 24
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label8: TLabel
      Left = 8
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Stromst'#228'rke:'
    end
    object Label9: TLabel
      Left = 168
      Top = 48
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label10: TLabel
      Left = 8
      Top = 216
      Width = 51
      Height = 13
      Caption = 'R2: () Ohm'
    end
    object Edit3: TEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 72
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 8
      Top = 73
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 2
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 104
      Top = 73
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 3
      OnClick = Panel4Click
    end
    object ListBox2: TListBox
      Left = 8
      Top = 104
      Width = 185
      Height = 105
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object GroupBox3: TGroupBox
    Left = 424
    Top = 0
    Width = 201
    Height = 241
    Caption = 'R3'
    TabOrder = 2
    object Label11: TLabel
      Left = 8
      Top = 24
      Width = 52
      Height = 13
      Caption = 'Spannung:'
    end
    object Label12: TLabel
      Left = 168
      Top = 24
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label13: TLabel
      Left = 8
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Stromst'#228'rke:'
    end
    object Label14: TLabel
      Left = 168
      Top = 48
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label15: TLabel
      Left = 8
      Top = 216
      Width = 51
      Height = 13
      Caption = 'R3: () Ohm'
    end
    object Edit5: TEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 72
      Top = 40
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 8
      Top = 73
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 2
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 104
      Top = 73
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 3
      OnClick = Panel6Click
    end
    object ListBox3: TListBox
      Left = 8
      Top = 104
      Width = 185
      Height = 105
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 248
    Width = 201
    Height = 217
    Caption = 'I1'
    TabOrder = 3
    object Label16: TLabel
      Left = 8
      Top = 24
      Width = 56
      Height = 13
      Caption = 'Stomst'#228'rke:'
    end
    object Label17: TLabel
      Left = 168
      Top = 24
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label18: TLabel
      Left = 8
      Top = 192
      Width = 31
      Height = 13
      Caption = 'I1: () A'
    end
    object Edit7: TEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Panel7: TPanel
      Left = 8
      Top = 49
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 1
      OnClick = Panel7Click
    end
    object Panel8: TPanel
      Left = 104
      Top = 49
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 2
      OnClick = Panel8Click
    end
    object ListBox4: TListBox
      Left = 8
      Top = 80
      Width = 185
      Height = 105
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object GroupBox5: TGroupBox
    Left = 216
    Top = 248
    Width = 201
    Height = 217
    Caption = 'I2'
    TabOrder = 4
    object Label19: TLabel
      Left = 8
      Top = 24
      Width = 56
      Height = 13
      Caption = 'Stomst'#228'rke:'
    end
    object Label20: TLabel
      Left = 168
      Top = 24
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label21: TLabel
      Left = 8
      Top = 192
      Width = 31
      Height = 13
      Caption = 'I2: () A'
    end
    object Edit8: TEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Panel9: TPanel
      Left = 8
      Top = 49
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 1
      OnClick = Panel9Click
    end
    object Panel10: TPanel
      Left = 104
      Top = 49
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 2
      OnClick = Panel10Click
    end
    object ListBox5: TListBox
      Left = 8
      Top = 80
      Width = 185
      Height = 105
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object GroupBox6: TGroupBox
    Left = 424
    Top = 248
    Width = 201
    Height = 217
    Caption = 'I3'
    TabOrder = 5
    object Label22: TLabel
      Left = 8
      Top = 24
      Width = 56
      Height = 13
      Caption = 'Stomst'#228'rke:'
    end
    object Label23: TLabel
      Left = 168
      Top = 24
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label24: TLabel
      Left = 8
      Top = 192
      Width = 31
      Height = 13
      Caption = 'I3: () A'
    end
    object Edit9: TEdit
      Left = 72
      Top = 16
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Panel11: TPanel
      Left = 8
      Top = 49
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 1
      OnClick = Panel11Click
    end
    object Panel12: TPanel
      Left = 104
      Top = 49
      Width = 89
      Height = 23
      Cursor = crHandPoint
      Caption = 'Entf.'
      TabOrder = 2
      OnClick = Panel12Click
    end
    object ListBox6: TListBox
      Left = 8
      Top = 80
      Width = 185
      Height = 105
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 472
    Width = 617
    Height = 89
    Caption = 'Auswertung'
    TabOrder = 6
    object Label25: TLabel
      Left = 8
      Top = 16
      Width = 72
      Height = 13
      Caption = 'errechneter I1: '
    end
    object Label26: TLabel
      Left = 8
      Top = 40
      Width = 72
      Height = 13
      Caption = 'errechneter I2: '
    end
    object Label27: TLabel
      Left = 8
      Top = 64
      Width = 72
      Height = 13
      Caption = 'errechneter I3: '
    end
    object Label28: TLabel
      Left = 184
      Top = 16
      Width = 211
      Height = 13
      Caption = 'absolute Abweichung des Mittelwerts von I1:'
    end
    object Label29: TLabel
      Left = 184
      Top = 40
      Width = 211
      Height = 13
      Caption = 'absolute Abweichung des Mittelwerts von I2:'
    end
    object Label30: TLabel
      Left = 184
      Top = 64
      Width = 211
      Height = 13
      Caption = 'absolute Abweichung des Mittelwerts von I3:'
    end
    object Label31: TLabel
      Left = 464
      Top = 16
      Width = 117
      Height = 13
      Caption = 'relative Abweichung(I1): '
    end
    object Label32: TLabel
      Left = 464
      Top = 40
      Width = 117
      Height = 13
      Caption = 'relative Abweichung(I2): '
    end
    object Label33: TLabel
      Left = 464
      Top = 64
      Width = 117
      Height = 13
      Caption = 'relative Abweichung(I3): '
    end
  end
  object Panel13: TPanel
    Left = 632
    Top = 88
    Width = 153
    Height = 89
    Cursor = crHandPoint
    Caption = 'Neu'
    TabOrder = 7
    OnClick = Panel13Click
  end
  object Panel14: TPanel
    Left = 632
    Top = 184
    Width = 153
    Height = 89
    Cursor = crHandPoint
    Caption = 'Laden'
    TabOrder = 8
    OnClick = Panel14Click
  end
  object Panel15: TPanel
    Left = 632
    Top = 280
    Width = 153
    Height = 89
    Cursor = crHandPoint
    Caption = 'Speichern'
    TabOrder = 9
    OnClick = Panel15Click
  end
  object Panel16: TPanel
    Left = 632
    Top = 376
    Width = 153
    Height = 89
    Cursor = crHandPoint
    Caption = 'Berecchnen'
    TabOrder = 10
    OnClick = Panel16Click
  end
  object Panel17: TPanel
    Left = 632
    Top = 472
    Width = 153
    Height = 89
    Cursor = crHandPoint
    Caption = 'Beenden'
    TabOrder = 11
    OnClick = Panel17Click
  end
  object GroupBox8: TGroupBox
    Left = 632
    Top = 0
    Width = 153
    Height = 81
    Caption = 'Basisdaten'
    TabOrder = 12
    object Label34: TLabel
      Left = 8
      Top = 32
      Width = 39
      Height = 13
      Caption = 'U_Netz:'
    end
    object Label35: TLabel
      Left = 8
      Top = 56
      Width = 36
      Height = 13
      Caption = 'U_Batt:'
    end
    object Label36: TLabel
      Left = 136
      Top = 32
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label37: TLabel
      Left = 136
      Top = 56
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Edit10: TEdit
      Left = 56
      Top = 24
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object Edit11: TEdit
      Left = 56
      Top = 48
      Width = 73
      Height = 21
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 328
  end
  object SaveDialog1: TSaveDialog
    Left = 8
    Top = 360
  end
end
