unit RelatorioVac;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, sEdit,
  Vcl.Buttons, sBitBtn, Vcl.ExtCtrls, sPanel, sRadioButton, sGroupBox;

type
  TRelatorioVacForm = class(TForm)
    sGroupBox1: TsGroupBox;
    Check_FiltroPendente: TsRadioButton;
    Check_FiltroConcluido: TsRadioButton;
    Check_FiltroTodos: TsRadioButton;
    Check_FiltroAtraso: TsRadioButton;
    Check_FiltroPendenteAtraso: TsRadioButton;
    PanelBtnPet: TsPanel;
    BtnGravar: TsBitBtn;
    BtnCancelar: TsBitBtn;
    sEdit1: TsEdit;
    sLabel1: TsLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelatorioVacForm: TRelatorioVacForm;

implementation

{$R *.dfm}

uses Principal, DataModulo;

procedure TRelatorioVacForm.BtnCancelarClick(Sender: TObject);
begin
close;
end;

procedure TRelatorioVacForm.BtnGravarClick(Sender: TObject);
var
  filtro_atraso, filtro_pendente, filtro_concluido, filtros: string;
begin
  DM.VacQuery.SQL.Clear;
  if Check_FiltroTodos.Checked <> True then
  begin
    if (Check_FiltroAtraso.Checked = True) then
    begin
      filtro_atraso := (' WHERE STATUS_VAC =' + QuotedStr('em Atraso'));
    end;
    if (Check_FiltroPendenteAtraso.Checked = True) then
    begin
      filtro_pendente := (' or STATUS_VAC = ' + QuotedStr('Pendente'));
      filtro_atraso := (' WHERE STATUS_VAC = ' + QuotedStr('em Atraso'));
    end;
    if Check_FiltroPendente.Checked = True then
    begin
      filtro_pendente := (' WHERE STATUS_VAC =' + QuotedStr('Pendente'));
    end;
    if (Check_FiltroConcluido.Checked = True) then
    begin
      filtro_concluido := (' WHERE STATUS_VAC =' + QuotedStr('Concluido'))
    end;
  end;

  DM.VacQuery.SQL.Add('select *from PETSVAC ' + filtro_atraso + filtro_pendente
    + filtro_concluido);
  DM.VacQuery.Open;
  PrincipalForm.frxVacinas.PrepareReport();
  PrincipalForm.frxVacinas.ShowReport();


end;

end.
