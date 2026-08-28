unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TfrmPrincipal = class(TForm)
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    btnComenzar: TButton;
    btnSalir: TButton;
    procedure btnComenzarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Aventura;

procedure TfrmPrincipal.btnComenzarClick(Sender: TObject);
begin
  frmAventura.IniciarAventura;
  frmAventura.Show;
  Hide;
end;

procedure TfrmPrincipal.btnSalirClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
