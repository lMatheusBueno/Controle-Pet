unit Notificacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  sBitBtn, sPanel, acPNG, acImage, sLabel, sBevel, Data.DB, frxClass, frxDBSet;

type
  TNotificacaoForm = class(TForm)
    PanelBtnPet: TsPanel;
    Btn_Enter: TsBitBtn;
    Timer1: TTimer;
    ImgAntecao: TsBevel;
    ImgAtencao: TsImage;
    sBevel1: TsBevel;
    sLabel1: TsLabel;
    Btn_Sim: TsBitBtn;
    Btn_Nao: TsBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure Btn_EnterClick(Sender: TObject);
    procedure Btn_SimClick(Sender: TObject);
    procedure Btn_NaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotificacaoForm: TNotificacaoForm;
  clickbt: BOOL;

implementation

{$R *.dfm}

uses CadastroPet, DataModulo, LocalizarPet, HitoricoPet, Principal,
  LocalizarCliente,
  LocalizarVeterinario, CadastroVacinas, CadastroReceituario, Agendas;

procedure TNotificacaoForm.Btn_EnterClick(Sender: TObject);
begin
  close;
end;

procedure TNotificacaoForm.Btn_NaoClick(Sender: TObject);
begin
  if NotificacaoForm.sLabel1.Caption = 'Houve alterações no Cadastro do Pet' +
    #13 + ' Deseja sair sem Gravar? ' then
  begin
    NotificacaoForm.close;
  end
  else if NotificacaoForm.sLabel1.Caption =
    ('Deseja Realizar o Cadastro de um novo Receituário?') then
  begin
    NotificacaoForm.close;
  end
  else if NotificacaoForm.sLabel1.Caption = 'Deseja Realizer o Cadastro de Vacina para o Pet?'
  then
  begin
    NotificacaoForm.close;
    CadastroPetForm.close;
  end
  else if NotificacaoForm.sLabel1.Caption = ('Deseja Imprimir o Receituario?') then
  begin
    NotificacaoForm.close;
    CadastroReceituarioForm.close;
  end;

end;

procedure TNotificacaoForm.Btn_SimClick(Sender: TObject);
begin
  if DM.PetQuery.RecordCount > 0 then
  begin
    if NotificacaoForm.sLabel1.Caption = 'Deseja Realizer o Cadastro de Vacina para o Pet?' then
    begin
      NotificacaoForm.close;
      CadastroPetForm.Visible := true;
      CadastroPetForm.PagePet.ActivePageIndex := 1;
      // CadastroPetForm.ListarVacinas;
      CadastroPetForm.BtnCadVacClick(Sender);
      CadastroPetForm.BtnGravar.Enabled :=
        not CadastroPetForm.BtnGravar.Enabled;
      CadastroPetForm.BtnCancelar.Enabled :=
        not CadastroPetForm.BtnCancelar.Enabled;
    end
    else if NotificacaoForm.sLabel1.Caption = 'Deseja Realizar o Cadastro de um novo Receituário?'  then
    begin
      DM.PetQuery.open;
      DM.VetQuery.open;
      DM.PetQuery.Edit;
      DM.VetQuery.Insert;
      DM.PetHistQuery.Open;
      DM.PetHistQuery.Insert;
      NotificacaoForm.close;
      CadastroReceituarioForm := TCadastroReceituarioForm.Create(nil);
      NotificacaoForm.close;
      CadastroReceituarioForm.ShowModal;
      CadastroReceituarioForm.Free;
    end

    else if NotificacaoForm.sLabel1.Caption =
      'Houve alterações no Cadastro do Pet' + #13 + ' Deseja sair sem Gravar? '  then
    begin
      NotificacaoForm.close;
      DM.PetQuery.CancelUpdates;
      DM.VacQuery.CancelUpdates;
      CadastroPetForm.close;
    end
    else if NotificacaoForm.sLabel1.Caption = ('Deseja Imprimir o Receituario?') then
    begin
      PrincipalForm.FrxReceituariox.prepareReport();
      PrincipalForm.FrxReceituariox.showReport();
      NotificacaoForm.close;
      CadastroReceituarioForm.close;
    end;
  end;

end;

procedure TNotificacaoForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  NotificacaoForm := TNotificacaoForm.Create(nil);
  NotificacaoForm.Free;
end;

procedure TNotificacaoForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  Begin
    Btn_Nao.Click;
  End;

  if (Key = VK_RETURN) then
  begin
    Btn_Sim.Click;
  end;
end;

procedure TNotificacaoForm.Timer1Timer(Sender: TObject);
begin
  ImgAtencao.Visible := not ImgAtencao.Visible;
end;

end.
