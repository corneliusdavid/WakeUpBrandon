program WakeUpBrandon;

uses
  Forms,
  ufrmWakeUpBrandon in 'ufrmWakeUpBrandon.pas' {frmWakeUpBrandon};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmWakeUpBrandon, frmWakeUpBrandon);
  Application.Run;
end.
