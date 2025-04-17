object Form1: TForm1
  Left = 193
  Top = 119
  Width = 972
  Height = 691
  Caption = 'kubische Splines'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 160
    Top = 8
    Width = 800
    Height = 600
    Cursor = crCross
    OnMouseDown = PaintBox1MouseDown
    OnMouseMove = PaintBox1MouseMove
    OnMouseUp = PaintBox1MouseUp
  end
  object Label5: TLabel
    Left = 168
    Top = 616
    Width = 54
    Height = 13
    Caption = 'Position: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 224
    Top = 616
    Width = 29
    Height = 13
    Caption = '(0/0)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 145
    Height = 313
    Caption = 'Werteeingabe'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 32
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object Label2: TLabel
      Left = 8
      Top = 64
      Width = 5
      Height = 13
      Caption = 'y'
    end
    object Edit1: TEdit
      Left = 24
      Top = 24
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 24
      Top = 56
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 8
      Top = 88
      Width = 57
      Height = 17
      Cursor = crHandPoint
      Caption = 'Hinzu'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 72
      Top = 88
      Width = 57
      Height = 17
      Cursor = crHandPoint
      Caption = 'L'#246'schen'
      TabOrder = 3
      OnClick = Button2Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 136
      Width = 121
      Height = 169
      ItemHeight = 13
      TabOrder = 4
    end
    object Button3: TButton
      Left = 8
      Top = 112
      Width = 121
      Height = 17
      Cursor = crHandPoint
      Caption = 'Sortiere nach x'
      TabOrder = 5
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 328
    Width = 145
    Height = 113
    Caption = 'Randbedingungen'
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 32
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label4: TLabel
      Left = 8
      Top = 64
      Width = 6
      Height = 13
      Caption = 'n'
    end
    object Edit3: TEdit
      Left = 40
      Top = 24
      Width = 89
      Height = 21
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 40
      Top = 56
      Width = 89
      Height = 21
      TabOrder = 1
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 88
      Width = 41
      Height = 17
      Caption = 'y"'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 72
      Top = 88
      Width = 41
      Height = 17
      Caption = 'y'#39
      TabOrder = 3
    end
  end
  object Button5: TButton
    Left = 8
    Top = 448
    Width = 145
    Height = 41
    Cursor = crHandPoint
    Caption = 'Berechnen'
    TabOrder = 2
    OnClick = Button5Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 496
    Width = 145
    Height = 137
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    Left = 864
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 896
    Top = 8
  end
  object SaveDialog2: TSaveDialog
    Left = 928
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 800
    Top = 8
    object Datei1: TMenuItem
      Caption = 'Datei'
      object Neu1: TMenuItem
        Caption = 'Neu'
        OnClick = Neu1Click
      end
      object Speichern1: TMenuItem
        Caption = 'Werte Speichern'
        OnClick = Speichern1Click
      end
      object WerteLaden1: TMenuItem
        Caption = 'Werte Laden'
        OnClick = WerteLaden1Click
      end
      object ErgebnisseSpeichern1: TMenuItem
        Caption = 'Ergebnisse Speichern'
        OnClick = ErgebnisseSpeichern1Click
      end
      object Beenden1: TMenuItem
        Caption = 'Beenden'
        OnClick = Beenden1Click
      end
    end
    object Berechnen1: TMenuItem
      Caption = 'Berechnen'
      OnClick = Berechnen1Click
    end
    object Werte1: TMenuItem
      Caption = 'Werte'
      object Hinzu1: TMenuItem
        Caption = 'Hinzu'
        OnClick = Hinzu1Click
      end
      object Lschen1: TMenuItem
        Caption = 'L'#246'schen'
        OnClick = Lschen1Click
      end
      object Sortierenachx1: TMenuItem
        Caption = 'Sortiere nach x'
        OnClick = Sortierenachx1Click
      end
    end
    object Grafik1: TMenuItem
      Caption = 'Grafik'
      object Anzeigen1: TMenuItem
        Caption = 'Anzeigen'
        OnClick = Anzeigen1Click
      end
      object Speichern2: TMenuItem
        Caption = 'Speichern'
        OnClick = Speichern2Click
      end
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 832
    Top = 8
  end
end
