unit Final;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Memo, FMX.Memo.Types;

type
  TfrmFinal = class(TForm)
    lblTituloFinal: TLabel;
    memFinal: TMemo;
    btnReiniciar: TButton;
    btnMenu: TButton;
    procedure btnReiniciarClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
  public
    procedure MostrarFinal(const ATitulo, ATexto: string);
  end;

var
  frmFinal: TfrmFinal;

implementation

{$R *.fmx}

uses Aventura, Principal;

procedure TfrmFinal.MostrarFinal(const ATitulo, ATexto: string);
begin
  lblTituloFinal.Text := ATitulo;
  memFinal.Text := ATexto;
end;

procedure TfrmFinal.btnReiniciarClick(Sender: TObject);
begin
  frmAventura.IniciarAventura;
  frmAventura.Show;
  Hide;
end;

procedure TfrmFinal.btnMenuClick(Sender: TObject);
begin
  frmPrincipal.Show;
  Hide;
end;

end.
