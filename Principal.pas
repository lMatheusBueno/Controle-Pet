unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, System.ImageList, Vcl.ImgList,
  acAlphaImageList, sSkinProvider, sSkinManager, Vcl.StdCtrls, Vcl.Buttons,
  sBitBtn, sPanel, sDBNavigator, Vcl.ExtCtrls, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, Vcl.Mask, Vcl.DBCtrls, sDBEdit, sComboBox, sButton,
  inifiles,
  Data.DB, sEdit, sDBComboBox, frxClass, Sdialogs, frxDBSet,
  frxExportBaseDialog,
  frxExportPDF, sLabel, AdvLabel, DBAdvLabel, Vcl.ToolWin, Vcl.ComCtrls,
  sToolBar, sGroupBox, sBevel, sStatusBar, sCheckBox, sDBCheckBox, Vcl.Menus,
  AdvMenus, sSpeedButton, sDBMemo;

type
  TPrincipalForm = class(TForm)
    Panel1: TPanel;
    BtCadastrar: TsBitBtn;
    sSkinProvider1: TsSkinProvider;
    sAlphaImageList1: TsAlphaImageList;
    BtAlterar: TsBitBtn;
    BtExcluir: TsBitBtn;
    sAlphaImageList2: TsAlphaImageList;
    DSpetquery: TDataSource;
    DSextra: TDataSource;
    frxDBConfig: TfrxDBDataset;
    sAlphaImageList3: TsAlphaImageList;
    sDBNavigator1: TsDBNavigator;
    FrxReceituario: TfrxReport;
    FrxPet: TfrxDBDataset;
    Ds_Vac: TDataSource;
    BtnVacina: TsBitBtn;
    sStatusBar1: TsStatusBar;
    sPanel2: TsPanel;
    LblData: TsLabel;
    Timer1: TTimer;
    Outros: TAdvPopupMenu;
    sSpeedButton1: TsSpeedButton;
    G1: TMenuItem;
    Panel2: TPanel;
    sBevel1: TsBevel;
    sPanel1: TsPanel;
    sLabel2: TsLabel;
    contadorpet: TsLabel;
    Imagem2: TDBImage;
    sGroupBox1: TsGroupBox;
    Label1: TLabel;
    Edit_LocalizarCli: TsEdit;
    txtPesquisar: TsBitBtn;
    cbFiltro: TsComboBox;
    Filtro_Check: TsCheckBox;
    GridPets: TDBAdvGrid;
    Principal_Panel: TsPanel;
    ExibirVacinas_Check: TsCheckBox;
    sPanel3: TsPanel;
    sLabel3: TsLabel;
    ExibirReceituario_Check: TsCheckBox;
    Memo_Receituario: TsDBMemo;
    Grid_Vacinas: TDBAdvGrid;
    sSkinManager1: TsSkinManager;
    Btn_Receituario: TsBitBtn;
    FrxReceituariox: TfrxReport;
    FrxHist: TfrxDBDataset;
    Ds_Hist: TDataSource;
    R1: TMenuItem;
    frxVacinas: TfrxReport;
    FrxDBVacinas: TfrxDBDataset;
    procedure BtCadastrarClick(Sender: TObject);
    procedure GridPetsDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure sEdit1Change(Sender: TObject);
    procedure txtPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure BtImprimirClick(Sender: TObject);
    procedure GridPetsColumnSize(Sender: TObject; ACol: Integer;
      var Allow: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BtAgendaClick(Sender: TObject);
    procedure txtPesquisarClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure BtnReceituarioClick(Sender: TObject);
    procedure GridPetsCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure BtnVacinaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GridPetsClick(Sender: TObject);
    procedure GridPetsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridPetsGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure N1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure Btn_OutrosClick(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ExibirVacinas_CheckClick(Sender: TObject);
    procedure ListarVacina();
    procedure Grid_VacinasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Grid_VacinasGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure ExibirReceituario_CheckClick(Sender: TObject);
    procedure Btn_ReceituarioClick(Sender: TObject);
    procedure R1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  PrincipalForm: TPrincipalForm;

implementation

{$R *.dfm}

uses DataModulo, CadastroPet, Vacinas,
  Ajuda, HitoricoPet, Notificacao, CadastroVacinas, CadastroReceituario,
  Agendas, RelatorioVac;

procedure TPrincipalForm.G1Click(Sender: TObject);
begin
  FormHistorico := TFormHistorico.Create(Nil);
  FormHistorico.ShowModal;
  FormHistorico.Free;
end;

procedure TPrincipalForm.GridPetsCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);

var
  fldname, filtro, filtro_situacao: string;
begin

  if Filtro_Check.Checked = true then
  begin
    filtro_situacao := ' and SITUACAOPET =' + QuotedStr('Inativo');
  end
  else
  begin
    filtro_situacao := ' and SITUACAOPET =' + QuotedStr('Ativo');
  end;

  fldname := GridPets.Columns[ACol].FieldName;

  if cbFiltro.Text = 'Nome Pet' then
  filtro := ' and NOMEPET like' +  QuotedStr('%' + Edit_LocalizarCli.Text + '%');
  DM.PetQuery.SQL.Text := ('select * from PETS where NOMEPET = NOMEPET' + filtro_situacao + filtro + ' order by ' + fldname);

  if GridPets.SortSettings.Direction = sdAscending then
  DM.PetQuery.SQL.Add('desc');
  DM.PetQuery.Active := true;
  GridPets.SortSettings.Column := ACol;
end;

procedure TPrincipalForm.GridPetsClick(Sender: TObject);
begin
  if ExibirVacinas_Check.Checked = true then
  begin
    if (DM.PetQuery.RecordCount <> 0) then
    begin
      ListarVacina;
    end;
  end;
end;

procedure TPrincipalForm.GridPetsColumnSize(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
var
  diretorio: string;
  inifile: tinifile;
begin
  diretorio := ExtractFilePath(Application.ExeName);
  inifile := tinifile.Create(diretorio + '\tabela.ini');
  inifile.WriteString('PETS', 'SETTINGS', GridPets.ColumnStatesToString);
  inifile.Free;
end;

procedure TPrincipalForm.GridPetsDblClickCell(Sender: TObject;
  ARow, ACol: Integer);

begin
  if DM.PetQuery.RecordCount <> 0 then
  begin
    DM.PetQuery.Edit;
    CadastroPetForm := TCadastroPetForm.Create(nil);
    CadastroPetForm.ShowModal;
    CadastroPetForm.Free;
  end;
end;

procedure TPrincipalForm.GridPetsDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

begin
  if DM.PetQuerySITUACAOPET.AsString = 'Inativo' then
    GridPets.SelectionTextColor := clNone;
end;

procedure TPrincipalForm.GridPetsGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin

  if ARow > 0 then
  begin
    if GridPets.Cells[GridPets.ColumnByHeader('Status'), ARow] = 'Inativo' then
    begin
      AFont.Color := clSilver;
    end
  end;

end;

procedure TPrincipalForm.Grid_VacinasDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if DM.VacQuerySTATUS_VAC.AsString = 'em Atraso' then
    Grid_Vacinas.SelectionTextColor := clNone;
end;

procedure TPrincipalForm.Grid_VacinasGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if ARow > 0 then
  begin
    if Grid_Vacinas.Cells[Grid_Vacinas.ColumnByHeader('Status'), ARow] = 'em Atraso'
    then
    begin
      AFont.Color := clRed;
    end
    else if Grid_Vacinas.Cells[Grid_Vacinas.ColumnByHeader('Status'), ARow] = 'Concluido'
    then
    begin
      AFont.Color := clGreen;
    end;
  end;
end;

procedure TPrincipalForm.I1Click(Sender: TObject);
begin
  if DM.PetQueryRECEITUARIO.Value <> '' then
  begin
    FrxReceituario.PrepareReport();
    FrxReceituario.ShowReport();
  end
  else
  begin
    sMessageDlg('Atenção', 'Receituario está em branco', mtInformation,
      [mbOK], 0);
  end;
end;

procedure TPrincipalForm.ListarVacina;
var
  codigo: string;
begin
  codigo := GridPets.ColumnByName['PETCOD'].Field.Text;
  begin
    DM.AuxQuery1.Close;
    DM.AuxQuery1.Open;
    DM.AuxQuery1.SQL.Clear;
    DM.AuxQuery1.SQL.Add
      ('SELECT NOME_VAC, PROX_DATA_VAC,  DIAS_VACINA, TEL_CLIENTE, STATUS_VAC, DATA_VAC FROM PETSVAC  where (COD_PET_VAC) = '
      + codigo + ' and status_vac <>' + QuotedStr('Concluido'));
    DM.AuxQuery1.Open;
  end;
end;

procedure TPrincipalForm.N1Click(Sender: TObject);
begin
  if DM.PetQuery.RecordCount <> 0 then
  begin
    NotificacaoForm := TNotificacaoForm.Create(self);
    NotificacaoForm.Btn_Enter.Visible := false;
    NotificacaoForm.Btn_Sim.Visible := true;
    NotificacaoForm.Btn_Nao.Visible := true;
    NotificacaoForm.sLabel1.Caption :=
      'Deseja Realizar o Cadastro de um novo Receituário?';
    NotificacaoForm.Show;
  end;
end;

procedure TPrincipalForm.R1Click(Sender: TObject);
begin
  RelatorioVacForm := TRelatorioVacForm.Create(nil);
  RelatorioVacForm.ShowModal;
  RelatorioVacForm.Free;
end;

procedure TPrincipalForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.PetQuery.Close;
end;

procedure TPrincipalForm.FormCreate(Sender: TObject);
var
  s, diretorio: string;
  inifile: tinifile;
  advs1, advs2: TAdvStringGrid;
begin
  DM.ConfigQuery.Close;
  DM.ConfigQuery.Open;
  Imagem2.Picture := nil;
  LblData.Caption := FormatDateTime('dddd, dd " de " mmmmm " de " yyyy' +
    ' hh:mm:ss', Now);
  diretorio := 'C:\Banco de Dados Pet\';
  // ExtractFilePath(Application.ExeName);
  DM.DATABASE.Close;
  DM.DATABASE.DatabaseName := (diretorio + 'DADOS5.FDB');
  DM.DATABASE.Open;
  inifile := tinifile.Create(diretorio + '\tabela.ini');
  s := inifile.ReadString('PETS', 'SETTINGS', GridPets.ColumnStatesToString);

  advs1 := TAdvStringGrid.Create(self);
  advs1.StringToColumnStates(GridPets.ColumnStatesToString);
  advs1.UnHideColumnsAll;

  advs2 := TAdvStringGrid.Create(self);
  advs2.StringToColumnStates(s);
  advs2.UnHideColumnsAll;

  if advs1.ColCount = advs2.ColCount then
    GridPets.StringToColumnStates(s);
  advs1.Destroy;
  advs2.Destroy;
end;

procedure TPrincipalForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
  begin
    AjudaForm := TAjudaForm.Create(nil);
    AjudaForm.ShowModal;
    AjudaForm.Free;
  end;
end;

procedure TPrincipalForm.BtCadastrarClick(Sender: TObject);

begin
  begin
    DM.PetQuery.Close;
    DM.VetQuery.Close;
    DM.PetHistQuery.Close;
  end;

  begin
    DM.PetQuery.Open;
    DM.VetQuery.Open;
    DM.PetHistQuery.Open;
  end;
  begin
    DM.Transaction.CommitRetaining;
    DM.VetQuery.Append;
    DM.PetQuery.Append;
    DM.PetHistQuery.Insert;
  end;

  DM.PetQueryDATACADPET.Value := Now;
  DM.PetQuerySITUACAOPET.Value := 'Ativo';

  CadastroPetForm := TCadastroPetForm.Create(nil);
  CadastroPetForm.BoxSituacao.ItemIndex := 0;
  CadastroPetForm.ShowModal;
  CadastroPetForm.Free;
end;

procedure TPrincipalForm.BtAlterarClick(Sender: TObject);

begin
  begin
    if DM.PetQuery.RecordCount <> 0 then
    begin
      DM.PetQuery.Edit;
      DM.PetQueryPETCOD.ReadOnly := true;
      DM.VetQuery.Open;
      CadastroPetForm := TCadastroPetForm.Create(nil);
      CadastroPetForm.ShowModal;
      CadastroPetForm.Free;
    end;
  end;

end;

procedure TPrincipalForm.BtExcluirClick(Sender: TObject);
begin
  if DM.PetQuery.RecordCount > 0 then
  begin
    if sMessageDlg('Excluir?', 'Deseja Excluir o Registro', mtWarning,
      [mbYes, mbNo], 1) = mryes then
    begin
      if DM.PetQuery.RecordCount <> 0 then
      begin
        DM.PetQuery.delete;
      end;
    end;
  end;

end;

procedure TPrincipalForm.BtImprimirClick(Sender: TObject);
begin
  if DM.PetQueryRECEITUARIO.Value <> '' then
  begin
    FrxReceituario.PrepareReport();
    FrxReceituario.ShowReport();
  end
  else
  begin
    sMessageDlg('Atenção', 'Receituario está em branco', mtInformation,
      [mbOK], 0);
  end;
end;

procedure TPrincipalForm.A1Click(Sender: TObject);
begin
  sMessageDlg('Atenção', 'Essa parte do sistema ainda não está pronta',
    mtWarning, [mbOK], 1);
  AgendasForm := TAgendasForm.Create(nil);
  AgendasForm.ShowModal;
  AgendasForm.Free;
end;

procedure TPrincipalForm.BtAgendaClick(Sender: TObject);
begin
  sMessageDlg('Atenção', 'Essa parte do sistema ainda não está pronta',
    mtWarning, [mbOK], 1);
  AgendasForm := TAgendasForm.Create(nil);
  AgendasForm.ShowModal;
  AgendasForm.Free;

end;

procedure TPrincipalForm.BtnReceituarioClick(Sender: TObject);
begin
  if DM.PetQuery.RecordCount <> 0 then
  begin
    DM.PetQuery.Open;
    DM.VetQuery.Open;
    DM.PetQuery.Edit;
    DM.VetQuery.Insert;
    DM.PetQueryRECEITUARIO.Clear;
    CadastroPetForm := TCadastroPetForm.Create(nil);
    CadastroPetForm.PagePet.ActivePageIndex := 1;
    CadastroPetForm.ShowModal;
    CadastroPetForm.Free;
  end;
end;

procedure TPrincipalForm.BtnVacinaClick(Sender: TObject);

begin
  DM.PetQuery.Open;
  DM.VetQuery.Open;
  VacinasForm := TVacinasForm.Create(nil);
  VacinasForm.ShowModal;
  VacinasForm.Free
end;

procedure TPrincipalForm.Btn_OutrosClick(Sender: TObject);
begin
  Outros.ShowNotes
end;

procedure TPrincipalForm.Btn_ReceituarioClick(Sender: TObject);
begin
  DM.PetQuery.Open;
  NotificacaoForm := TNotificacaoForm.Create(self);
  NotificacaoForm.Btn_Enter.Visible := false;
  NotificacaoForm.Btn_Sim.Visible := true;
  NotificacaoForm.Btn_Nao.Visible := true;
  NotificacaoForm.sLabel1.Caption := 'Deseja Realizar o Cadastro de um novo Receituário?';
  NotificacaoForm.Show;
end;

procedure TPrincipalForm.sButton1Click(Sender: TObject);
begin
  if sMessageDlg('Atenção',
    'Deseja fechar a tela "PET" e abrir o sistema de "PRODUTOS" ?', mtWarning,
    [mbYes, mbNo], 0) = mryes then
  begin
    WinExec('C:\Users\Matheus Bueno\Desktop\SISTEMA TESTE MATHEUS\Win32\Debug\Baixa_Produtos.exe',
      SW_SHOWNORMAL);
    Application.Terminate;
  end;
end;

procedure TPrincipalForm.ExibirReceituario_CheckClick(Sender: TObject);
begin
  if (ExibirReceituario_Check.Checked = true) then
  begin
    ExibirVacinas_Check.Checked := false;
    Principal_Panel.Visible := true;
    Memo_Receituario.Visible := not Memo_Receituario.Visible;
    sLabel3.Caption := 'Receitúario';
  end
  else
  begin
    Principal_Panel.Visible := false;
    Memo_Receituario.Visible := not Memo_Receituario.Visible;
  end;
end;

procedure TPrincipalForm.ExibirVacinas_CheckClick(Sender: TObject);
begin
  if (ExibirVacinas_Check.Checked = true) then
  begin
    ExibirReceituario_Check.Checked := false;
    Principal_Panel.Visible := true;
    Grid_Vacinas.Visible := not Grid_Vacinas.Visible;
    sLabel3.Caption := 'Vacinas Pendentes';
  end
  else
  begin
    Principal_Panel.Visible := false;
    Grid_Vacinas.Visible := not Grid_Vacinas.Visible;
  end;
end;

procedure TPrincipalForm.sEdit1Change(Sender: TObject);
var
  filtro_situacao: string;
begin
  if Filtro_Check.Checked = true then
  begin
    filtro_situacao := ' and SITUACAOPET =' + QuotedStr('Inativo');
  end
  else
  begin
    filtro_situacao := ' and SITUACAOPET =' + QuotedStr('Ativo');
  end;

  DM.PetQuery.SQL.Clear;
  case cbFiltro.ItemIndex of
    0:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (NOMEPET) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);

    1:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (PETCOD) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);

    2:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (NOMECLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);

    3:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (IDCLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);
  end;

  DM.PetQuery.Open;
  contadorpet.Caption := DM.PetQuery.RecordCount.ToString;
end;

procedure TPrincipalForm.Timer1Timer(Sender: TObject);
begin
  LblData.Caption := FormatDateTime('dddd, dd " de " mmmmm " de " yyyy' +
    ' hh:mm:ss', Now);
end;

procedure TPrincipalForm.txtPesquisarClick(Sender: TObject);
var
  filtro_situacao: string;
begin
  if Filtro_Check.Checked = true then
  begin
    filtro_situacao := ' and SITUACAOPET =' + QuotedStr('Inativo');
  end
  else
  begin
    filtro_situacao := ' and SITUACAOPET =' + QuotedStr('Ativo');
  end;

  DM.PetQuery.SQL.Clear;
  case cbFiltro.ItemIndex of
    0:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (NOMEPET) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);

    1:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (PETCOD) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);

    2:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (NOMECLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);

    3:
      DM.PetQuery.SQL.Add('select *from PETS where UPPER (IDCLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizarCli.Text) + '%') +
        filtro_situacao);
  end;

  DM.PetQuery.Open;
  contadorpet.Caption := DM.PetQuery.RecordCount.ToString;

end;

procedure TPrincipalForm.txtPesquisarKeyPress(Sender: TObject; var Key: Char);

begin

  If Key = #13 then

  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;

end;

end.
