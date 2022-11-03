unit LocalizarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Data.DB, Vcl.StdCtrls, sEdit,
  Vcl.Buttons, sBitBtn, sButton, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.ExtCtrls, sComboBox;

type
  TFomrLocalizarCliente = class(TForm)
    Panel1: TPanel;
    GridClientes: TDBAdvGrid;
    Panel2: TPanel;
    Label1: TLabel;
    sButton1: TsButton;
    Btn_OkCli: TsBitBtn;
    Edit_ClienteLocalizar: TsEdit;
    DSCliente: TDataSource;
    procedure sButton1Click(Sender: TObject);
    procedure Edit_ClienteLocalizarChange(Sender: TObject);
    procedure Btn_OkCliClick(Sender: TObject);
    procedure GridClientesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FomrLocalizarCliente: TFomrLocalizarCliente;

implementation

{$R *.dfm}

uses DataModulo, CadastroPet, Principal;

procedure TFomrLocalizarCliente.Edit_ClienteLocalizarChange(Sender: TObject);
begin
  DM.ClientesQuery.SQL.Clear;

  DM.ClientesQuery.SQL.Add('select *from CLIENTES where UPPER (RAZAO) like ' +
    QuotedStr('%' + UPPERCASE(QuotedStr(Edit_ClienteLocalizar.Text)) + '%'''));

  DM.ClientesQuery.open;
end;

procedure TFomrLocalizarCliente.FormCreate(Sender: TObject);
begin
Btn_OkCliClick(sender);
end;

procedure TFomrLocalizarCliente.GridClientesDblClick(Sender: TObject);

begin
  Btn_OkCli.Click();
end;

procedure TFomrLocalizarCliente.Btn_OkCliClick(Sender: TObject);
var
  codigo: string;
begin
  codigo := GridClientes.Columns.Items[1].Field.Text;
  DM.extraquery.SQL.Text :=
    'select first 1 COD,RAZAO,FONE1,FONE2,FONE3 from CLIENTES WHERE COD =  ' + codigo;
  DM.extraquery.open;
  if DM.extraquery.FieldByName('COD').AsString <> '' then
  begin
    DM.PetQuery.Edit;
    begin
      DM.petqueryNOMECLIENTE.Value := DM.extraquery.FieldByName('RAZAO').Value;
      DM.PetQueryCOD_CLIENTE_PET.Value := DM.extraquery.FieldByName('COD').Value;
      if (DM.VacQuery.State = dsEdit) or (DM.VacQuery.State = dsInsert) then
      begin
        DM.VacQueryID_CLIENTE.Value := DM.extraquery.FieldByName('COD').Value;
        DM.VacQueryNOME_CLIENTE.Value := DM.extraquery.FieldByName('RAZAO').Value;
      end;
      DM.TRANSACION.CommitRetaining;
    end;
    Close;

  end;
end;

procedure TFomrLocalizarCliente.sButton1Click(Sender: TObject);
begin
  DM.ClientesQuery.SQL.Clear;
  DM.ClientesQuery.SQL.Add('select *from CLIENTES where UPPER (RAZAO) like ' +
    QuotedStr('%' + UPPERCASE(Edit_ClienteLocalizar.Text) + '%'));
  DM.ClientesQuery.open;
end;

end.
