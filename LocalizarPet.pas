unit LocalizarPet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Data.DB, Vcl.StdCtrls, sEdit,
  Vcl.Buttons, sBitBtn, sButton, Vcl.Grids, AdvObj, BaseGrid, AdvGrid,
  DBAdvGrid, Vcl.ExtCtrls, sComboBox;

type
  TLocalizarPetForm = class(TForm)
    Panel1: TPanel;
    GridPetsLocalizar: TDBAdvGrid;
    Panel2: TPanel;
    Label1: TLabel;
    sButton1: TsButton;
    Btn_OkPet: TsBitBtn;
    PetLocalizar: TsEdit;
    DSPets: TDataSource;
    BoxPet: TsComboBox;
    Btn_OK_2: TsBitBtn;
    DSHist: TDataSource;
    procedure sButton1Click(Sender: TObject);
    procedure Btn_OkPetClick(Sender: TObject);
    procedure PetLocalizarChange(Sender: TObject);
    procedure GridPetsLocalizarDblClick(Sender: TObject);
    procedure Btn_OK_2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  LocalizarPetForm: TLocalizarPetForm;
  idpet : integer;

implementation

{$R *.dfm}

uses DataModulo, CadastroPet, Principal;

procedure TLocalizarPetForm.Btn_OK_2Click(Sender: TObject);
var
  codigo: string;
begin
  codigo := GridPetsLocalizar.ColumnByName['PETCOD'].Field.Text;
  if DM.AuxQuery5.RecordCount > 0 then
  Begin    DM.AuxQuery5.SQL.Text :=
      'select PETCOD, NOMEPET, IDCLIENTE, NOMECLIENTE,COD_CLIENTE_PET, IDPET from PETS WHERE PETCOD =  '+ codigo;
    DM.AuxQuery5.open;
    DM.PetHistQuery.Open;
    DM.PetHistQuery.Append;
    DM.PetHistQueryIDPETS.Value := DM.AuxQuery5.FieldByName('IDPET').Value;
    DM.PetHistQueryIDPET.Value := DM.AuxQuery5.FieldByName('PETCOD').Value;
    DM.PetHistQueryNOMEPET.Value := DM.AuxQuery5.FieldByName('NOMEPET').Value;
    DM.PetHistQueryIDCLIENTE.Value := DM.AuxQuery5.FieldByName('COD_CLIENTE_PET').Value;
    DM.PetHistQueryNOMECLIENTE.Value  := DM.AuxQuery5.FieldByName ('NOMECLIENTE').Value;
    DM.AuxQuery5.Close;
    LocalizarPetForm.Close;
  end;

end;

procedure TLocalizarPetForm.GridPetsLocalizarDblClick(Sender: TObject);

begin
 if Btn_OkPet.Visible <> false then
 begin
  Btn_OkPetClick(Sender);
 end
 else
 begin
   Btn_OK_2Click(Sender);
 end;
end;

procedure TLocalizarPetForm.PetLocalizarChange(Sender: TObject);
begin
  begin
    DM.AuxQuery5.SQL.Clear;

    case BoxPet.ItemIndex of
      0:
        DM.AuxQuery5.SQL.Add
          ('select PETCOD, NOMEPET, IDCLIENTE, NOMECLIENTE from PETS where UPPER (NOMEPET) like '
          + QuotedStr('%' + UPPERCASE(PetLocalizar.Text) + '%'''));

      1:
        DM.AuxQuery5.SQL.Add
          ('select PETCOD, NOMEPET, IDCLIENTE, NOMECLIENTE from PETS where UPPER (NOMECLIENTE) like'
          + QuotedStr('%' + UPPERCASE(PetLocalizar.Text) + '%'''));
    end;
    DM.AuxQuery5.open;
  end;
end;

procedure TLocalizarPetForm.Btn_OkPetClick(Sender: TObject);
var
  codigo: string;
begin
  codigo := GridPetsLocalizar.ColumnByName['PETCOD'].Field.Text;
  if DM.AuxQuery5.RecordCount > 0 then
  Begin
    DM.AuxQuery5.SQL.Text :=
      'select PETCOD, NOMEPET, IDCLIENTE, NOMECLIENTE,COD_CLIENTE_PET, IDPET from PETS WHERE PETCOD =  '
      + codigo;
    DM.AuxQuery5.open;
    if DM.AuxQuery5.FieldByName('PETCOD').AsString <> '' then
    begin
      begin
        DM.PetQuery.Edit;
        DM.PetQuery.open;
        DM.VetQuery.open;
        DM.PetQuery.Edit;
        DM.VetQuery.Insert;
        DM.PetQueryRECEITUARIO.Clear;
        DM.VacQueryNOME_PET_VAC.Value := DM.AuxQuery5.FieldByName('NOMEPET').Value;
        DM.VacQueryCOD_PET_VAC.Value := DM.AuxQuery5.FieldByName ('PETCOD').Value;
        DM.VacQueryID_PET_VAC.Value := inttostr(DM.AuxQuery5.FieldByName('IDPET').Value);
        DM.VacQueryID_CLIENTE.Value := DM.AuxQuery5.FieldByName ('COD_CLIENTE_PET').Value;
        DM.VacQueryNOME_CLIENTE.Value := DM.AuxQuery5.FieldByName ('NOMECLIENTE').Value;
        DM.VacQueryTEL_CLIENTE.Value := DM.ClientesQueryFONE1.Value;
      end;
      DM.Transaction.CommitRetaining;
      Close;
      DM.AuxQuery5.SQL.Clear;
    end;
  End;
end;

procedure TLocalizarPetForm.sButton1Click(Sender: TObject);
begin
  DM.AuxQuery5.SQL.Clear;

  case BoxPet.ItemIndex of
    0:
      DM.AuxQuery5.SQL.Add
        ('select PETCOD, NOMEPET, IDCLIENTE, NOMECLIENTE from PETS where UPPER (NOMEPET) like '
        + QuotedStr('%' + UPPERCASE(PetLocalizar.Text) + '%'));

    1:
      DM.AuxQuery5.SQL.Add
        ('select PETCOD, NOMEPET, IDCLIENTE, NOMECLIENTE from PETS where UPPER (NOMECLIENTE) like '
        + QuotedStr('%' + UPPERCASE(PetLocalizar.Text) + '%'));
  end;
  DM.AuxQuery5.open;
end;

end.
