object Form2: TForm2
  Left = 322
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Photodatabase - Namen'
  ClientHeight = 199
  ClientWidth = 377
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clSkyBlue
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 109
    Height = 15
    Caption = 'aktuelle Namensliste'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 145
    Height = 169
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ItemHeight = 15
    ParentFont = False
    Sorted = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 168
    Top = 24
    Width = 201
    Height = 23
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 168
    Top = 56
    Width = 201
    Height = 25
    Cursor = crHandPoint
    Caption = 'Hinzuf'#252'gen'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Panel2: TPanel
    Left = 168
    Top = 88
    Width = 129
    Height = 25
    Cursor = crHandPoint
    Caption = 'Bearbeiten'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Panel3: TPanel
    Left = 304
    Top = 88
    Width = 65
    Height = 25
    Cursor = crHandPoint
    Caption = 'OK'
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
  object Panel4: TPanel
    Left = 168
    Top = 120
    Width = 201
    Height = 25
    Cursor = crHandPoint
    Caption = 'L'#246'schen'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button4Click
  end
  object Panel5: TPanel
    Left = 168
    Top = 152
    Width = 97
    Height = 41
    Cursor = crHandPoint
    Caption = 'Speichern'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button5Click
  end
  object Panel6: TPanel
    Left = 272
    Top = 152
    Width = 97
    Height = 41
    Cursor = crHandPoint
    Caption = 'Schlie'#223'en'
    Color = clGradientInactiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button6Click
  end
end
