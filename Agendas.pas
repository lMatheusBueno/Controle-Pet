unit Agendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sMemo, sEdit,
  Vcl.ExtCtrls, sPanel, Vcl.DBCtrls, sDBMemo, acPageScroller, Vcl.Buttons,
  sBitBtn, Vcl.ComCtrls, sDBComboBox, Vcl.Mask, sDBEdit, sBevel, Data.DB;

type
  TAgendasForm = class(TForm)
    sPanel1: TsPanel;
    sDBMemo1: TsDBMemo;
    sDBMemo2: TsDBMemo;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sDBEdit1: TsDBEdit;
    sDBEdit2: TsDBEdit;
    sDBEdit3: TsDBEdit;
    sDBEdit4: TsDBEdit;
    sDBEdit5: TsDBEdit;
    sDBEdit6: TsDBEdit;
    sDBEdit7: TsDBEdit;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sDBComboBox1: TsDBComboBox;
    sDBComboBox2: TsDBComboBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sBitBtn5: TsBitBtn;
    sBitBtn6: TsBitBtn;
    sBitBtn7: TsBitBtn;
    DsAgenda: TDataSource;
    procedure sBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AgendasForm: TAgendasForm;

implementation

{$R *.dfm}

uses Principal;

procedure TAgendasForm.sBitBtn2Click(Sender: TObject);
begin
Close;
end;

end.
