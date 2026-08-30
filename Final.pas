unit Final;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Memo, FMX.ScrollBox;

type
  TfrmFinal = class(TForm)
    lblTituloFinal: TLabel;
    memFinal: TMemo;
    btnReiniciar: TButton;
    btnMenu: TButton;
    procedure btnReiniciarClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
  end;

var
  frmFinal: TfrmFinal;

implementation

uses Principal, Aventura;

{$R *.fmx}

procedure TfrmFinal.btnReiniciarClick(Sender: TObject);
begin
  frmAventura.IniciarPartida;
  frmAventura.Show;
  Hide;
end;

procedure TfrmFinal.btnMenuClick(Sender: TObject);
begin
  frmPrincipal.Show;
  Hide;
end;

end.
