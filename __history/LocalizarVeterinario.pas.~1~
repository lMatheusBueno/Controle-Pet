unit LocalizarVeterinario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, sDBEdit, Vcl.ComCtrls, AdvUtil, Vcl.Buttons, sBitBtn, Vcl.Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, sEdit, sButton, sComboBox, Data.DB,
  inifiles,
  Vcl.DBGrids, IBX.IBCustomDataSet, Sdialogs, IBX.IBQuery, sPanel;

type
  TLocalizarVetForm = class(TForm)
    Panel1: TPanel;
    DBAVet: TDBAdvGrid;
    DSVeterinario: TDataSource;
    DSCliente: TDataSource;
    sPanel1: TsPanel;
    Edit_LocalizarVet: TsEdit;
    Label1: TLabel;
    sButton1: TsButton;
    sBitBtn1: TsBitBtn;
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure Edit_LocalizarVetChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBAdvGrid1ClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure DBAVetDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure sBitBtn2Click(Sender: TObject);
    procedure DBAVetCvarolumnSize(Sender: TObject; ACol: Integer;
      var Allow: Boolean);
    procedure sButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LocalizarVetForm: TLocalizarVetForm;

implementation

{$R *.dfm}

uses CadastroPet,  DataModulo, Principal, HitoricoPet;

procedure TLocalizarVetForm.DBAdvGrid1ClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  close;
  // CadastroPetForm.txtnomevet1.Text := DBAdvGrid1.Fields[2].Value;
  // CadastroPetForm.txtnomevet1.Text := UNIT_VETERINARIO.DBAdvGrid1.Fields[2].Value;

end;

procedure TLocalizarVetForm.DBAVetCvarolumnSize(Sender: TObject; ACol: Integer;
  var Allow: Boolean);
var
  s, diretorio: string;
  inifile: tinifile;
  advs1, advs2: TAdvStringGrid;
begin
  diretorio := ExtractFilePath(Application.ExeName);
  inifile := tinifile.Create(diretorio + '\tabela.ini');
  s := inifile.ReadString('PETS', 'SETTINGS', DBAVet.ColumnStatesToString);

  advs1 := TAdvStringGrid.Create(self);
  advs1.StringToColumnStates(DBAVet.ColumnStatesToString);
  advs1.UnHideColumnsAll;

  advs2 := TAdvStringGrid.Create(self);
  advs2.StringToColumnStates(s);
  advs2.UnHideColumnsAll;

  if advs1.ColCount = advs2.ColCount then
    DBAVet.StringToColumnStates(s);
  advs1.Destroy;
  advs2.Destroy;

end;

procedure TLocalizarVetForm.DBAVetDblClickCell(Sender: TObject;
  ARow, ACol: Integer);
begin
  sBitBtn1.Click;
end;

procedure TLocalizarVetForm.DBGrid1CellClick(Column: TColumn);
begin
  close;
  // CadastroPetForm.txtnomevet1.Text := DBGrid1.Fields[1].Value;

end;

procedure TLocalizarVetForm.FormCreate(Sender: TObject);
begin
  // Left := (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  // Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;
  // Position := poScreenCenter;
end;

procedure TLocalizarVetForm.sBitBtn1Click(Sender: TObject);
begin
  if DM.VetQuery.RecordCount > 0 then
  Begin
    // DM.VetQuery.Edit;
    // DM.VetQuery.Post;
    DM.VetQuery.Edit;
    CadastroPetForm.Edit_Veterinario.text :=
     DM.VetQuery.FieldByName('NOME').Value;
    CadastroPetForm.Edit_CodigoVet.text :=
    DM.VetQuery.FieldByName('IDCOLABORADOR').Value;
    DM.PetQueryCARGOVET.Value := DM.VetQueryCARGO.Value;
    DM.TRANSACION.CommitRetaining;
    //DM.AuxQuery4.SQL.Clear;
    close;
  End;
end;

procedure TLocalizarVetForm.sBitBtn2Click(Sender: TObject);

begin
  if sMessageDlg('Excluir?', 'Deseja Excluir o Registro', mtWarning,
    [mbYes, mbNo], 1) = mryes then
  begin
    DM.VetQuery.Delete;
  end
end;

procedure TLocalizarVetForm.sBitBtn3Click(Sender: TObject);
begin
  DM.VetQuery.Insert;

end;

procedure TLocalizarVetForm.sBitBtn4Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja Excluir o Registro', 'Excluir',
    MB_ICONQUESTION + MB_YESNO) = mryes then
  begin
    DM.VetQuery.Delete;
  end;
end;

procedure TLocalizarVetForm.sBitBtn5Click(Sender: TObject);
begin
  DM.VetQuery.Edit;
end;

procedure TLocalizarVetForm.sButton1Click(Sender: TObject);
begin
  DM.VetQuery.SQL.Clear;
  DM.VetQuery.SQL.Add('select *from COLABORADORES where UPPER (NOME) like ' +
    QuotedStr('%' + UPPERCASE(Edit_LocalizarVet.text) + '%'));
  DM.VetQuery.open;
end;

procedure TLocalizarVetForm.Edit_LocalizarVetChange(Sender: TObject);
begin
  DM.VetQuery.SQL.Clear;
  DM.VetQuery.SQL.Add('select *from COLABORADORES where UPPER (NOME) like ' +
    QuotedStr('%' + UPPERCASE(Edit_LocalizarVet.text) + '%'));
  DM.VetQuery.open;
end;

end.

