object Form3: TForm3
  Left = 299
  Top = 261
  Width = 639
  Height = 571
  Caption = 'Oberfl'#228'chenspannung'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 617
    Height = 65
    Caption = 'Basisdaten'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 11
      Height = 13
      Caption = 'R:'
    end
    object Label2: TLabel
      Left = 72
      Top = 32
      Width = 14
      Height = 13
      Caption = 'cm'
    end
    object Label3: TLabel
      Left = 136
      Top = 32
      Width = 6
      Height = 13
      Caption = 'r:'
    end
    object Label4: TLabel
      Left = 200
      Top = 32
      Width = 14
      Height = 13
      Caption = 'cm'
    end
    object Label5: TLabel
      Left = 248
      Top = 32
      Width = 70
      Height = 13
      Caption = 'Dichte der Luft'
    end
    object Label6: TLabel
      Left = 376
      Top = 32
      Width = 28
      Height = 13
      Caption = 'g/cm'#179
    end
    object Edit1: TEdit
      Left = 24
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 152
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 328
      Top = 24
      Width = 41
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 201
    Height = 401
    Caption = 'Fl'#252'ssigkeit 1'
    TabOrder = 1
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Dichte: '
    end
    object Label8: TLabel
      Left = 96
      Top = 24
      Width = 28
      Height = 13
      Caption = 'g/cm'#179
    end
    object Label9: TLabel
      Left = 8
      Top = 56
      Width = 94
      Height = 13
      Caption = 'gemesse Spannung'
    end
    object Label10: TLabel
      Left = 160
      Top = 56
      Width = 29
      Height = 13
      Caption = 'mN/m'
    end
    object Label11: TLabel
      Left = 8
      Top = 320
      Width = 76
      Height = 13
      Caption = 'Korrekturfaktor: '
    end
    object Label12: TLabel
      Left = 8
      Top = 272
      Width = 51
      Height = 13
      Caption = 'Mittelwert: '
    end
    object Label13: TLabel
      Left = 8
      Top = 296
      Width = 33
      Height = 13
      Caption = 'sigma: '
    end
    object Label14: TLabel
      Left = 8
      Top = 344
      Width = 30
      Height = 13
      Caption = 'OFS:  '
    end
    object Edit4: TEdit
      Left = 48
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit5: TEdit
      Left = 112
      Top = 48
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 8
      Top = 80
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hinzuf'#252'gen'
      TabOrder = 2
      OnClick = Panel1Click
    end
    object Panel2: TPanel
      Left = 104
      Top = 80
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Entfernen'
      TabOrder = 3
      OnClick = Panel2Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 112
      Width = 129
      Height = 153
      ItemHeight = 13
      TabOrder = 4
    end
    object Panel11: TPanel
      Left = 8
      Top = 368
      Width = 185
      Height = 25
      Cursor = crHandPoint
      Caption = 'Berechnen'
      TabOrder = 5
      OnClick = Panel11Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 216
    Top = 80
    Width = 201
    Height = 401
    Caption = 'Fl'#252'ssigkeit 2'
    TabOrder = 2
    object Label15: TLabel
      Left = 8
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Dichte: '
    end
    object Label16: TLabel
      Left = 96
      Top = 24
      Width = 28
      Height = 13
      Caption = 'g/cm'#179
    end
    object Label17: TLabel
      Left = 8
      Top = 56
      Width = 94
      Height = 13
      Caption = 'gemesse Spannung'
    end
    object Label18: TLabel
      Left = 160
      Top = 56
      Width = 29
      Height = 13
      Caption = 'mN/m'
    end
    object Label19: TLabel
      Left = 8
      Top = 320
      Width = 76
      Height = 13
      Caption = 'Korrekturfaktor: '
    end
    object Label20: TLabel
      Left = 8
      Top = 272
      Width = 51
      Height = 13
      Caption = 'Mittelwert: '
    end
    object Label21: TLabel
      Left = 8
      Top = 296
      Width = 33
      Height = 13
      Caption = 'sigma: '
    end
    object Label22: TLabel
      Left = 8
      Top = 344
      Width = 27
      Height = 13
      Caption = 'OFS: '
    end
    object Edit6: TEdit
      Left = 48
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit7: TEdit
      Left = 112
      Top = 48
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Panel3: TPanel
      Left = 8
      Top = 80
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hinzuf'#252'gen'
      TabOrder = 2
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 104
      Top = 80
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Entfernen'
      TabOrder = 3
      OnClick = Panel4Click
    end
    object ListBox2: TListBox
      Left = 8
      Top = 112
      Width = 129
      Height = 153
      ItemHeight = 13
      TabOrder = 4
    end
    object Panel12: TPanel
      Left = 8
      Top = 368
      Width = 185
      Height = 25
      Cursor = crHandPoint
      Caption = 'Berechnen'
      TabOrder = 5
      OnClick = Panel12Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 424
    Top = 80
    Width = 201
    Height = 401
    Caption = 'Fl'#252'ssigkeit 3'
    TabOrder = 3
    object Label23: TLabel
      Left = 8
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Dichte: '
    end
    object Label24: TLabel
      Left = 96
      Top = 24
      Width = 28
      Height = 13
      Caption = 'g/cm'#179
    end
    object Label25: TLabel
      Left = 8
      Top = 56
      Width = 94
      Height = 13
      Caption = 'gemesse Spannung'
    end
    object Label26: TLabel
      Left = 160
      Top = 56
      Width = 29
      Height = 13
      Caption = 'mN/m'
    end
    object Label27: TLabel
      Left = 8
      Top = 320
      Width = 76
      Height = 13
      Caption = 'Korrekturfaktor: '
    end
    object Label28: TLabel
      Left = 8
      Top = 272
      Width = 51
      Height = 13
      Caption = 'Mittelwert: '
    end
    object Label29: TLabel
      Left = 8
      Top = 296
      Width = 33
      Height = 13
      Caption = 'sigma: '
    end
    object Label30: TLabel
      Left = 8
      Top = 344
      Width = 27
      Height = 13
      Caption = 'OFS: '
    end
    object Edit8: TEdit
      Left = 48
      Top = 16
      Width = 41
      Height = 21
      TabOrder = 0
    end
    object Edit9: TEdit
      Left = 112
      Top = 48
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 8
      Top = 80
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Hinzuf'#252'gen'
      TabOrder = 2
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 104
      Top = 80
      Width = 89
      Height = 25
      Cursor = crHandPoint
      Caption = 'Entfernen'
      TabOrder = 3
      OnClick = Panel6Click
    end
    object ListBox3: TListBox
      Left = 8
      Top = 112
      Width = 129
      Height = 153
      ItemHeight = 13
      TabOrder = 4
    end
    object Panel13: TPanel
      Left = 8
      Top = 368
      Width = 185
      Height = 25
      Cursor = crHandPoint
      Caption = 'Berechnen'
      TabOrder = 5
      OnClick = Panel13Click
    end
  end
  object Panel7: TPanel
    Left = 8
    Top = 488
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Neu'
    TabOrder = 4
    OnClick = Panel7Click
  end
  object Panel8: TPanel
    Left = 160
    Top = 488
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = #214'ffnen'
    TabOrder = 5
    OnClick = Panel8Click
  end
  object Panel9: TPanel
    Left = 312
    Top = 488
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Speichern'
    TabOrder = 6
    OnClick = Panel9Click
  end
  object Panel10: TPanel
    Left = 464
    Top = 488
    Width = 161
    Height = 41
    Cursor = crHandPoint
    Caption = 'Beenden'
    TabOrder = 7
    OnClick = Panel10Click
  end
  object OpenDialog1: TOpenDialog
    Left = 560
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 592
    Top = 8
  end
end
