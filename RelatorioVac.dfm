object RelatorioVacForm: TRelatorioVacForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'RelatorioVacForm'
  ClientHeight = 235
  ClientWidth = 409
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
  object sLabel1: TsLabel
    Left = 8
    Top = 13
    Width = 72
    Height = 13
    Caption = 'T'#237'tulo Relat'#243'rio'
  end
  object sGroupBox1: TsGroupBox
    AlignWithMargins = True
    Left = 4
    Top = 62
    Width = 269
    Height = 111
    Margins.Left = 7
    Margins.Bottom = 10
    Caption = 'Filtro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 0
    object Check_FiltroPendente: TsRadioButton
      Left = 139
      Top = 47
      Width = 71
      Height = 20
      Cursor = crHandPoint
      Caption = 'Pendente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqDraft
      ParentFont = False
      TabOrder = 0
    end
    object Check_FiltroConcluido: TsRadioButton
      Left = 6
      Top = 48
      Width = 73
      Height = 20
      Cursor = crHandPoint
      Caption = 'Conclu'#237'do'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqDraft
      ParentFont = False
      TabOrder = 1
    end
    object Check_FiltroTodos: TsRadioButton
      Left = 6
      Top = 23
      Width = 53
      Height = 20
      Cursor = crHandPoint
      Caption = 'Todos'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqDraft
      ParentFont = False
      TabOrder = 2
      TabStop = True
    end
    object Check_FiltroAtraso: TsRadioButton
      Left = 139
      Top = 21
      Width = 77
      Height = 20
      Cursor = crHandPoint
      Caption = 'em Atraso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqDraft
      ParentFont = False
      TabOrder = 3
    end
    object Check_FiltroPendenteAtraso: TsRadioButton
      Left = 6
      Top = 72
      Width = 113
      Height = 20
      Cursor = crHandPoint
      Caption = 'Pendente/Atraso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqDraft
      ParentFont = False
      TabOrder = 4
    end
  end
  object PanelBtnPet: TsPanel
    Left = 0
    Top = 183
    Width = 409
    Height = 52
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 274
    ExplicitWidth = 692
    DesignSize = (
      409
      52)
    object BtnGravar: TsBitBtn
      Left = 4
      Top = 9
      Width = 115
      Height = 37
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = BtnGravarClick
      ImageIndex = 11
      AnimatEvents = []
      Images = PrincipalForm.sAlphaImageList2
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnCancelar: TsBitBtn
      Left = 289
      Top = 9
      Width = 115
      Height = 37
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = BtnCancelarClick
      ImageIndex = 5
      Images = PrincipalForm.sAlphaImageList2
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object sEdit1: TsEdit
    Left = 8
    Top = 32
    Width = 265
    Height = 24
    Cursor = crNo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = 'RELAT'#211'RIO DE VACINAS'
  end
end
