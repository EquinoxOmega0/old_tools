object Form6: TForm6
  Left = 43
  Top = 4
  Width = 853
  Height = 977
  Caption = 'Innenwiderstand von Batterie'
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
  object PaintBox1: TPaintBox
    Left = 8
    Top = 600
    Width = 500
    Height = 300
    Cursor = crCross
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
  end
  object Label7: TLabel
    Left = 520
    Top = 640
    Width = 250
    Height = 13
    Caption = 'durchschnittliche relative Standardabweichung: 0,0%'
  end
  object Label8: TLabel
    Left = 824
    Top = 880
    Width = 15
    Height = 13
    Caption = 'mA'
  end
  object Label21: TLabel
    Left = 520
    Top = 656
    Width = 141
    Height = 13
    Caption = 'Innenwiderstand der Batterie: '
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 0
    Width = 273
    Height = 593
    Caption = 'Messreihe 1'
    TabOrder = 0
    object Label1: TLabel
      Left = 104
      Top = 32
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label2: TLabel
      Left = 240
      Top = 32
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label9: TLabel
      Left = 8
      Top = 544
      Width = 44
      Height = 13
      Caption = 'Uo davor'
    end
    object Label10: TLabel
      Left = 120
      Top = 544
      Width = 67
      Height = 13
      Caption = 'V und danach'
    end
    object Label11: TLabel
      Left = 256
      Top = 544
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label18: TLabel
      Left = 8
      Top = 568
      Width = 141
      Height = 13
      Caption = 'Innenwiderstand der Batterie: '
    end
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 144
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 8
      Top = 56
      Width = 121
      Height = 33
      Cursor = crHandPoint
      Caption = 'hinzu'
      TabOrder = 2
      OnClick = Panel1Click
    end
    object Panel2: TPanel
      Left = 8
      Top = 96
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Caption = 'auf'
      TabOrder = 3
      OnClick = Panel2Click
    end
    object Panel4: TPanel
      Left = 136
      Top = 56
      Width = 121
      Height = 33
      Cursor = crHandPoint
      Caption = 'entf.'
      TabOrder = 4
      OnClick = Panel4Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 128
      Width = 249
      Height = 401
      ItemHeight = 13
      TabOrder = 5
    end
    object Panel3: TPanel
      Left = 136
      Top = 96
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Caption = 'ab'
      TabOrder = 6
      OnClick = Panel3Click
    end
    object Edit7: TEdit
      Left = 56
      Top = 536
      Width = 57
      Height = 21
      TabOrder = 7
    end
    object Edit8: TEdit
      Left = 192
      Top = 536
      Width = 57
      Height = 21
      TabOrder = 8
    end
  end
  object GroupBox2: TGroupBox
    Left = 288
    Top = 0
    Width = 273
    Height = 593
    Caption = 'Messreihe 2'
    TabOrder = 1
    object Label3: TLabel
      Left = 104
      Top = 32
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label4: TLabel
      Left = 240
      Top = 32
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label12: TLabel
      Left = 8
      Top = 544
      Width = 44
      Height = 13
      Caption = 'Uo davor'
    end
    object Label13: TLabel
      Left = 120
      Top = 544
      Width = 67
      Height = 13
      Caption = 'V und danach'
    end
    object Label14: TLabel
      Left = 256
      Top = 544
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label19: TLabel
      Left = 8
      Top = 568
      Width = 141
      Height = 13
      Caption = 'Innenwiderstand der Batterie: '
    end
    object Edit3: TEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 144
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object Panel5: TPanel
      Left = 8
      Top = 56
      Width = 121
      Height = 33
      Cursor = crHandPoint
      Caption = 'hinzu'
      TabOrder = 2
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 8
      Top = 96
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Caption = 'auf'
      TabOrder = 3
      OnClick = Panel6Click
    end
    object Panel7: TPanel
      Left = 136
      Top = 56
      Width = 121
      Height = 33
      Cursor = crHandPoint
      Caption = 'entf.'
      TabOrder = 4
      OnClick = Panel7Click
    end
    object ListBox2: TListBox
      Left = 8
      Top = 128
      Width = 249
      Height = 401
      ItemHeight = 13
      TabOrder = 5
    end
    object Panel8: TPanel
      Left = 136
      Top = 96
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Caption = 'ab'
      TabOrder = 6
      OnClick = Panel8Click
    end
    object Edit9: TEdit
      Left = 56
      Top = 536
      Width = 57
      Height = 21
      TabOrder = 7
    end
    object Edit10: TEdit
      Left = 192
      Top = 536
      Width = 57
      Height = 21
      TabOrder = 8
    end
  end
  object GroupBox3: TGroupBox
    Left = 568
    Top = 0
    Width = 273
    Height = 593
    Caption = 'Messreihe 3'
    TabOrder = 2
    object Label5: TLabel
      Left = 104
      Top = 32
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label6: TLabel
      Left = 240
      Top = 32
      Width = 15
      Height = 13
      Caption = 'mA'
    end
    object Label15: TLabel
      Left = 8
      Top = 544
      Width = 44
      Height = 13
      Caption = 'Uo davor'
    end
    object Label16: TLabel
      Left = 120
      Top = 544
      Width = 67
      Height = 13
      Caption = 'V und danach'
    end
    object Label17: TLabel
      Left = 256
      Top = 544
      Width = 7
      Height = 13
      Caption = 'V'
    end
    object Label20: TLabel
      Left = 8
      Top = 568
      Width = 141
      Height = 13
      Caption = 'Innenwiderstand der Batterie: '
    end
    object Edit5: TEdit
      Left = 8
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 144
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object Panel9: TPanel
      Left = 8
      Top = 56
      Width = 121
      Height = 33
      Cursor = crHandPoint
      Caption = 'hinzu'
      TabOrder = 2
      OnClick = Panel9Click
    end
    object Panel10: TPanel
      Left = 8
      Top = 96
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Caption = 'auf'
      TabOrder = 3
      OnClick = Panel10Click
    end
    object Panel11: TPanel
      Left = 136
      Top = 56
      Width = 121
      Height = 33
      Cursor = crHandPoint
      Caption = 'entf.'
      TabOrder = 4
      OnClick = Panel11Click
    end
    object ListBox3: TListBox
      Left = 8
      Top = 128
      Width = 249
      Height = 401
      ItemHeight = 13
      TabOrder = 5
    end
    object Panel12: TPanel
      Left = 136
      Top = 96
      Width = 121
      Height = 25
      Cursor = crHandPoint
      Caption = 'ab'
      TabOrder = 6
      OnClick = Panel12Click
    end
    object Edit11: TEdit
      Left = 56
      Top = 536
      Width = 57
      Height = 21
      TabOrder = 7
    end
    object Edit12: TEdit
      Left = 192
      Top = 536
      Width = 57
      Height = 21
      TabOrder = 8
    end
  end
  object Panel13: TPanel
    Left = 520
    Top = 600
    Width = 321
    Height = 33
    Cursor = crHandPoint
    Caption = 'Berechnen'
    TabOrder = 3
    OnClick = Panel13Click
  end
  object Panel14: TPanel
    Left = 520
    Top = 704
    Width = 113
    Height = 33
    Cursor = crHandPoint
    Caption = 'Graph Messreihe 1'
    TabOrder = 4
    OnClick = Panel14Click
  end
  object Panel15: TPanel
    Left = 520
    Top = 744
    Width = 113
    Height = 33
    Cursor = crHandPoint
    Caption = 'Graph Messreihe 2'
    TabOrder = 5
    OnClick = Panel15Click
  end
  object Panel16: TPanel
    Left = 520
    Top = 784
    Width = 113
    Height = 33
    Cursor = crHandPoint
    Caption = 'Graph Messreihe 3'
    TabOrder = 6
    OnClick = Panel16Click
  end
  object Panel17: TPanel
    Left = 656
    Top = 704
    Width = 185
    Height = 33
    Cursor = crHandPoint
    Caption = 'alle 3 Graphen'
    TabOrder = 7
    OnClick = Panel17Click
  end
  object Panel18: TPanel
    Left = 656
    Top = 744
    Width = 185
    Height = 33
    Cursor = crHandPoint
    Caption = 'mittlere Graph'
    TabOrder = 8
    OnClick = Panel18Click
  end
  object Panel19: TPanel
    Left = 656
    Top = 784
    Width = 185
    Height = 33
    Cursor = crHandPoint
    Caption = 'dicker Graph'
    TabOrder = 9
    OnClick = Panel19Click
  end
  object Panel20: TPanel
    Left = 520
    Top = 824
    Width = 321
    Height = 33
    Cursor = crHandPoint
    Caption = 'Graph der relativen Standardabweichung'
    TabOrder = 10
    OnClick = Panel20Click
  end
  object Panel21: TPanel
    Left = 520
    Top = 864
    Width = 225
    Height = 33
    Cursor = crHandPoint
    Caption = 'Graph mit Balken alle'
    TabOrder = 11
    OnClick = Panel21Click
  end
  object SpinEdit1: TSpinEdit
    Left = 752
    Top = 872
    Width = 65
    Height = 22
    MaxValue = 1000
    MinValue = 1
    TabOrder = 12
    Value = 10
  end
  object Panel22: TPanel
    Left = 8
    Top = 904
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Neu'
    TabOrder = 13
    OnClick = Panel22Click
  end
  object Panel23: TPanel
    Left = 176
    Top = 904
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Laden'
    TabOrder = 14
    OnClick = Panel23Click
  end
  object Panel24: TPanel
    Left = 344
    Top = 904
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Speichern'
    TabOrder = 15
    OnClick = Panel24Click
  end
  object Panel25: TPanel
    Left = 680
    Top = 904
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Beenden'
    TabOrder = 16
    OnClick = Panel25Click
  end
  object Panel26: TPanel
    Left = 512
    Top = 904
    Width = 161
    Height = 33
    Cursor = crHandPoint
    Caption = 'Bild abspeichern'
    TabOrder = 17
    OnClick = Panel26Click
  end
  object CheckBox1: TCheckBox
    Left = 520
    Top = 680
    Width = 321
    Height = 17
    Caption = 'Verbrauchserscheinung der Batterie korrigieren (erste N'#228'herung)'
    TabOrder = 18
    OnClick = CheckBox1Click
  end
  object SaveDialog1: TSaveDialog
    Left = 48
    Top = 608
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 608
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 80
    Top = 608
  end
end
