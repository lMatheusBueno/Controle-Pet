unit CadastroVacinas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, sDBComboBox,
  Data.DB, Vcl.Buttons, sBitBtn, Vcl.ExtCtrls, sPanel, sDBMemo, Vcl.Mask,
  sMaskEdit, sCustomComboEdit, sToolEdit, sDBDateEdit, sDBEdit, sBevel;

type
  TCadastroVacinasForm = class(TForm)
    sBevel6: TsBevel;
    Edit_CodVacinas: TsDBEdit;
    Label14: TLabel;
    Label19: TLabel;
    Edit_Vacina: TsDBEdit;
    DataHoje: TsDBDateEdit;
    Label18: TLabel;
    DataVacina: TsDBDateEdit;
    Label15: TLabel;
    Edit_DiasProx: TsDBEdit;
    MemoObs: TsDBMemo;
    Label16: TLabel;
    Label22: TLabel;
    PanelBtnPet: TsPanel;
    BtnGravar: TsBitBtn;
    BtnCancelar: TsBitBtn;
    BoxStatusVac: TsDBComboBox;
    Ds_Vac: TDataSource;
    Edit_NomeCli: TsDBEdit;
    Edit_CodigoCli: TsDBEdit;
    Edit_NomePet: TsDBEdit;
    Edit_CodigoPet: TsDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sBevel1: TsBevel;
    Edit_TelCli: TsDBEdit;
    Label6: TLabel;
    BtnPesquisaPetVac: TsBitBtn;
    BtnLocalizarCliVac: TsBitBtn;
    Ds_Pet: TDataSource;
    Label5: TLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DataHojeExit(Sender: TObject);
    procedure BtnLocalizarCliVacClick(Sender: TObject);
    procedure BtnPesquisaPetVacClick(Sender: TObject);
    procedure BoxStatusVacExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroVacinasForm: TCadastroVacinasForm;

implementation

{$R *.dfm}

uses Ajuda, Vacinas,CadastroPet,
 DataModulo, Principal, LocalizarCliente, Notificacao, LocalizarPet;



procedure TCadastroVacinasForm.BoxStatusVacExit(Sender: TObject);
begin
  if BoxStatusVac.ItemIndex = 1 then
  begin
   if trunc(DM.VacQueryDATA_VAC.Value) = 0 then
   begin
    DM.VacQueryDATA_VAC.Value := now;
   end;
  end;
end;

procedure TCadastroVacinasForm.BtnCancelarClick(Sender: TObject);
begin
  DM.VacQuery.CancelUpdates;
  Close;
end;

procedure TCadastroVacinasForm.BtnGravarClick(Sender: TObject);
Var
  I: integer;
begin
  if Edit_NomeCli.Text = '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Self);
    NotificacaoForm.sLabel1.Caption := ('Por favor informe o Pet!');
    NotificacaoForm.ShowModal;

  end
  else if Edit_TelCli.Text = '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Self);
    NotificacaoForm.sLabel1.Caption :=
      ('Por favor informe um número para contato do Cliente');
    NotificacaoForm.ShowModal;

  end
  else if Edit_Vacina.Text = '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Self);
    NotificacaoForm.sLabel1.Caption := ('Por favor informe o nome da Vacina!');
    NotificacaoForm.ShowModal;

  end
  else if Edit_DiasProx.Text = '' then
  begin
    NotificacaoForm := TNotificacaoForm.Create(Self);
    NotificacaoForm.sLabel1.Caption := ('Por favor informe a data da Vacina!');
    NotificacaoForm.ShowModal;

  end
  else if (Edit_TelCli.Text <> '') and (Edit_NomeCli.Text <> '') and  (Edit_DiasProx.Text <> '')then
  begin

    if DM.VacQuery.State = dsInsert then
    begin
      if DM.VacQueryCOD_VAC.Value = '' then
      begin
        DM.AuxQuery3.Close;
        DM.AuxQuery3.SQL.Clear;
        DM.AuxQuery3.SQL.Add('select MAX(cast(ID_VAC as integer)) as numero from petsvac');
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
          DM.Transaction.CommitRetaining;
        end;

      end;

    end;

  end;

  if (Edit_TelCli.Text <> '') and (Edit_NomeCli.Text <> '') and
    (Edit_DiasProx.Text <> '') and (Edit_Vacina.Text <> '') then
  begin
    DM.VacQuery.Post;
    DM.Transaction.CommitRetaining;
    Close;
  end;
end;

procedure TCadastroVacinasForm.BtnLocalizarCliVacClick(Sender: TObject);
begin
  FomrLocalizarCliente := TFomrLocalizarCliente.Create(nil);
  FomrLocalizarCliente.ShowModal;
  FomrLocalizarCliente.Free;
end;

procedure TCadastroVacinasForm.BtnPesquisaPetVacClick(Sender: TObject);
begin
  LocalizarPetForm := TLocalizarPetForm.Create(Nil);
  LocalizarPetForm.ShowModal;
  LocalizarPetForm.Free;
end;

procedure TCadastroVacinasForm.DataHojeExit(Sender: TObject);

var
  resultado, resultado2: string;
  Data: integer;

begin
  resultado := FloatToStr(CadastroPetForm.DataVac(DateToStr(now)));
  resultado2 := FloatToStr(CadastroPetForm.DataVac(DataHoje.Text));
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
    DM.VacQuerySTATUS_VAC.Value := BoxStatusVac.Text;
  End
  else if Data < 0 then
  Begin
    BoxStatusVac.ItemIndex := 2;
    DM.VacQuerySTATUS_VAC.Value := BoxStatusVac.Text;
  End;
end;

end.
