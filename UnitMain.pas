unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, System.UITypes;

type
  TfrmMain = class(TForm)
    fdConn: TFDConnection;
    dbContatos: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnNew: TButton;
    btnSave: TButton;
    btnDelete: TButton;
    btnCancel: TButton;
    btnClose: TButton;
    dbObservations: TDBMemo;
    dbName: TDBEdit;
    dbEmail: TDBEdit;
    dbPhone: TDBEdit;
    qryContatos: TFDQuery;
    dsContatos: TDataSource;
    qryContatosID: TIntegerField;
    qryContatosNOME: TStringField;
    qryContatosEMAIL: TStringField;
    qryContatosTELEFONE: TStringField;
    qryContatosOBSERVACOES: TMemoField;
    procedure btnNewClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dsContatosDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  qryContatos.Cancel;
  dbContatos.SetFocus;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
var
  CanClose: Boolean;
begin
  CanClose := MessageDlg('Tem certeza que deseja sair?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  if CanClose then
    Close;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
var
  CanDelete: Boolean;
begin
  CanDelete := MessageDlg('Tem certeza que deseja excluir?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  if CanDelete then
    qryContatos.Delete;
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
  qryContatos.Append;
  dbName.SetFocus;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
begin
  if Trim(dbName.Text) = '' then
  begin
    MessageDlg('O nome é obrigatório.', mtWarning, [mbOk], 0);
    dbName.SetFocus;
    Exit;
  end;
  
  try
    qryContatos.Post;
    MessageDlg('Contato salvo com sucesso!', mtInformation, [mbOk], 0);
  except
    on E: Exception do
      MessageDlg('Não foi possível salvar o registro: ' + E.Message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmMain.dsContatosDataChange(Sender: TObject; Field: TField);
begin
  btnSave.Enabled := qryContatos.State in dsEditModes;
  btnCancel.Enabled := qryContatos.State in dsEditModes;
  btnDelete.Enabled := not qryContatos.IsEmpty and not (qryContatos.State in dsEditModes);
end;

end.
