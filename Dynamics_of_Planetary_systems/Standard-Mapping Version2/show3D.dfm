object Form4: TForm4
  Left = 302
  Top = 213
  BorderStyle = bsDialog
  Caption = 'Standard-Mapping 3D-Darstellung'
  ClientHeight = 244
  ClientWidth = 440
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Pfad'
  end
  object Button1: TButton
    Left = 8
    Top = 208
    Width = 209
    Height = 33
    Cursor = crHandPoint
    Caption = 'Anzeigen'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 208
    Width = 209
    Height = 33
    Cursor = crHandPoint
    Caption = 'Beenden'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 40
    Top = 8
    Width = 217
    Height = 21
    TabOrder = 2
  end
  object Button3: TButton
    Left = 264
    Top = 8
    Width = 49
    Height = 25
    Cursor = crHandPoint
    Caption = '...'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 320
    Top = 8
    Width = 113
    Height = 25
    Cursor = crHandPoint
    Caption = 'Daten laden'
    TabOrder = 4
    OnClick = Button4Click
  end
  object GroupBox2: TGroupBox
    Left = 7
    Top = 40
    Width = 138
    Height = 161
    Caption = 'Daten der Datei'
    TabOrder = 5
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 61
      Height = 13
      Caption = 'x-Aufl'#246'sung: '
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 61
      Height = 13
      Caption = 'y-Aufl'#246'sung: '
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 62
      Height = 13
      Caption = 'k-Aufl'#246'sung: '
    end
    object Label5: TLabel
      Left = 8
      Top = 88
      Width = 25
      Height = 13
      Caption = 'kmin:'
    end
    object Label6: TLabel
      Left = 8
      Top = 112
      Width = 28
      Height = 13
      Caption = 'kmax:'
    end
    object Label7: TLabel
      Left = 8
      Top = 136
      Width = 56
      Height = 13
      Caption = 'Iterationen: '
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'opti.dat|*opti.dat'
    Left = 408
    Top = 8
  end
end
