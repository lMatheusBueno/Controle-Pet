unit CadastroReceituario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, Data.DB,
  Vcl.StdCtrls, Vcl.Buttons, sBitBtn, Vcl.Mask, Vcl.DBCtrls, sDBEdit, sBevel,
  sDBMemo, sGroupBox;

type
  TCadastroReceituarioForm = class(TForm)
    Memo_Receituario: TsDBMemo;
    Ds_Pet: TDataSource;
    Ds_Hist: TDataSource;
    PanelBtnPet: TsPanel;
    BtnGravar: TsBitBtn;
    BtnCancelar: TsBitBtn;
    Label13: TLabel;
    sGroupBox1: TsGroupBox;
    Edit_CodigoPet: TsDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit_NomeCli: TsDBEdit;
    Edit_CodigoCli: TsDBEdit;
    Label1: TLabel;
    Edit_NomePet: TsDBEdit;
    Label2: TLabel;
    BtnPesquisaPetVac: TsBitBtn;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnPesquisaPetVacClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo_ReceituarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      codigo : Integer;

  end;

var
  CadastroReceituarioForm: TCadastroReceituarioForm;


implementation

{$R *.dfm}

uses DataModulo, Notificacao, LocalizarPet, Principal;

procedure TCadastroReceituarioForm.BtnCancelarClick(Sender: TObject);
begin
  DM.PetQuery.CancelUpdates;
  close;
end;

procedure TCadastroReceituarioForm.BtnGravarClick(Sender: TObject);
var
  I: integer;

begin
  codigo := strtoint(DM.PetHistQueryIDPET.Value);
  //DM.PetQuery.Edit;
  DM.PetHistQueryDATACADHIST.Value := now;
  DM.PetHistQuery.Post;
  //DM.PetQuery.Post;
  notificacaoForm := TnotificacaoForm.Create(Self);
  notificacaoForm.Btn_Enter.Visible := false;
  notificacaoForm.Btn_Sim.Visible := true;
  notificacaoForm.Btn_Nao.Visible := true;
  notificacaoForm.sLabel1.Caption := ('Deseja Imprimir o Receituario?');
  notificacaoForm.ShowModal;

end;

procedure TCadastroReceituarioForm.BtnPesquisaPetVacClick(Sender: TObject);
begin
  LocalizarPetForm := TLocalizarPetForm.Create(Nil);
  LocalizarPetForm.Btn_OkPet.Visible := false;
  LocalizarPetForm.Btn_OK_2.Visible := true;
  LocalizarPetForm.ShowModal;
  LocalizarPetForm.Free;
end;

procedure TCadastroReceituarioForm.FormCreate(Sender: TObject);
begin
//DM.PetHistQuery.Close;
end;

procedure TCadastroReceituarioForm.Memo_ReceituarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and (Key = VK_RETURN) then
  begin
  BtnGravar.Click;
  end;
  if Key = VK_ESCAPE then
  begin
    BtnCancelar.Click;
  end;
end;

end.
