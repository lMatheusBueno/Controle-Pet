unit Ajuda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  sEdit, sLabel, ShellApi, AdvUtil, Data.DB, Vcl.Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid;

type
  TAjudaForm = class(TForm)
    sLabel1: TsLabel;
    Edit_Ajuda: TsEdit;
    Btn_BuscarAjuda: TsBitBtn;
    DBAdvGrid1: TDBAdvGrid;
    DsAjuda: TDataSource;
    procedure Btn_BuscarAjudaClick(Sender: TObject);
    procedure DBAdvGrid1DblClick(Sender: TObject);
    procedure Edit_AjudaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AjudaForm: TAjudaForm;

implementation

{$R *.dfm}

uses  DataModulo, Principal;

procedure TAjudaForm.Btn_BuscarAjudaClick(Sender: TObject);
begin
  DM.AjudaQuery.Open;
  DM.AjudaQuery.SQL.Clear;
  DM.AjudaQuery.SQL.Add('SELECT *FROM PETS_AJUDA WHERE PETS_NOME_LINK LIKE ' + (QuotedStr('%' + UPPERCASE(Edit_Ajuda.Text + '%'))));
  DM.AjudaQuery.Open;
end;

procedure TAjudaForm.DBAdvGrid1DblClick(Sender: TObject);
var
  link: PWideChar;
begin
  link := pchar(DM.AjudaQueryPETS_LINK.Text);
  ShellExecute(Handle, 'open', link, '', '', 1);
end;

procedure TAjudaForm.Edit_AjudaChange(Sender: TObject);
begin
Btn_BuscarAjudaClick(sender);
end;

end.
