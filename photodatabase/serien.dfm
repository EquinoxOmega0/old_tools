object Form3: TForm3
  Left = 254
  Top = 228
  BorderStyle = bsDialog
  Caption = 'Photodatabase - Serien'
  ClientHeight = 201
  ClientWidth = 375
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlue
  Font.Height = -13
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 105
    Height = 15
    Caption = 'aktuelle Seriensliste'
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
    Left = 166
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
    Left = 302
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
    Left = 166
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
    OnClick = Button5Click
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
    OnClick = Button4Click
  end
  object Panel6: TPanel
    Left = 270
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
