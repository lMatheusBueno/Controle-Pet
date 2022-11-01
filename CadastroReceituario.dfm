object CadastroReceituarioForm: TCadastroReceituarioForm
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Receit'#250'ario'
  ClientHeight = 377
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel
    Left = 8
    Top = 139
    Width = 84
    Height = 19
    Caption = 'Receituario:'
    Color = clInfoText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentColor = False
    ParentFont = False
  end
  object Memo_Receituario: TsDBMemo
    AlignWithMargins = True
    Left = 5
    Top = 160
    Width = 545
    Height = 158
    Cursor = crIBeam
    Margins.Left = 5
    Margins.Top = 10
    Margins.Right = 5
    Align = alBottom
    Color = clWhite
    DataField = 'RECEITUARIOHIST'
    DataSource = Ds_Hist
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 500
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnKeyDown = Memo_ReceituarioKeyDown
    ExplicitWidth = 576
  end
  object PanelBtnPet: TsPanel
    Left = 0
    Top = 321
    Width = 555
    Height = 56
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 586
    DesignSize = (
      555
      56)
    object BtnGravar: TsBitBtn
      Left = 5
      Top = 9
      Width = 153
      Height = 40
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Gravar [Alt + Enter]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = BtnGravarClick
      ImageIndex = 4
      AnimatEvents = []
      Images = PrincipalForm.sAlphaImageList3
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object BtnCancelar: TsBitBtn
      Left = 413
      Top = 9
      Width = 137
      Height = 40
      Cursor = crHandPoint
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar [ESC]'
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
      Images = PrincipalForm.sAlphaImageList3
      SkinData.SkinSection = 'SPEEDBUTTON'
      ExplicitLeft = 444
    end
  end
  object sGroupBox1: TsGroupBox
    Left = 8
    Top = 0
    Width = 542
    Height = 133
    Caption = 'Dados do Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 20
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
      Color = clInfoText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 79
      Top = 68
      Width = 94
      Height = 16
      Caption = 'Nome do Animal'
      Color = clInfoText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 68
      Width = 39
      Height = 16
      Caption = 'C'#243'digo'
      Color = clInfoText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 79
      Top = 20
      Width = 94
      Height = 16
      Caption = 'Nome do Cliente'
      Color = clInfoText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Font.Quality = fqClearType
      ParentColor = False
      ParentFont = False
    end
    object Edit_CodigoPet: TsDBEdit
      Left = 10
      Top = 88
      Width = 63
      Height = 24
      Cursor = crNo
      Hint = 'Nome do Animal'
      Color = clWhite
      DataField = 'IDPET'
      DataSource = Ds_Hist
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object Edit_NomeCli: TsDBEdit
      Left = 79
      Top = 38
      Width = 420
      Height = 24
      Cursor = crNo
      Hint = 'Nome do Animal'
      Color = clWhite
      DataField = 'NOMECLIENTE'
      DataSource = Ds_Hist
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object Edit_CodigoCli: TsDBEdit
      Left = 10
      Top = 38
      Width = 63
      Height = 24
      Cursor = crNo
      Hint = 'Nome do Animal'
      Color = clWhite
      DataField = 'IDCLIENTE'
      DataSource = Ds_Hist
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object Edit_NomePet: TsDBEdit
      Left = 79
      Top = 88
      Width = 420
      Height = 24
      Cursor = crNo
      Hint = 'Nome do Animal'
      Color = clWhite
      DataField = 'NOMEPET'
      DataSource = Ds_Hist
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
    object BtnPesquisaPetVac: TsBitBtn
      Left = 505
      Top = 38
      Width = 24
      Height = 24
      TabOrder = 4
      TabStop = False
      OnClick = BtnPesquisaPetVacClick
      ImageIndex = 2
      Images = PrincipalForm.sAlphaImageList2
      SkinData.SkinSection = 'SPEEDBUTTON'
      SkinData.ColorTone = clBlack
    end
  end
  object Ds_Pet: TDataSource
    DataSet = DM.PetQuery
    Left = 436
    Top = 208
  end
  object Ds_Hist: TDataSource
    DataSet = DM.PetHistQuery
    Left = 484
    Top = 208
  end
end
