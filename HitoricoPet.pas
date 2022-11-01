unit HitoricoPet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, sDBMemo, sMemo,
  sDBComboBox, Vcl.ExtCtrls, sBevel, Vcl.Mask, sDBEdit, sLabel, sPanel,
  Vcl.ComCtrls, sStatusBar, Vcl.Buttons, sBitBtn, sEdit, sComboBox, sGroupBox,
  sDBNavigator;

type
  TFormHistorico = class(TForm)
    DsHistorico: TDataSource;
    sStatusBar1: TsStatusBar;
    sPanel2: TsPanel;
    Principal_Panel: TsPanel;
    sLabel3: TsLabel;
    sLabel5: TsLabel;
    sLabel4: TsLabel;
    sLabel6: TsLabel;
    sLabel1: TsLabel;
    sPanel3: TsPanel;
    sLabel7: TsLabel;
    EditCodigoHist: TsDBEdit;
    EditNome: TsDBEdit;
    sDBEdit3: TsDBEdit;
    sDBEdit4: TsDBEdit;
    MemoReceituarioHist: TsDBMemo;
    sPanel1: TsPanel;
    sBitBtn3: TsBitBtn;
    sDBNavigator1: TsDBNavigator;
    sGroupBox1: TsGroupBox;
    Label1: TLabel;
    cbFiltro: TsComboBox;
    sBitBtn6: TsBitBtn;
    Pesquisa_Edit: TsEdit;
    GridPets: TDBAdvGrid;
    sPanel4: TsPanel;
    sLabel2: TsLabel;
    contadorpet: TsLabel;
    sBitBtn1: TsBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPetsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistorico: TFormHistorico;

implementation

{$R *.dfm}

uses CadastroPet,  Principal, Notificacao, DataModulo, CadastroReceituario;

procedure TFormHistorico.BtnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TFormHistorico.BtnGravarClick(Sender: TObject);
begin
if DM.PetHistQuery.RecordCount <> 0 then
  begin

  PrincipalForm.FrxReceituariox.prepareReport();
  PrincipalForm.FrxReceituariox.showReport();

  end;
end;

procedure TFormHistorico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DM.PetHistQuery.Close;
end;

procedure TFormHistorico.FormCreate(Sender: TObject);
Var
  codigo: string;
BEGIN
//  codigo := DM.PetQueryPETCOD.Value;
//  DM.PetHistQuery.SQL.Clear;
//  DM.PetHistQuery.SQL.Add('select * from PETHIST where IDPET = ' + codigo);
//  DM.PetHistQuery.Open;
END;

procedure TFormHistorico.GridPetsDblClick(Sender: TObject);
begin
  if DM.PetHistQuery.RecordCount <> 0 then
  begin
  DM.PetHistQuery.Open;
  DM.PetHistQuery.Edit;
  CadastroReceituarioForm := TCadastroReceituarioForm.Create(nil);
  CadastroReceituarioForm.ShowModal;
  CadastroReceituarioForm.Free;
  end;
end;

procedure TFormHistorico.sBitBtn1Click(Sender: TObject);
begin
  PrincipalForm.Btn_ReceituarioClick(sender);
end;

procedure TFormHistorico.sBitBtn2Click(Sender: TObject);
begin

  DM.PetHistQuery.SQL.Clear;
  {Nome Pet   Cod. Pet    Nome Cliente  Cod. Cliente}
  case cbFiltro.ItemIndex of

    0: DM.PetHistQuery.SQL.Add('select * from PETHIST where UPPER (NOMEPET) LIKE  ' + QuotedStr('%' + UPPERCASE(Pesquisa_Edit.Text) + '%'));

    1: DM.PetHistQuery.SQL.Add('select * from PETHIST where IDPET LIKE '      + QuotedStr('%' + Pesquisa_Edit.Text + '%'));

    2: DM.PetHistQuery.SQL.Add('select * from PETHIST where UPPER (NOMECLIENTE) LIKE' + QuotedStr('%' +UPPERCASE(Pesquisa_Edit.Text) + '%'));

    3: DM.PetHistQuery.SQL.Add('select * from PETHIST where IDCLIENTE LIKE'  + QuotedStr('%' + Pesquisa_Edit.Text + '%'));

  end;
   DM.PetHistQuery.Open;
   contadorpet.Caption := inttostr(DM.PetHistQuery.RecordCount);
end;

end.
