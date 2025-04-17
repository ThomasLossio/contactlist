unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    fdConn: TFDConnection;
    DBGrid1: TDBGrid;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  qryContatos.Cancel;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  qryContatos.Delete;
end;

procedure TForm1.btnNewClick(Sender: TObject);
begin
  qryContatos.Append;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
begin
  qryContatos.Post;
end;

end.
