program ContactList;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {TfrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTfrmMain, TfrmMain);
  Application.Run;
end.
