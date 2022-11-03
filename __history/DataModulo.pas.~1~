unit DataModulo;

interface

uses
  System.SysUtils, System.Classes, IBX.IBDatabase, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBUpdateSQL,VCL.FORMS;

type
  TDM = class(TDataModule)
    IBclientes: TIBUpdateSQL;
    PetQuery: TIBQuery;
    DATABASE: TIBDatabase;
    TRANSACION: TIBTransaction;
    ClientesQuery: TIBQuery;
    IBpet: TIBUpdateSQL;
    ClientesQueryIDCLIENTE: TIntegerField;
    ClientesQueryEMPRESA: TIntegerField;
    ClientesQueryTIPO: TIBStringField;
    ClientesQueryRAZAO: TIBStringField;
    ClientesQueryFANTASIA: TIBStringField;
    ClientesQueryCONTATO: TIBStringField;
    ClientesQueryFONE1: TIBStringField;
    ClientesQueryFONE2: TIBStringField;
    ClientesQueryFONE3: TIBStringField;
    ClientesQueryFONE1TIPO: TIBStringField;
    ClientesQueryFONE2TIPO: TIBStringField;
    ClientesQueryFONE3TIPO: TIBStringField;
    ClientesQueryFONE1OP: TIBStringField;
    ClientesQueryFONE2OP: TIBStringField;
    ClientesQueryFONE3OP: TIBStringField;
    ClientesQueryCNPJCPF: TIBStringField;
    ClientesQueryIE: TIBStringField;
    ClientesQueryRG: TIBStringField;
    ClientesQueryIM: TIBStringField;
    ClientesQuerySUFRAMA: TIBStringField;
    ClientesQueryEMAIL1: TIBStringField;
    ClientesQueryEMAIL2: TIBStringField;
    ClientesQuerySITE: TIBStringField;
    ClientesQueryENDERECO: TIBStringField;
    ClientesQueryNUMERO: TIBStringField;
    ClientesQueryBAIRRO: TIBStringField;
    ClientesQueryCIDADE: TIBStringField;
    ClientesQueryUF: TIBStringField;
    ClientesQueryCEP: TIBStringField;
    ClientesQueryCOMPLEMENTO: TIBStringField;
    ClientesQueryANOTACOES: TIBStringField;
    ClientesQueryDATANASC: TDateField;
    ClientesQueryDATAALT: TDateField;
    ClientesQueryUSUARIOALT: TIBStringField;
    ClientesQueryIMAGEMEXT: TIBStringField;
    ClientesQueryPAIS: TIBStringField;
    ClientesQueryPAISCOD: TIBStringField;
    ClientesQueryLIMITECRED: TFloatField;
    ClientesQueryBLOQUEADO: TIBStringField;
    ClientesQueryMOTIVOBLOQUEIO: TIBStringField;
    ClientesQueryIDCIDADE: TIntegerField;
    ClientesQueryCONTRATO: TIBStringField;
    ClientesQueryCAMPO1: TIBStringField;
    ClientesQueryCAMPO2: TIBStringField;
    ClientesQueryCAMPO3: TIBStringField;
    ClientesQueryCAMPO4: TIBStringField;
    ClientesQueryCAMPO5: TIBStringField;
    ClientesQueryCAMPO6: TIBStringField;
    ClientesQueryCAMPO7: TIBStringField;
    ClientesQueryCAMPO8: TIBStringField;
    ClientesQueryCAMPO9: TIBStringField;
    ClientesQueryCAMPO10: TIBStringField;
    ClientesQueryCOD: TIBStringField;
    ClientesQueryCATEGORIA: TIBStringField;
    ClientesQueryDATACAD: TDateField;
    ClientesQueryENT_ENDERECO: TIBStringField;
    ClientesQueryENT_NUMERO: TIBStringField;
    ClientesQueryENT_BAIRRO: TIBStringField;
    ClientesQueryENT_CIDADE: TIBStringField;
    ClientesQueryENT_UF: TIBStringField;
    ClientesQueryENT_CEP: TIBStringField;
    ClientesQueryENT_COMPLEMENTO: TIBStringField;
    ClientesQueryENT_IDCIDADE: TIntegerField;
    ClientesQueryPFIS_NOMEPAI: TIBStringField;
    ClientesQueryPFIS_NOMEMAE: TIBStringField;
    ClientesQueryPFIS_NOMECONJ: TIBStringField;
    ClientesQueryPFIS_LOCALTRAB: TIBStringField;
    ClientesQueryPFIS_PROFISSAO: TIBStringField;
    ClientesQueryPJUR_TIPOEMPRESA: TIBStringField;
    ClientesQueryPJUR_DATAFUNDACAO: TDateField;
    ClientesQueryPJUR_ATIECONOMICA: TIBStringField;
    ClientesQueryIDVENDEDOR: TIntegerField;
    ClientesQueryNOMEVENDEDOR: TIBStringField;
    ClientesQueryREFCOMERCIAIS: TIBStringField;
    ClientesQueryESPECIE: TIBStringField;
    ClientesQueryCONDPAGTO: TIBStringField;
    ClientesQueryCONDPAGTODESC: TIBStringField;
    ClientesQuerySOCIO1: TIBStringField;
    ClientesQuerySOCIO1CPF: TIBStringField;
    ClientesQuerySOCIO2: TIBStringField;
    ClientesQuerySOCIO2CPF: TIBStringField;
    ClientesQueryVAR_MOBILE: TIBStringField;
    ClientesQueryVAR_PAF: TIBStringField;
    ClientesQueryTABPRECO1: TIBStringField;
    ClientesQueryTABPRECO2: TIBStringField;
    ClientesQueryTABPRECO3: TIBStringField;
    ClientesQueryROTAENTREGA: TIBStringField;
    ClientesQueryPOSICAOENTREGA: TIntegerField;
    ClientesQueryCONTABILIDADE: TIntegerField;
    ClientesQueryTPCONTR: TIBStringField;
    ClientesQueryVENCTOSERVICO: TDateField;
    ClientesQueryIDADE: TIBStringField;
    ClientesQuerySALDO_CREDITO: TFloatField;
    ClientesQueryWHATSFONE1: TIBStringField;
    ClientesQueryWHATSFONE2: TIBStringField;
    ClientesQueryWHATSFONE3: TIBStringField;
    ClientesQueryKM_CLIENTE: TFloatField;
    ClientesQueryEMAIL3: TIBStringField;
    ClientesQueryEMAIL4: TIBStringField;
    ClientesQueryMOBILE: TIntegerField;
    ClientesQueryIMAGEM: TIBStringField;
    ClientesQueryNOME_FOTO: TIBStringField;
    ClientesQueryFOTO_CLIENTE: TBlobField;
    ClientesQueryWHATS_VENDA: TIBStringField;
    ClientesQueryWHATS_OS: TIBStringField;
    ClientesQueryWHATS_ORCAMENTO: TIBStringField;
    ClientesQueryWHATS_COBRANCA: TIBStringField;
    ClientesQueryDIA_VENCIMENTO: TIntegerField;
    ClientesQuerySEXO: TIBStringField;
    ClientesQueryUSUARIOCAD: TIBStringField;
    ClientesQueryDADOS_ATUALIZADO: TIBStringField;
    AuxQuery2: TIBQuery;
    AuxQuery3: TIBQuery;
    AuxQuery4: TIBQuery;
    VetQuery: TIBQuery;
    IBColabVet: TIBUpdateSQL;
    VetQueryNOME: TIBStringField;
    AuxQuery5: TIBQuery;
    PetHistQuery: TIBQuery;
    IBPetHist: TIBUpdateSQL;
    VetQueryIDCOLABORADOR: TIntegerField;
    VetQueryCARGO: TIBStringField;
    AuxQuery1: TIBQuery;
    VacQuery: TIBQuery;
    IBVac: TIBUpdateSQL;
    ExtraQuery: TIBQuery;
    PetQueryIDPET: TIntegerField;
    PetQueryNOMEPET: TIBStringField;
    PetQueryRACA: TIBStringField;
    PetQuerySEXOPET: TIBStringField;
    PetQueryESPECIE: TIBStringField;
    PetQueryANOTA: TIBStringField;
    PetQueryFOTO: TBlobField;
    PetQueryIDCONTROLVACEPET: TIntegerField;
    PetQueryIDCLIENTE: TIntegerField;
    PetQueryNOMECLIENTE: TIBStringField;
    PetQueryDATANASCPET: TDateField;
    PetQueryRECEITUARIO: TIBStringField;
    PetQueryPETCOD: TIBStringField;
    PetQueryDATACADPET: TDateField;
    PetQueryANOTAVAC: TIBStringField;
    PetQueryIDADEPET: TIBStringField;
    PetQuerySITUACAOPET: TIBStringField;
    PetQueryIDVETERINARIO: TIBStringField;
    PetQueryNOMEVETERINARIO: TIBStringField;
    PetQueryCARGOVET: TIBStringField;
    PetQueryVACINASPET: TIBStringField;
    PetQueryPROXVACINAPET: TDateField;
    PetQueryDATAVACPET: TDateField;
    VacQueryID_VAC: TIntegerField;
    VacQueryNOME_VAC: TIBStringField;
    VacQueryANOTA_VAC: TIBStringField;
    VacQueryDATA_VAC: TDateField;
    VacQueryPROX_DATA_VAC: TDateField;
    VacQueryCOD_VAC: TIBStringField;
    VacQueryID_VETERINARIO_VAC: TIBStringField;
    T: TIBStringField;
    VacQuerySTATUS_VAC: TIBStringField;
    VacQueryID_PET_VAC: TIBStringField;
    VacQueryNOME_PET_VAC: TIBStringField;
    VacQueryID_CLIENTE: TIBStringField;
    VacQueryNOME_CLIENTE: TIBStringField;
    VacQueryTEL_CLIENTE: TIBStringField;
    VacQueryDIAS_VACINA: TIBStringField;
    VacQueryPROX_VAC: TIBStringField;
    VacQueryCOD_PET_VAC: TIBStringField;
    PetQueryCOD_CLIENTE_PET: TIBStringField;
    ConfigQuery: TIBQuery;
    IBConfig: TIBUpdateSQL;
    ConfigQueryCAB1: TIBStringField;
    ConfigQueryCAB2: TIBStringField;
    ConfigQueryCAB3: TIBStringField;
    ConfigQueryCAB4: TIBStringField;
    AjudaQuery: TIBQuery;
    IBAjuda: TIBUpdateSQL;
    AjudaQueryID_PETS_AJUDA: TIntegerField;
    AjudaQueryPETS_NOME_LINK: TIBStringField;
    AjudaQueryPETS_LINK: TIBStringField;
    PetHistQueryIDPETHIST: TIntegerField;
    PetHistQueryIDPETS: TIntegerField;
    PetHistQueryDATACADHIST: TDateField;
    PetHistQueryIDPET: TIBStringField;
    PetHistQueryNOMEPET: TIBStringField;
    PetHistQueryIDCLIENTE: TIBStringField;
    PetHistQueryNOMECLIENTE: TIBStringField;
    PetHistQueryRECEITUARIOHIST: TIBStringField;
   // procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
//
//procedure Busca_Integridade_Base_Dados();

//procedure Atualiza_Integridade_Tabela(pTabela : String; pCampo : String; pFormato : String; pCriaTabela : Boolean; pGen : Boolean);
//var
//  QueryTmp : TIBQuery;
//  bAchou   : Boolean;
//begin
//  QueryTmp := TIBQuery.Create(Application);
//  QueryTmp.Transaction := DM1.TRANSACION;
//  QueryTmp.SQL.Clear;
//
//  bAchou := False;
//
//  if pGen then
//  begin
//    QueryTmp.SQL.Add('SELECT * FROM rdb$generators where rdb$generator_name = ''' + UpperCase(pTabela) + '''');
//    QueryTmp.Active := True;
//
//    bAchou := False;
//    if  QueryTmp.RecordCount = 0 then
//    begin
//      QueryTmp.Close;
//      QueryTmp.SQL.Clear;
//      QueryTmp.SQL.Add(pCampo);
//      QueryTmp.Active := True;
//
//      QueryTmp.SQL.Clear;
//      QueryTmp.SQL.Add(pFormato);
//      QueryTmp.Active := True;
//
//      bAchou := True;
//    end;
//  end;
//
//  if (not pCriaTabela) and (not bAchou) and (not pGen) then
//  begin
//    QueryTmp.SQL.Add('SELECT * FROM rdb$relation_fields WHERE rdb$relation_name = ''' + UpperCase(pTabela) + ''' AND rdb$field_name = ''' + UpperCase(pCampo) + '''');
//    QueryTmp.Active := True;
//
//    bAchou := False;
//    if  QueryTmp.RecordCount = 0 then
//    begin
//      QueryTmp.Close;
//      QueryTmp.SQL.Clear;
//      QueryTmp.SQL.Add('ALTER TABLE ' + pTabela + ' ADD ' + pCampo + ' ' +  pFormato  + ' ;');
//      QueryTmp.Active := True;
//      bAchou := True;
//    end;
//  end
//  else
//  begin
//    if (not bAchou) and (not pGen) then
//    begin
//      QueryTmp.SQL.Add('SELECT * FROM rdb$relations WHERE rdb$relation_name = ''' + UpperCase(pTabela) + '''');
//      QueryTmp.Active := True;
//
//      bAchou := False;
//      if  QueryTmp.RecordCount = 0 then
//      begin
//        QueryTmp.Close;
//        QueryTmp.SQL.Clear;
//        QueryTmp.SQL.Add(pCampo);
//        QueryTmp.Active := True;
//        bAchou := True;
//      end;
//    end;
//  end;
//
//   //Efetiva a transação no banco de dados...
//   if bAchou then
//   begin
//     QueryTmp.SQL.Clear;
//     QueryTmp.SQL.Add('COMMIT;');
//     QueryTmp.Active := True;
//   end;
//
//   QueryTmp.Close;
//   QueryTmp := Nil;
//end;
//
//begin
//
//Atualiza_Integridade_Tabela('GEN_PETS_ID','CREATE GENERATOR GEN_PETS_ID','SET GENERATOR GEN_PETS_ID TO 0',False,True);
//Atualiza_Integridade_Tabela('PETS','CREATE TABLE PETS ('+
//                            'ID                         INTEGER NOT NULL,' +
//                            'NOME                        VARCHAR(30),' +
//                            'RACA                        VARCHAR(30),' +
//                            'SEXO                        VARCHAR(30),' +
//                            'ESPECIE                     VARCHAR(30),' +
//                            'ADICIONAL                   VARCHAR(30),' +
//                            'FOTO                        BLOB SUB_TYPE 0 SEGMENT SIZE 999,'+
//                            'IDCONTROLE                  INTEGER    ,' +
//                            'IDCLIENTE                   INTEGER    ,' +
//                            'NOMECLIENTE                 VARCHAR(150),'+
//                            'DATANASC                    DATE        ,'+
//                            'RECEITUARIO                 VARCHAR(999),'+
//                            'PETCOD                      VARCHAR(10), '+
//                            'EMPRESAS                    INTEGER,     '+
//                            'IDADE                       VARCHAR(30), '+
//                            'IDVETERINARIO               INTEGER,     '+
//                            'VETERINARIO                 VARCHAR(30),  ' ,'',  True,False);
//
//
//Atualiza_Integridade_Tabela('PETS', 'ID',                       'INTEGER NOT NULL',False,False);
//Atualiza_Integridade_Tabela('PETS','NOME',                         'VARCHAR(30)' ,False,False);
//Atualiza_Integridade_Tabela('PETS', 'RACA',                        'VARCHAR(30)' ,False,False);
//Atualiza_Integridade_Tabela('PETS', 'SEXO',                        'VARCHAR(30) ',False,False);
//Atualiza_Integridade_Tabela('PETS', 'ESPECIE',                     'VARCHAR(30)' ,False,False);
//Atualiza_Integridade_Tabela('PETS', 'ADICIONAL',                   'VARCHAR(30)' ,False,False);
//Atualiza_Integridade_Tabela('PETS', 'FOTO',                        'BLOB SUB_TYPE 0 SEGMENT SIZE 999,',False,False);
//Atualiza_Integridade_Tabela('PETS', 'IDCONTROLE',                  'INTEGER    ' ,False,False);
//Atualiza_Integridade_Tabela('PETS', 'IDCLIENTE',                   'INTEGER    ' ,False,False);
//Atualiza_Integridade_Tabela('PETS', 'NOMECLIENTE',                 'VARCHAR(150)',False,False);
//Atualiza_Integridade_Tabela('PETS', 'DATANASC',                    'DATE        ',False,False);
//Atualiza_Integridade_Tabela('PETS', 'RECEITUARIO',                 'VARCHAR(999)',False,False);
//Atualiza_Integridade_Tabela('PETS', 'PETCOD',                      'VARCHAR(10) ',False,False);
//Atualiza_Integridade_Tabela('PETS', 'EMPRESAS',                    'INTEGER     ',False,False);
//Atualiza_Integridade_Tabela('PETS', 'IDADE',                       'VARCHAR(30) ',False,False);
//Atualiza_Integridade_Tabela('PETS', 'IDVETERINARIO',               'INTEGER     ',False,False);
//Atualiza_Integridade_Tabela('PETS', 'VETERINARIO',                 'VARCHAR(30),',False,False);
//
//Atualiza_Integridade_Tabela('GEN_AGENDAPET_ID','CREATE GENERATOR GEN_AGENDAPET_ID' , 'SET GENERATOR GEN_AGENDAPET_ID TO 0',False,True);
//Atualiza_Integridade_Tabela('AGENDASPET','CREATE TABLE AGENDAPET ( '+
//                              'IDAGENDA          INTEGER NOT NULL, '+
//                              'TIMESTART         TIMESTAMP,        '+
//                              'TIMEEND           TIMESTAMP,        '+
//                              'CHAVE             VARCHAR(100),     '+
//                              'OBS               VARCHAR(2000),    '+
//                              'IDCOLABORADOR     INTEGER,          '+
//                              'COLABORADOR       VARCHAR(100),     '+
//                              'IDCLIENTE         VARCHAR(20),      '+
//                              'NOMECLI           VARCHAR(300),     '+
//                              'EMPRESA           INTEGER,          '+
//                              'STATUS            VARCHAR(20),      '+
//                              'CATEGORIA         VARCHAR(50),      '+
//                              'DATACAD           DATE,             '+
//                              'CODIGO            VARCHAR(10),      '+
//                              'RESUMO            VARCHAR(500),     '+
//                              'NORDEM            VARCHAR(20),      '+
//                              'GRUPO             VARCHAR(30),      '+
//                              'DATAALT           DATE,             '+
//                              'IDUNIDADE         INTEGER,          '+
//                              'USUARIO           VARCHAR(50),      '+
//                              'SOLUCAO           VARCHAR(2000),    '+
//                              'SOLICITANTE       VARCHAR(100),     '+
//                              'FONE_SOLICITANTE  VARCHAR(20), ' , '' ,False,False);
//
//Atualiza_Integridade_Tabela('AGENDAPET','IDAGENDA         ','INTEGER NOT NULL    ',False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','TIMESTART        ',' TIMESTAMP,        ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','TIMEEND          ',' TIMESTAMP,        ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','CHAVE            ',' VARCHAR(100),     ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','OBS              ',' VARCHAR(2000),    ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','IDCOLABORADOR    ',' INTEGER,          ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','COLABORADOR      ',' VARCHAR(100),     ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','IDCLIENTE        ',' VARCHAR(20),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','NOMECLI          ',' VARCHAR(300),     ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','EMPRESA          ',' INTEGER,          ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','STATUS           ',' VARCHAR(20),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','CATEGORIA        ',' VARCHAR(50),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','DATACAD          ',' DATE,             ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','CODIGO           ',' VARCHAR(10),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','RESUMO           ',' VARCHAR(500),     ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','NORDEM           ',' VARCHAR(20),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','GRUPO            ',' VARCHAR(30),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','DATAALT          ',' DATE,             ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','IDUNIDADE        ',' INTEGER,          ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','USUARIO          ',' VARCHAR(50),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','SOLUCAO          ',' VARCHAR(2000),    ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','SOLICITANT       ','VARCHAR(100),      ', False, False);
//Atualiza_Integridade_Tabela('AGENDAPET','FONE_SOLICITANTE ',' VARCHAR(20),      ', False, False);
//
//
//
//Atualiza_Integridade_Tabela('GEN_VETERINARIO_ID','CREATE GENERATOR GEN_VETERINARIO_ID', 'SET GENERATOR GEN_VETERINARIO_ID TO 0',False,True);
//Atualiza_Integridade_Tabela('VETERINARIO', 'CREATE TABLE VETERINARIO  ( '+
//                            'ID                        INTEGER    ,  '  +
//                            'NOMEVETERI                VARCHAR(30),  '  +
//                            'ADICIONAL                 VARCHAR(50),  '  +
//                            'COD                       INTEGER    ,  ' ,'', True, False);
//
//
//Atualiza_Integridade_Tabela('VETERINARIO','ID',             'INTERGER', False, False);
//Atualiza_Integridade_Tabela('VETERINARIO','NOMEVETERI ', 'VARCHAR(30)', False, False);
//Atualiza_Integridade_Tabela('VETERINARIO','ADICIONAL',   'VARCHAR(50)', False, False);
//Atualiza_Integridade_Tabela('VETERINARIO','COD',            'INTERGER', False, False);

//
//
//end;
//
//procedure TDM1.DataModuleCreate(Sender: TObject);
//begin
//   //Busca_Integridade_Base_Dados;
//end;


end.
