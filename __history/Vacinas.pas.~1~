unit Vacinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, sLabel,
  Vcl.ExtCtrls, sPanel, Vcl.Buttons, sBitBtn, sEdit, sComboBox, sGroupBox,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, Data.DB, sButton, sdialogs,
  sDBNavigator, sCheckBox, sRadioButton;

type
  TVacinasForm = class(TForm)
    GridVacinas: TDBAdvGrid;
    DsVacinas: TDataSource;
    sPanel1: TsPanel;
    sDBNavigator1: TsDBNavigator;
    sButton1: TsButton;
    sButton3: TsButton;
    sPanel6: TsPanel;
    sPanel2: TsPanel;
    sLabel3: TsLabel;
    Lb_Contador: TsLabel;
    sGroupBox1: TsGroupBox;
    Check_FiltroPendente: TsRadioButton;
    Check_FiltroConcluido: TsRadioButton;
    Check_FiltroTodos: TsRadioButton;
    sGroupBox3: TsGroupBox;
    Check_FiltroAtraso: TsRadioButton;
    sGroupBox2: TsGroupBox;
    Box_FiltroVac: TsComboBox;
    Edit_LocalizaVac: TsEdit;
    sBitBtn1: TsBitBtn;
    Check_FiltroPendenteAtraso: TsRadioButton;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel4: TsLabel;
    Btn_Editar: TsBitBtn;
    Btn_ImpVacinas: TsBitBtn;
    procedure GridVacinasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridVacinasGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormCreate(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure GridVacinasCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
    procedure sBitBtn1Click(Sender: TObject);
    procedure Edit_LocalizaVacChange(Sender: TObject);
    procedure CarregarDiasVacina();
    function DataVac(DataVacina: String): Integer;
    procedure Btn_EditarClick(Sender: TObject);
    procedure GridVacinasDblClick(Sender: TObject);
    procedure Btn_ImpVacinasClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VacinasForm: TVacinasForm;

implementation

{$R *.dfm}

uses DataModulo, CadastroPet, Principal, Notificacao, CadastroVacinas;

procedure TVacinasForm.Btn_EditarClick(Sender: TObject);
begin
  if DM.VacQuery.RecordCount <> 0 then
  begin
    DM.VacQuery.Edit;
    CadastroVacinasForm := TCadastroVacinasForm.Create(nil);
    CadastroVacinasForm.ShowModal;
    CadastroVacinasForm.Free;
  end;
end;

procedure TVacinasForm.Btn_ImpVacinasClick(Sender: TObject);
begin
     if DM.VacQuery.RecordCount <> 0 then
  begin
    PrincipalForm.frxVacinas.PrepareReport();
     PrincipalForm.frxVacinas.ShowReport();
  end
  else
  begin
    sMessageDlg('Atenção', 'Receituario está em branco', mtInformation,[mbOK], 0);
  end;
end;

procedure TVacinasForm.CarregarDiasVacina;

var
  resultado, resultado2: string;
  Data, codigo: Integer;
  DataProx: TDate;
  Status : string;

begin

  //DataProx :=StrToDate((StringReplace(GridVacinas.Columns.Items[4].Field.Text, '/', '.',[rfReplaceAll, rfIgnoreCase]))); {**Altera de barra[/] para ponto[.]**}
  //DataProx := StrToDate(((GridVacinas.Columns.Items[8].Field.Text))); {Parametro por numero do item da coluna}

  DataProx := StrToDate((( GridVacinas.ColumnByName['PROX_DATA_VAC'].Field.Text))); {Parametro por nome que esta no header da grid}
  Status := GridVacinas.ColumnByName['STATUS_VAC'].Field.Text;
  codigo := Trunc(DataProx);
  resultado := FloatToStr(DataVac(DateToStr(now)));
  resultado2 := FloatToStr((codigo));

  Data := StrToInt(resultado2) - StrToInt(resultado);
  if ((resultado <> '') and (resultado2 <> '')) then
  begin
    begin
      DM.VacQuery.Open;
      DM.VacQuery.Edit;
      DM.VacQueryDIAS_VACINA.Value := inttostr(StrToInt(resultado2) - StrToInt(resultado));
      if (strtoint(DM.VacQueryDIAS_VACINA.Value) < 0) and (Status <> 'Concluido')   then
      begin
        DM.VacQuerySTATUS_VAC.Value := 'em Atraso';
      end;
      DM.VacQuery.Post;
    end;
  end;

  // if Data >= 0 then
  // Begin
  // BoxStatusVac.ItemIndex := 0;
  // DM.VacQuerySTATUS_VAC.Value := BoxStatusVac.text;
  // End
  // else if Data < 0 then
  // Begin
  // BoxStatusVac.ItemIndex := 2;
  // DM.VacQuerySTATUS_VAC.Value := BoxStatusVac.text;
  // BoxStatusVac.Font.Color := clRed;
  // End;
  { Pendente |Concluido| em Atraso }

end;

function TVacinasForm.DataVac(DataVacina: String): Integer;

begin
  try
    StrToDate(DataVacina); // -- Verifica se a data é valida

  except
    messagedlg('Data de Vacinação inválida!', MTERROR, [MBOK], 0);
    abort;
  end;
  result := Trunc((StrToDate(DataVacina)));
end;

procedure TVacinasForm.Edit_LocalizaVacChange(Sender: TObject);
begin
  DM.VacQuery.SQL.Clear;
  case Box_FiltroVac.ItemIndex of
    0:
      DM.VacQuery.SQL.Add
        ('select *from PETSVAC where UPPER (NOME_PET_VAC) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
    1:
      DM.VacQuery.SQL.Add('select *from PETSVAC where UPPER (ID_PET_VAC) like '
        + QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
    2:
      DM.VacQuery.SQL.Add
        ('select *from PETSVAC where UPPER (NOME_CLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
    3:
      DM.VacQuery.SQL.Add('select *from PETSVAC where UPPER (ID_CLIENTE) like '
        + QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
  end;
  DM.VacQuery.Open;
  Lb_Contador.Caption := inttostr(DM.VacQuery.RecordCount);
end;

procedure TVacinasForm.FormCreate(Sender: TObject);
Var
  resultado, resultado2: string;
  I, contador, contador2: Integer;
begin
  DM.VacQuery.Close;
  DM.VacQuery.Open;
  DM.VacQuery.SQL.Clear;
  case Box_FiltroVac.ItemIndex of
    0:
      DM.VacQuery.SQL.Add
        ('select *from PETSVAC where UPPER (NOME_PET_VAC) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
    1:
      DM.VacQuery.SQL.Add('select *from PETSVAC where (COD_PET_VAC) = ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
    2:
      DM.VacQuery.SQL.Add
        ('select *from PETSVAC where UPPER (NOME_CLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
    3:
      DM.VacQuery.SQL.Add('select *from PETSVAC where (ID_CLIENTE) = ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%'));
  end;
  DM.VacQuery.Open;

  if DM.VacQuery.RecordCount = 0 then
  begin
    sMessageDlg('Atenção', 'Nenhum registro encontrado de "' +
      Edit_LocalizaVac.Text + ' "', mtInformation, [MBOK], 0);
  end;
  Lb_Contador.Caption := inttostr(DM.VacQuery.RecordCount);
  resultado := FloatToStr(CadastroPetForm.DataVac(DateToStr(now)));
  resultado2 := FloatToStr(CadastroPetForm.DataVac
    (DateToStr(DM.VacQueryPROX_DATA_VAC.Value)));

  contador := 0;
  contador2 := 0;
  {CALCULAR DIAS PARA A VACINA}
  for I := 1 to DM.VacQuery.RecordCount do
  begin
    CarregarDiasVacina;
    if (StrToInt(DM.VacQueryDIAS_VACINA.Value) >= 0) and
      (DM.VacQuerySTATUS_VAC.Text <> 'Concluido') then
    begin
      contador := contador + 1;
    end;
    if (StrToInt(DM.VacQueryDIAS_VACINA.Value) < 0) and
      (DM.VacQuerySTATUS_VAC.Text <> 'Concluido') then
    begin
      contador2 := contador2 + 1;
    end;
    DM.VacQuery.Next;
  end;
  NotificacaoForm := TNotificacaoForm.Create(Self);
  if (contador > 0) and (contador2 > 0) then
  begin
    NotificacaoForm.sLabel1.Caption :=
      (('EXISTEM ' + inttostr(contador) + ' VACINAS PENDENTES!') + #13 +
      'EXISTEM ' + inttostr(contador2) + ' VACINAS EM ATRASO!');
    NotificacaoForm.Showmodal;
  end
  else if (contador > 0) and (contador2 = 0) then
  begin
    NotificacaoForm.sLabel1.Caption :=
      ('EXISTEM ' + inttostr(contador) + ' VACINAS PENDENTES!');
    NotificacaoForm.Showmodal;
  end
  else if (contador = 0) and (contador2 > 0) then
  begin
    NotificacaoForm.sLabel1.Caption :=
      ('EXISTEM ' + inttostr(contador2) + ' VACINAS EM ATRASO!');
    NotificacaoForm.Showmodal;
  end;
  // DM.VacQuery.Close;
end;

procedure TVacinasForm.GridVacinasCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);

var
  fldname, filtro: string;
  filtro_atraso, filtro_pendente, filtro_concluido, filtros: string;

begin

  DM.VacQuery.SQL.Clear;
  if Check_FiltroTodos.Checked <> True then
  begin
    if (Check_FiltroAtraso.Checked = True) then
    begin
      filtro_atraso := (' AND STATUS_VAC =' + QuotedStr('em Atraso'));
    end;
    if (Check_FiltroPendenteAtraso.Checked = True) then
    begin
      filtro_pendente := (' or STATUS_VAC =' + QuotedStr('Pendente'));
      filtro_atraso := (' and STATUS_VAC =' + QuotedStr('em Atraso'));
    end;
    if Check_FiltroPendente.Checked = True then
    begin
      filtro_pendente := (' and STATUS_VAC =' + QuotedStr('Pendente'));
    end;
    if (Check_FiltroConcluido.Checked = True) then
    begin
      filtro_concluido := (' and STATUS_VAC =' + QuotedStr('Concluido'))
    end;

  end;

  fldname := GridVacinas.Columns[ACol].FieldName;

  // Colocar todos os filtros do combobox de pesquisa aqui em baixo

  if Box_FiltroVac.Text = 'Nome Pet' then
    filtro := ' and NOME_PET_VAC like' +
      QuotedStr('%' + Edit_LocalizaVac.Text + '%');

  DM.VacQuery.SQL.Text :=
    ('select * from PETSVAC where NOME_PET_VAC = NOME_PET_VAC' + filtro +
    ' order by ' + fldname);
  // DM.PetQuery.SQL.Text := ('select * from PETS  order by ' + fldname);

  if GridVacinas.SortSettings.Direction = sdAscending then
    DM.VacQuery.SQL.Add('desc');

  // DM.PetQuery.ParamByName('pempresa').AsString := '1'; // COLOCAR EMPRESA AQUI;

  DM.VacQuery.Active := True;
  GridVacinas.SortSettings.Column := ACol;
end;

procedure TVacinasForm.GridVacinasDblClick(Sender: TObject);
begin
Btn_EditarClick(sender);
end;

procedure TVacinasForm.GridVacinasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if DM.VacQuerySTATUS_VAC.AsString = 'em Atraso' then
    GridVacinas.SelectionTextColor := clNone;
end;

procedure TVacinasForm.GridVacinasGetCellColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if ARow > 0 then
  begin
    if GridVacinas.Cells[GridVacinas.ColumnByHeader('Status'), ARow] = 'em Atraso'
    then
    begin
      AFont.Color := clRed;
    end
    else if GridVacinas.Cells[GridVacinas.ColumnByHeader('Status'), ARow] = 'Concluido'
    then
    begin
      AFont.Color := clGreen;
    end;
  end;

end;

procedure TVacinasForm.sBitBtn1Click(Sender: TObject);
var
  filtro_atraso, filtro_pendente, filtro_concluido, filtros: string;
begin
  DM.VacQuery.SQL.Clear;
  if Check_FiltroTodos.Checked <> True then
  begin
    if (Check_FiltroAtraso.Checked = True) then
    begin
      filtro_atraso := (' AND STATUS_VAC =' + QuotedStr('em Atraso'));
    end;
    if (Check_FiltroPendenteAtraso.Checked = True) then
    begin
      filtro_pendente := (' or STATUS_VAC =' + QuotedStr('Pendente'));
      filtro_atraso := (' and STATUS_VAC =' + QuotedStr('em Atraso'));
    end;
    if Check_FiltroPendente.Checked = True then
    begin
      filtro_pendente := (' and STATUS_VAC =' + QuotedStr('Pendente'));
    end;
    if (Check_FiltroConcluido.Checked = True) then
    begin
      filtro_concluido := (' and STATUS_VAC =' + QuotedStr('Concluido'))
    end;

  end;


  // if Check_FiltroConcluido.Checked = true then
  // begin
  // filtro_concluido := (' AND STATUS_VAC =' + QuotedStr('Concluido'));
  // end;

  case Box_FiltroVac.ItemIndex of
    0:
      DM.VacQuery.SQL.Add
        ('select *from PETSVAC where UPPER (NOME_PET_VAC) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%') + filtro_atraso
        + filtro_pendente + filtro_concluido);
    1:
      DM.VacQuery.SQL.Add('select *from PETSVAC where UPPER (ID_PET_VAC) like '
        + QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%') +
        filtro_atraso + filtro_pendente + filtro_concluido);
    2:
      DM.VacQuery.SQL.Add
        ('select *from PETSVAC where UPPER (NOME_CLIENTE) like ' +
        QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%') + filtro_atraso
        + filtro_pendente + filtro_concluido);
    3:
      DM.VacQuery.SQL.Add('select *from PETSVAC where UPPER (ID_CLIENTE) like '
        + QuotedStr('%' + UPPERCASE(Edit_LocalizaVac.Text) + '%') +
        filtro_atraso + filtro_pendente + filtro_concluido);
  end;

  DM.VacQuery.Open;
  Lb_Contador.Caption := inttostr(DM.VacQuery.RecordCount);
end;

procedure TVacinasForm.sButton1Click(Sender: TObject);
begin
  begin
    DM.VacQuery.Close;
    DM.VacQuery.Open;
    DM.VacQuery.Append;
    CadastroVacinasForm := TCadastroVacinasForm.Create(nil);
    // BoxStatusVac.ItemIndex := 1;
    { BOTOES }
    CadastroVacinasForm.ShowModal;
    CadastroVacinasForm.Free;
  end;
end;

procedure TVacinasForm.sButton2Click(Sender: TObject);
var
  dias: Integer;

begin
  dias := StrToInt(DM.VacQueryDIAS_VACINA.Value);
  if DM.VacQuery.RecordCount <> 0 then
  begin
    if sMessageDlg('Atenção', 'Deseja Estornar a Vacina?', mtWarning,
      [mbYes, mbNo], 0) = mrYes then
    begin
      DM.VacQuery.Edit;
      if dias > 0 then
      begin
        DM.VacQuerySTATUS_VAC.Value := 'Pendente';
      end
      else
      begin
        DM.VacQuerySTATUS_VAC.Value := 'em Atraso';
      end;
      DM.VacQuery.Post;
      DM.VacQuery.Close;
      DM.VacQuery.Open;
    end;
  end;
end;

procedure TVacinasForm.sButton3Click(Sender: TObject);
begin
  if DM.VacQuery.RecordCount <> 0 then
  Begin
    if sMessageDlg('Atenção', 'Deseja excluir o registro?', mtWarning,
      [mbYes, mbNo], 0) = mrYes then
    begin
      DM.VacQuery.Delete;
    end;
  End;
end;

end.
