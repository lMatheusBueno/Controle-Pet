program ProjetoControlePet;

uses
  Vcl.Forms,
  System.SysUtils,
  DataModulo in 'DataModulo.pas' {DataModulo: TDataModule},
  Principal in 'Principal.pas' {PrincipalForm},
  CadastroPet in 'CadastroPet.pas' {CadastroPetForm},
  Vcl.Themes,
  Vcl.Styles,
  LocalizarVeterinario in 'LocalizarVeterinario.pas' {LocalizarVetForm},
  Agendas in 'Agendas.pas' {AgendasForm},
  HitoricoPet in 'HitoricoPet.pas' {FormHistorico},
  Notificacao in 'Notificacao.pas' {NotificacaoForm},
  LocalizarCliente in 'LocalizarCliente.pas' {FomrLocalizarCliente},
  LocalizarPet in 'LocalizarPet.pas' {LocalizarPetForm},
  Vacinas in 'Vacinas.pas' {VacinasForm},
  CadastroVacinas in 'CadastroVacinas.pas' {CadastroVacinasForm},
  CadastroReceituario in 'CadastroReceituario.pas' {CadastroReceituarioForm},
  Ajuda in 'Ajuda.pas' {AjudaForm},
  RelatorioVac in 'RelatorioVac.pas' {RelatorioVacForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipalForm, PrincipalForm);
  Application.Run;
  // Application.CreateForm(TForm_ImgPet, Form_ImgPet);
  // Application.CreateForm(TUNIT_CADASTROSPET1, UNIT_CADASTROSPET1);
  // Application.CreateForm(TCadVacinasForm, CadVacinasForm);
  // Application.CreateForm(TVacinasForm, VacinasForm);
  // Application.CreateForm(TUnitLocalizarPet, UnitLocalizarPet);
  // Application.CreateForm(TUnitLocalizarCliente, UnitLocalizarCliente);
  // Application.CreateForm(TUnitNotificacao, UnitNotificacao);
  // Application.CreateForm(TUNIT_VETERINARIO, UNIT_VETERINARIO);
  // Application.CreateForm(TUNIT_VETCADASTRO, UNIT_VETCADASTRO);
  // Application.CreateForm(TPetAjustes, PetAjustes);
  // Application.CreateForm(TPetAgendas, PetAgendas);
  // Application.CreateForm(TUnitConsumo, UnitConsumo);
  // Application.CreateForm(TForm1, Form1);
  // Application.CreateForm(TFormCadReceituario, FormCadReceituario);
  // Application.CreateForm(TFormAjuda, FormAjuda);
  // Application.CreateForm(TRelatorioVacForm, RelatorioVacForm);
end.
