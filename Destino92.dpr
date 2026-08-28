program Destino92;

uses
  System.StartUpCopy,
  FMX.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  Aventura in 'Aventura.pas' {frmAventura},
  Final in 'Final.pas' {frmFinal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAventura, frmAventura);
  Application.CreateForm(TfrmFinal, frmFinal);
  Application.Run;
end.
