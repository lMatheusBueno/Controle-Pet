unit CadastroPet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sComboBox, Vcl.Mask,
  Vcl.DBCtrls, sDBEdit, Vcl.ExtCtrls, acImage, sSkinProvider, sSkinManager,
  sEdit, sPanel, sMemo, Vcl.Buttons, sBitBtn, System.ImageList, Vcl.ImgList,
  sDialogs,
  acAlphaImageList, sDBComboBox, sDBMemo, Data.DB, sButton, Vcl.ComCtrls,
  frxClass, frxDBSet, sMaskEdit, sCustomComboEdit, sToolEdit, sDBDateEdit,
  sLabel, sDBText, AdvCombo, AdvDBComboBox, sPageControl, frxExportBaseDialog,
  frxExportPDF, sBevel, sGroupBox, sSpeedButton, acDBBtns, AdvUtil, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Vcl.ExtDlgs;

type
  TCadastroPetForm = class(TForm)
    PanelBtnPet: TsPanel;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    BtnGravar: TsBitBtn;
    sAlphaImageList1: TsAlphaImageList;
    sAlphaImageList2: TsAlphaImageList;
    S: TsAlphaImageList;
    DSpetquery: TDataSource;
    sAlphaImageList3: TsAlphaImageList;
    DSextra: TDataSource;
    BtnCancelar: TsBitBtn;
    sSkinManager2: TsSkinManager;
    FrxPet: TfrxDBDataset;
    FrxReceituario: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    DsColaboradorVet: TDataSource;
    DSPetHist: TDataSource;
    Dog: TsAlphaImageList;
    DsVacinas: TDataSource;
    Timer1: TTimer;
    AbrirImagem_old: TsOpenPictureDialog;
    DsVacAux: TDataSource;
    AbrirImagem: TsOpenPictureDialog;
    sBevel5: TsBevel;
    PagePet: TsPageControl;
    sTabSheet1: TsTabSheet;
    txtcod: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    sBevel3: TsBevel;
    Label8: TLabel;
    sBevel2: TsBevel;
    Edit_Codigo: TsDBEdit;
    Edit_Nome: TsDBEdit;
    DateNascimento: TsDBDateEdit;
    TxtIdade: TsDBEdit;
    Edit_CodigoCli: TsDBEdit;
    Edit_NomeCli: TsDBEdit;
    BtnLocalizarCli: TsBitBtn;
    sBitBtn6: TsBitBtn;
    BtnLocalizarVet: TsBitBtn;
    sBitBtn4: TsBitBtn;
    Memo_Anotacao: TsDBMemo;
    DateCad: TsDBDateEdit;
    BoxSexo: TsDBComboBox;
    BoxRaca: TsDBComboBox;
    BoxSituacao: TsDBComboBox;
    sGroupBox1: TsGroupBox;
    sBevel4: TsBevel;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sBitBtn1: TsBitBtn;
    Imagem2: TDBImage;
    BoxEspecie: TsDBComboBox;
    Edit_CodigoVet: TsDBEdit;
    Edit_Veterinario: TsDBEdit;
    sTabSheet3: TsTabSheet;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    sBevel6: TsBevel;
    Label15: TLabel;
    Edit_CodVacinas: TsDBEdit;
    Edit_Vacina: TsDBEdit;
    BtnGravarVac: TsButton;
    MemoObs: TsDBMemo;
    DataVacina: TsDBDateEdit;
    DataHoje: TsDBDateEdit;
    BtnCancelarVac: TsButton;
    Edit_DiasProx: TsDBEdit;
    BoxStatusVac: TsDBComboBox;
    BtnCadVac: TsButton;
    Btn_EditarVac: TsButton;
    Grid_Vacinas: TDBAdvGrid;
    Receituário: TsTabSheet;
    Memo_Receituario: TsDBMemo;
    sSavePictureDialog1: TsSavePictureDialog;
    sLabel1: TsLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure limpa;
    procedure Edit_NomeChange(Sender: TObject);
    procedure Edit_CodigoCliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnImprimirClick(Sender: TObject);
    function DataVac(DataVacina: String): Integer;
    function DataIdade(DataNascimento: String): Integer;
    procedure DateNascimentoExit(Sender: TObject);
    procedure BtnLocalizarVetClick(Sender: TObject);
    procedure Edit_CodigoVetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BoxEspecieEnter(Sender: TObject);
    procedure BoxRacaEnter(Sender: TObject);
    procedure txtnomevet1Change(Sender: TObject);
    procedure sDBEdit2Change(Sender: TObject);
    procedure sDBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure sBitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo_ReceituarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sBitBtn4Click(Sender: TObject);
    procedure BtnLocalizarCliClick(Sender: TObject);
    procedure HistoricoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure PagePetChange(Sender: TObject);
    procedure datahojeClick(Sender: TObject);
    procedure datahojeExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure BtnCadVacClick(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure BtnCancelarVacClick(Sender: TObject);
    procedure BtnGravarVacClick(Sender: TObject);
    procedure BotoesEnable();
    procedure BtnRemoverVacClick(Sender: TObject);
    procedure ListarVacina();
    procedure BoxStatusVacExit(Sender: TObject);
    procedure Btn_EditarVacClick(Sender: TObject);
    procedure Btn_ExcluirVacClick(Sender: TObject);
    procedure Grid_VacinasDblClick(Sender: TObject);
    procedure Edit_CodigoVetChange(Sender: TObject);
    procedure CarregarDiasVacina();
    procedure Edit_CodigoVetKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_CodigoCliKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    procedure teclas_atalhos(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure teclas_atalhos2(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  end;

var
  CadastroPetForm: TCadastroPetForm;
  dias, anos, mes: Integer;

implementation

{$R *.dfm}

uses DataModulo,

  Vacinas, HitoricoPet, Principal, LocalizarCliente, Notificacao,
  LocalizarVeterinario, LocalizarPet, CadastroVacinas;

function TCadastroPetForm.DataIdade(DataNascimento: String): Integer;
begin
  try
    strtodate(DataNascimento); // -- Verifica se a data é valida

  except
    messagedlg('Data de nascimento inválida!', MTERROR, [MBOK], 0);
    abort;
  end;
  result := Trunc((Date - strtodate(DataNascimento)) / 365.25);
  anos := Trunc((Date - strtodate(DataNascimento)) / 365.25);
  mes := Trunc((Date - strtodate(DataNascimento)));
  mes := mes mod 365;
  dias := mes;
  mes := mes div 30;

end;

function TCadastroPetForm.DataVac(DataVacina: String): Integer;
begin
  try
    strtodate(DataVacina); // -- Verifica se a data é valida

  except
    messagedlg('Data de Vacinação inválida!', MTERROR, [MBOK], 0);
    abort;
  end;
  result := Trunc((strtodate(DataVacina)));

end;

procedure TCadastroPetForm.limpa;
begin
  Edit_Nome.text := '';
end;

procedure TCadastroPetForm.ListarVacina;
var
  I: Integer;
begin
  for I := 1 to DM.PetQuery.RecordCount do
  begin

    if DM.PetQueryPETCOD.Value <> '' then
    begin
      DM.VacQuery.Close;
      DM.VacQuery.Open;
      DM.VacQuery.SQL.Clear;
      DM.VacQuery.SQL.Add('select *from PETSVAC where (COD_PET_VAC) = ' +
        (Edit_Codigo.text));
      DM.VacQuery.Open;
    end;
  end;
end;

procedure TCadastroPetForm.Memo_ReceituarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    Memo_Receituario.ReadOnly := false;

  end;
end;

procedure TCadastroPetForm.PagePetChange(Sender: TObject);
begin
  if DM.PetQuery.State <> dsInsert then
  begin
    if DM.PetQueryPETCOD.Value <> '' then
    begin
      ListarVacina;
    end;
  end;
end;

procedure TCadastroPetForm.FormCreate(Sender: TObject);
begin
  PagePet.ActivePageIndex := 0;
end;

procedure TCadastroPetForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  Begin
    // BtnCancelarClick(Sender);
    BtnCancelar.Click;
  End;

  if (Shift = [ssAlt]) and (Key = VK_RETURN) then
  begin
    BtnGravarClick(Sender);
  end;
end;

procedure TCadastroPetForm.HistoricoClick(Sender: TObject);
begin
  if Edit_Codigo.text <> '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Nil);
    NotificacaoForm.ShowModal;
    NotificacaoForm.Free;
  end;
end;

procedure TCadastroPetForm.BtnCadVacClick(Sender: TObject);
var
  I: Integer;
begin
  if DM.PetQueryPETCOD.Value <> '' then
  Begin
    DM.VacQuery.Open;
    DM.VacQuery.Append;
    if DM.VacQueryCOD_VAC.Value = '' then
    begin
      DM.AuxQuery3.Close;
      DM.AuxQuery3.SQL.Clear;
      DM.AuxQuery3.SQL.Add
        ('select MAX(cast(ID_VAC as integer)) as numero from petsvac');
      DM.AuxQuery3.Open;
      if (DM.AuxQuery3.FieldByName('numero').AsString <> '') then
      begin
        if (DM.VacQuery.State = dsInsert) then
        begin
          I := DM.AuxQuery3.FieldByName('numero').AsInteger + 1;
          DM.VacQueryCOD_VAC.AsString := FormatFloat('0000', I);
        end;
      end
      else
      begin
        DM.VacQueryCOD_VAC.AsString := FormatFloat('0000', 1);
        DM.TRANSACION.CommitRetaining;
      end;

    end;
    { BOTOES }
    BotoesEnable;
    // LocalizarPetForm;

  End
  else
  begin
    sMessageDlg('Atenção',
      'Antes de cadastrar as vacinas é preciso cadastrar o Pet!', mtInformation,
      [MBOK], 0);

  end;
end;

procedure TCadastroPetForm.BtnCancelarClick(Sender: TObject);
begin

  if (DM.PetQuery.Modified = true) or (DM.VacQuery.Modified = true) then
  begin
    begin
      NotificacaoForm := TNotificacaoForm.Create(Self);
      NotificacaoForm.Btn_Enter.Visible := false;
      NotificacaoForm.Btn_Sim.Visible := true;
      NotificacaoForm.Btn_Nao.Visible := true;
      NotificacaoForm.sLabel1.Caption :=
        ('Houve alterações no Cadastro do Pet' + #13 +
        ' Deseja sair sem Gravar? ');
      NotificacaoForm.ShowModal;
    end;
  end
  else
  begin
    CadastroPetForm.Close;
  end;
end;

procedure TCadastroPetForm.BtnGravarClick(Sender: TObject);
var
  I: Integer;

begin

  if Edit_Nome.text = '' then
  begin
    sMessageDlg('Atenção', 'Informe o Nome do Pet!', mtInformation, [MBOK], 0);
  end
  else if (Edit_NomeCli.text = '') and (Edit_NomeCli.text = '') then
  begin
    sMessageDlg('Atenção', 'Informe o Nome do Cliente!', mtInformation,
      [MBOK], 0);
  end
  else if (Edit_CodigoVet.text = '') and (Edit_Veterinario.text = '') then
  begin
    sMessageDlg('Atenção', 'Informe o Veterinário!', mtInformation, [MBOK], 0);
  end

  else
  begin
    DM.AuxQuery3.Close;
    DM.AuxQuery3.SQL.Clear;
    DM.AuxQuery3.SQL.Add
      ('select MAX(cast(PETCOD as integer)) as numero from pets');
    DM.AuxQuery3.Open;
    if (DM.AuxQuery3.FieldByName('numero').AsString <> '') then
    begin
      if (DM.PetQuery.State = dsInsert) then
      begin
        I := DM.AuxQuery3.FieldByName('numero').AsInteger + 1;
        DM.PetQueryPETCOD.AsString := FormatFloat('0000', I);
      end;
    end
    else
    begin
      DM.PetQueryPETCOD.AsString := FormatFloat('0000', 1);
      DM.TRANSACION.CommitRetaining;
    end;

    if DM.PetQuery.Modified = true or (DM.PetQuery.State = dsInsert) then
    begin
      DM.PetHistQuery.Open;
      DM.PetHistQuery.Append;
      With DM.PetHistQuery do
      begin
       FieldByName('IDPET').Value := DM.PetQueryPETCOD.Value;
       FieldByName('NOMEPET').Value := DM.PetQueryNOMEPET.Value;
       FieldByName('RECEITUARIOHIST').Value := DM.PetQueryRECEITUARIO.Value;
       FieldByName('IDCLIENTE').Value := DM.PetQueryCOD_CLIENTE_PET.Value;
       FieldByName('NOMECLIENTE').Value := DM.PetQueryNOMECLIENTE.Value;
       FieldByName('DATACADHIST').Value := now;
      end;
      DM.PetHistQuery.Post;
    end;

    if (DM.VacQuery.State = dsInsert) and (Edit_Vacina.text <> '') then
    begin
      DM.VacQuery.Post;
    end

    else if (Edit_Vacina.text = '') then
    begin
      DM.VacQuery.CancelUpdates;
    end;

    if DM.PetQuery.State <> dsEdit then
    begin
      DM.PetQuery.Post;
      DM.TRANSACION.CommitRetaining;
      DM.PetQuery.Close;
      DM.PetQuery.Open;
      CadastroPetForm.Visible := false;
      NotificacaoForm := TNotificacaoForm.Create(Self);
      NotificacaoForm.Btn_Enter.Visible := false;
      NotificacaoForm.Btn_Sim.Visible := true;
      NotificacaoForm.Btn_Nao.Visible := true;
      NotificacaoForm.sLabel1.Caption :=
        'Deseja Realizer o Cadastro de Vacina para o Pet?';
      NotificacaoForm.ShowModal;
    end
    else
    begin
      DM.PetQuery.Post;
      DM.PetQuery.Close;
      DM.PetQuery.Open;
      DM.PetQuery.ApplyUpdates;
      Close;
    end;
  end;
end;

procedure TCadastroPetForm.BtnGravarVacClick(Sender: TObject);

begin
  if Edit_Vacina.text = '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Self);
    NotificacaoForm.sLabel1.Caption := ('Por favor informe o nome da Vacina!');
  end
  else if Edit_DiasProx.text = '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Self);
    NotificacaoForm.sLabel1.Caption := ('Por favor informe a data da Vacina!');
    NotificacaoForm.ShowModal;
  end
  else if (Edit_NomeCli.text <> '') then
  begin
    if DM.VacQuery.State = dsInsert then
    begin
      DM.VacQueryCOD_PET_VAC.Value := DM.PetQueryPETCOD.Value;
      DM.VacQueryID_PET_VAC.Value := inttostr(DM.PetQueryIDPET.Value);
      DM.VacQueryNOME_PET_VAC.Value := DM.PetQueryNOMEPET.Value;
      DM.VacQueryID_CLIENTE.Value := (DM.PetQueryCOD_CLIENTE_PET.Value);
      DM.VacQueryNOME_CLIENTE.Value := DM.PetQueryNOMECLIENTE.Value;
      DM.VacQueryID_VETERINARIO_VAC.Value := DM.PetQueryIDVETERINARIO.Value;
      DM.VacQueryTEL_CLIENTE.Value := DM.ClientesQueryFONE1.Value;
      BoxStatusVac.ItemIndex := 1;
    end;
  enD;

  if (Edit_NomeCli.text <> '') and (Edit_DiasProx.text <> '') and
    (Edit_Vacina.text <> '') then
  begin
    DM.VacQuery.Post;
    ListarVacina;
    BotoesEnable;
    if (DM.PetQuery.State = dsInsert) then
    begin
      CadastroPetForm.Close;
    end;
  end;

end;

procedure TCadastroPetForm.BtnImprimirClick(Sender: TObject);
begin
  if DM.PetQueryRECEITUARIO.Value <> '' then
  begin
    FrxReceituario.PrepareReport();
    FrxReceituario.ShowReport();
  end
  else
  begin
    sMessageDlg('Atenção', 'Receituario está em branco', mtInformation,
      [MBOK], 0);
  end;
end;

procedure TCadastroPetForm.sBitBtn1Click(Sender: TObject);
begin
  Imagem2.Picture := nil;
  if AbrirImagem.Execute = true then
  begin
    Imagem2.Picture.LoadFromFile(AbrirImagem.FileName);
  end;

end;

procedure TCadastroPetForm.sBitBtn3Click(Sender: TObject);
begin
  Imagem2.Picture := nil;
end;

procedure TCadastroPetForm.sBitBtn4Click(Sender: TObject);
begin
  // DM.VetQuery.Open;
  sMessageDlg('Para o Alan do futuro',
    'Coloca aqui a tela de Cadastro do cliente', mtInformation, [MBOK], 0);
end;

procedure TCadastroPetForm.BtnLocalizarCliClick(Sender: TObject);
begin
  FomrLocalizarCliente := TFomrLocalizarCliente.Create(nil);
  FomrLocalizarCliente.ShowModal;
  FomrLocalizarCliente.Free;
end;

procedure TCadastroPetForm.BtnLocalizarVetClick(Sender: TObject);
begin
  LocalizarVetForm := TLocalizarVetForm.Create(NIL);
  LocalizarVetForm.ShowModal;
  LocalizarVetForm.Free;
end;

procedure TCadastroPetForm.BtnRemoverVacClick(Sender: TObject);
begin
  if sMessageDlg('Atenção', 'Deseja excluir o registro de vacinas?', mtWarning,
    [mbYes, mbNo], 0) = mrYes then
  begin
    DM.VacQuery.Delete;
  end;
end;

procedure TCadastroPetForm.datahojeClick(Sender: TObject);
begin
  DataHoje.text := DateToStr(now);
end;

procedure TCadastroPetForm.datahojeExit(Sender: TObject);
begin
  CarregarDiasVacina;
end;

procedure TCadastroPetForm.sBitBtn6Click(Sender: TObject);
begin
  sMessageDlg('Para o Alan do futuro',
    'Coloca aqui a tela de Informações do cliente', mtInformation, [MBOK], 0);
end;

procedure TCadastroPetForm.Btn_EditarVacClick(Sender: TObject);
begin
  begin
    DM.VetQuery.Open;
    VacinasForm := TVacinasForm.Create(nil);
    VacinasForm.Edit_LocalizaVac.text := Edit_Nome.text;
    VacinasForm.Edit_LocalizaVac.ReadOnly := true;
    VacinasForm.ShowModal;
    VacinasForm.Free;
  end;
end;

procedure TCadastroPetForm.Btn_ExcluirVacClick(Sender: TObject);
begin
  if DM.VacQuery.RecordCount <> 0 then
  Begin
    if sMessageDlg('Atenção', 'Deseja excluir o registro da vacina?', mtWarning,
      [mbYes, mbNo], 0) = mrYes then
    begin
      DM.VacQuery.Delete;
      ListarVacina;
    end;
  End;
end;

procedure TCadastroPetForm.CarregarDiasVacina;
var
  resultado, resultado2: string;
  Data: Integer;

begin
  resultado := FloatToStr(DataVac(DateToStr(now)));
  resultado2 := FloatToStr(DataVac(DataHoje.text));
  Data := StrToInt(resultado2) - StrToInt(resultado);
  if ((resultado <> '') and (resultado2 <> '')) then
  begin
    begin
      DM.VacQueryDIAS_VACINA.Value :=
        inttostr(StrToInt(resultado2) - StrToInt(resultado));
    end;
  end;

  if Data >= 0 then
  Begin
    BoxStatusVac.ItemIndex := 0;
    DM.VacQuerySTATUS_VAC.Value := BoxStatusVac.text;
  End
  else if Data < 0 then
  Begin
    BoxStatusVac.ItemIndex := 2;
    DM.VacQuerySTATUS_VAC.Value := BoxStatusVac.text;
    BoxStatusVac.Font.Color := clRed;
  End;
  { Pendente |Concluido| em Atraso }

end;

procedure TCadastroPetForm.BtnCancelarVacClick(Sender: TObject);
begin
  DM.VacQuery.CancelUpdates;
  DM.VacQuery.Close;
  BotoesEnable;
end;

procedure TCadastroPetForm.BoxRacaEnter(Sender: TObject);
begin
  DM.AuxQuery3.Close;
  DM.AuxQuery3.SQL.Clear;
  DM.AuxQuery3.SQL.Add
    ('select DISTINCT RACA from PETS WHERE RACA IS NOT NULL ');
  DM.AuxQuery3.Open;
  with DM.AuxQuery3 do
  begin
    First;
    BoxRaca.Items.Clear;
    while not eof do
    begin
      BoxRaca.Items.Add(FieldByName('RACA').AsString);
      Next;
    end;
  end;
end;

procedure TCadastroPetForm.BoxStatusVacExit(Sender: TObject);
begin
  datahojeExit(Sender);
  sMessageDlg('Atenção', 'Para Alterar o Status da Vacina vá até [VACINAS]',
    mtInformation, [MBOK], 0);
end;

procedure TCadastroPetForm.BotoesEnable();
begin
  BtnGravarVac.Enabled := not BtnGravarVac.Enabled;
  Edit_Vacina.Enabled := not Edit_Vacina.Enabled;
  DataHoje.Enabled := not DataHoje.Enabled;
  BtnCadVac.Enabled := not BtnCadVac.Enabled;
  BtnCancelarVac.Enabled := not BtnCancelarVac.Enabled;
  MemoObs.Enabled := not MemoObs.Enabled;
  Btn_EditarVac.Enabled := not Btn_EditarVac.Enabled;
end;

procedure TCadastroPetForm.BoxEspecieEnter(Sender: TObject);

begin
  DM.AuxQuery2.Close;
  DM.AuxQuery2.SQL.Clear;
  DM.AuxQuery2.SQL.Add
    ('select DISTINCT ESPECIE from PETS WHERE ESPECIE IS NOT NULL ');
  DM.AuxQuery2.Open;

  with DM.AuxQuery2 do
  begin
    First;
    BoxEspecie.Items.Clear;
    while not eof do
    begin
      BoxEspecie.Items.Add(FieldByName('ESPECIE').AsString);
      Next;
    end;
  end;

end;

procedure TCadastroPetForm.DateNascimentoExit(Sender: TObject);
// CALCULAR IDADE
begin
  DM.PetQueryIDADEPET.Value := FloatToStr(DataIdade(DateNascimento.text))
    + ' ano ';
  if (DataIdade(DateNascimento.text)) > 1 then
  begin
    DM.PetQueryIDADEPET.Value := FloatToStr(DataIdade(DateNascimento.text))
      + ' anos ';
  end;
  if (DataIdade(DateNascimento.text)) <= 0 then
  begin
    DM.PetQueryIDADEPET.Value := inttostr(mes) + ' meses';
    if mes = 1 then
    begin
      DM.PetQueryIDADEPET.Value := inttostr(mes) + ' mes';
    end
    else if mes <= 0 then
    begin
      if dias = 1 then
      begin
        DM.PetQueryIDADEPET.Value := inttostr(dias) + ' dia';
      end
      else
      begin
        DM.PetQueryIDADEPET.Value := inttostr(dias) + ' dias';
      end;
    end;

  end;
end;

procedure TCadastroPetForm.Grid_VacinasDblClick(Sender: TObject);
begin
  if DM.VacQuery.RecordCount <> 0 then
  begin
    DM.VacQuery.Edit;
    CadastroVacinasForm := TCadastroVacinasForm.Create(nil);
    CadastroVacinasForm.ShowModal;
    CadastroVacinasForm.Free;
  end;
end;

procedure TCadastroPetForm.sDBEdit2Change(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      TEdit(Components[I]).text := '';
end;

procedure TCadastroPetForm.sDBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then

  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

procedure TCadastroPetForm.teclas_atalhos(Sender: TObject; var Key: Word;
  // CARREGAR CLIENTES E GERAR CODIGO
  Shift: TShiftState);
begin
  if true then

    DM.extraquery.SQL.text :=
      'select first 1 COD,RAZAO from CLIENTES where cod like ' +
      QuotedStr('%' + Edit_CodigoCli.text + '%');
  DM.extraquery.Open;
  if (DM.extraquery.FieldByName('COD').AsString <> '') and (Edit_CodigoCli.Text <> '') then
  begin
    if Key = VK_RETURN then
    begin
      DM.PetQuery.Edit;
      DM.PetQueryCOD_CLIENTE_PET.Value := DM.extraquery.FieldByName
        ('COD').Value;
      DM.PetQueryNOMECLIENTE.Value := DM.extraquery.FieldByName('RAZAO').Value;
      DM.TRANSACION.CommitRetaining;
      DM.ExtraQuery.SQL.Clear;
    end;
  end
  else
  begin
    DM.PetQuery.Edit;
    DM.PetQueryNOMECLIENTE.Value := '';
    DM.TRANSACION.CommitRetaining;
    DM.ExtraQuery.SQL.Clear;
  end;
end;

procedure TCadastroPetForm.Edit_CodigoCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  teclas_atalhos(Sender, Key, Shift);
end;

procedure TCadastroPetForm.Edit_CodigoCliKeyPress(Sender: TObject;
  var Key: Char);
begin
if Edit_CodigoCli.Text = '' then
begin
  if Key = #13 then
  begin
    BtnLocalizarCliClick(Sender);
  end;
end;
end;

procedure TCadastroPetForm.teclas_atalhos2(Sender: TObject; var Key: Word;
  // CARREGAR CLIENTES E GERAR CODIGO
  Shift: TShiftState);

begin
  DM.AuxQuery4.SQL.text :=
    'select first 1 IDCOLABORADOR ,NOME from COLABORADORES where IDCOLABORADOR like '
    + QuotedStr('%' + Edit_CodigoVet.text + '%');
  DM.AuxQuery4.Open;
  if (DM.AuxQuery4.FieldByName('IDCOLABORADOR').AsString <> '') and
    (Edit_CodigoVet.text <> '') then
  begin
    if Key = VK_RETURN then
    begin
      DM.VetQuery.Edit;
      DM.PetQueryNOMEVETERINARIO.Value := DM.AuxQuery4.FieldByName('NOME').Value;
      DM.PetQueryIDVETERINARIO.Value := DM.AuxQuery4.FieldByName('IDCOLABORADOR').Value;
      DM.TRANSACION.CommitRetaining;
      Perform(Wm_NextDlgCtl, 0, 0);
      DM.AuxQuery4.SQL.Clear;
    end;
  end
  else
  begin
    DM.PetQueryNOMEVETERINARIO.Value := '';
    DM.VetQuery.Edit;
    DM.TRANSACION.CommitRetaining;
    DM.AuxQuery4.SQL.Clear;
  end;
end;

procedure TCadastroPetForm.Timer1Timer(Sender: TObject);
begin

  // sLabel3.Visible := not sLabel3.Visible;
end;

procedure TCadastroPetForm.Edit_CodigoVetChange(Sender: TObject);

begin
  DM.VetQuery.Open;
  DM.TRANSACION.CommitRetaining;
end;

procedure TCadastroPetForm.Edit_CodigoVetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
  teclas_atalhos2(Sender, Key, Shift);
end;

procedure TCadastroPetForm.Edit_CodigoVetKeyPress(Sender: TObject;
  var Key: Char);
begin
if Edit_CodigoVet.Text = '' then
begin
  if Key = #13 then
  begin
   BtnLocalizarVetClick(sender);
  end;

end;
end;

procedure TCadastroPetForm.Edit_NomeChange(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      TEdit(Components[I]).text := '';
end;

procedure TCadastroPetForm.txtnomevet1Change(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEdit then
      TEdit(Components[I]).text := '';
end;

end.
