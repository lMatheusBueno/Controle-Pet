object AgendasForm: TAgendasForm
  Left = 486
  Top = 186
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'AgendasForm'
  ClientHeight = 516
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sBevel1: TsBevel
    Left = 0
    Top = 195
    Width = 490
    Height = 27
    Shape = bsBottomLine
  end
  object sBevel2: TsBevel
    Left = 58
    Top = 316
    Width = 424
    Height = 24
    Shape = bsBottomLine
  end
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label1: TLabel
    Left = 8
    Top = 41
    Width = 66
    Height = 13
    Caption = 'Agendado p/:'
  end
  object Label3: TLabel
    Left = 8
    Top = 69
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label4: TLabel
    Left = 8
    Top = 93
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label5: TLabel
    Left = 8
    Top = 120
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label6: TLabel
    Left = 8
    Top = 147
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label7: TLabel
    Left = 355
    Top = 12
    Width = 33
    Height = 13
    Caption = 'N'#176' OS:'
  end
  object Label8: TLabel
    Left = 143
    Top = 12
    Width = 77
    Height = 13
    Caption = 'Cadastrado em:'
  end
  object Label9: TLabel
    Left = 262
    Top = 40
    Width = 16
    Height = 13
    Caption = 'at'#233
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 467
    Width = 500
    Height = 49
    Align = alBottom
    TabOrder = 0
    object sBitBtn1: TsBitBtn
      Left = 5
      Top = 10
      Width = 96
      Height = 33
      Caption = 'Gravar'
      TabOrder = 0
      ImageIndex = 4
      Images = PrincipalForm.sAlphaImageList2
      SkinData.SkinSection = 'SPEEDBUTTON'
      SkinData.ColorTone = clBlack
    end
    object sBitBtn2: TsBitBtn
      Left = 391
      Top = 10
      Width = 101
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = sBitBtn2Click
      ImageIndex = 5
      Images = PrincipalForm.sAlphaImageList3
      SkinData.SkinSection = 'SPEEDBUTTON'
      SkinData.ColorTone = clBlack
    end
  end
  object sDBMemo1: TsDBMemo
    Left = 59
    Top = 228
    Width = 423
    Height = 100
    Color = clWhite
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object sDBMemo2: TsDBMemo
    Left = 59
    Top = 346
    Width = 423
    Height = 97
    Color = clWhite
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object sDBEdit1: TsDBEdit
    Left = 56
    Top = 9
    Width = 81
    Height = 21
    Color = clWhite
    TabOrder = 3
  end
  object sDBEdit2: TsDBEdit
    Left = 228
    Top = 9
    Width = 121
    Height = 21
    Color = clWhite
    TabOrder = 4
  end
  object sDBEdit3: TsDBEdit
    Left = 392
    Top = 9
    Width = 73
    Height = 21
    Color = clWhite
    TabOrder = 5
  end
  object sDBEdit4: TsDBEdit
    Left = 56
    Top = 117
    Width = 58
    Height = 21
    Color = clWhite
    TabOrder = 6
  end
  object sDBEdit5: TsDBEdit
    Left = 120
    Top = 117
    Width = 335
    Height = 21
    Color = clWhite
    TabOrder = 7
  end
  object sDBEdit6: TsDBEdit
    Left = 57
    Top = 144
    Width = 57
    Height = 21
    Color = clWhite
    TabOrder = 8
  end
  object sDBEdit7: TsDBEdit
    Left = 120
    Top = 144
    Width = 335
    Height = 21
    Color = clWhite
    TabOrder = 9
  end
  object sBitBtn3: TsBitBtn
    Left = 458
    Top = 117
    Width = 21
    Height = 21
    TabOrder = 10
    ImageIndex = 2
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object sBitBtn4: TsBitBtn
    Left = 458
    Top = 144
    Width = 21
    Height = 21
    TabOrder = 11
    ImageIndex = 2
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object sDBComboBox1: TsDBComboBox
    Left = 57
    Top = 66
    Width = 169
    Height = 21
    Color = clWhite
    TabOrder = 12
  end
  object sDBComboBox2: TsDBComboBox
    Left = 57
    Top = 90
    Width = 169
    Height = 21
    Color = clWhite
    TabOrder = 13
  end
  object DateTimePicker1: TDateTimePicker
    Left = 80
    Top = 36
    Width = 168
    Height = 21
    Date = 44602.000000000000000000
    Time = 0.528308171298704100
    TabOrder = 14
  end
  object DateTimePicker2: TDateTimePicker
    Left = 289
    Top = 36
    Width = 176
    Height = 21
    Date = 44602.000000000000000000
    Time = 0.528308171298704100
    TabOrder = 15
  end
  object sBitBtn5: TsBitBtn
    Left = 55
    Top = 171
    Width = 90
    Height = 19
    Caption = 'Cadastrar'
    TabOrder = 16
    ImageIndex = 0
    SkinData.SkinSection = 'SPEEDBUTTON'
    SkinData.ColorTone = clBlack
  end
  object sBitBtn6: TsBitBtn
    Left = 153
    Top = 171
    Width = 83
    Height = 19
    Caption = 'Dados'
    TabOrder = 17
    ImageIndex = 14
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object sBitBtn7: TsBitBtn
    Left = 262
    Top = 171
    Width = 139
    Height = 20
    Caption = 'Hist'#243'rico de Agendas'
    TabOrder = 18
    ImageIndex = 9
    SkinData.SkinSection = 'SPEEDBUTTON'
  end
  object DsAgenda: TDataSource
    Left = 280
    Top = 440
  end
end
