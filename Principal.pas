unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, Aventura;

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

procedure TfrmPrincipal.btnComenzarClick(Sender: TObject);
begin
  frmAventura.IniciarPartida;
  frmAventura.Show;
  Hide;
end;

procedure TfrmPrincipal.btnSalirClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
