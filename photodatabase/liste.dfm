object Form4: TForm4
  Left = 383
  Top = 223
  BorderStyle = bsDialog
  Caption = 'Photodatabase - Liste zusammenstellen'
  ClientHeight = 390
  ClientWidth = 344
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlue
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 337
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 16
      Top = 16
      Width = 137
      Height = 17
      Caption = 'gesammte Datenbank'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 16
      Top = 40
      Width = 57
      Height = 17
      Caption = 'Serien'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object ListBox1: TListBox
      Left = 88
      Top = 40
      Width = 225
      Height = 97
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ItemHeight = 15
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 2
    end
    object RadioButton3: TRadioButton
      Left = 16
      Top = 152
      Width = 57
      Height = 17
      Caption = 'Namen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object ListBox2: TListBox
      Left = 88
      Top = 152
      Width = 225
      Height = 97
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ItemHeight = 15
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 4
    end
    object RadioButton4: TRadioButton
      Left = 16
      Top = 264
      Width = 113
      Height = 17
      Caption = 'Suche nach Titel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 136
      Top = 264
      Width = 177
      Height = 23
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object RadioButton5: TRadioButton
    Left = 24
    Top = 304
    Width = 145
    Height = 17
    Caption = 'Suche in Anmerkungen'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 176
    Top = 304
    Width = 145
    Height = 23
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 8
    Top = 352
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Neue Liste'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Panel2: TPanel
    Left = 120
    Top = 352
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Liste anh'#228'ngen'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object Panel3: TPanel
    Left = 232
    Top = 352
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Abbrechen'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
end
