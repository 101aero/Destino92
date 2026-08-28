unit Aventura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Memo, FMX.Memo.Types;

type
  TfrmAventura = class(TForm)
    lblFecha: TLabel;
    lblLugar: TLabel;
    memHistoria: TMemo;
    btnOpcion1: TButton;
    btnOpcion2: TButton;
    lblImagen: TLabel;
    procedure btnOpcion1Click(Sender: TObject);
    procedure btnOpcion2Click(Sender: TObject);
  private
    FEscenaActual: Integer;
    procedure MostrarEscena(Numero: Integer);
    procedure Terminar(const ATitulo, ATexto: string);
  public
    procedure IniciarAventura;
  end;

var
  frmAventura: TfrmAventura;

implementation

{$R *.fmx}

uses Final;

procedure TfrmAventura.IniciarAventura;
begin
  MostrarEscena(1);
end;

procedure TfrmAventura.MostrarEscena(Numero: Integer);
begin
  FEscenaActual := Numero;
  case Numero of
    1: begin
      lblFecha.Text := '24 AGOSTO 2026'; lblLugar.Text := 'MADRID';
      lblImagen.Text := '[DIBUJO: antiguo taller en Madrid]';
      memHistoria.Text := 'Has encontrado las llaves del antiguo taller de tu tio. Dentro, bajo una lona, permanece un automovil espanol de principios de los noventa lleno de modificaciones extranas.';
      btnOpcion1.Text := 'Entrar en el coche'; btnOpcion2.Text := 'Examinar el taller';
    end;
    2: begin
      lblFecha.Text := '24 AGOSTO 2026'; lblLugar.Text := 'MADRID';
      lblImagen.Text := '[DIBUJO: salpicadero y sistema temporal]';
      memHistoria.Text := 'En el salpicadero se enciende una pantalla: DESTINO: 20/04/1992 - SEVILLA. Junto a ella existe un interruptor protegido por una tapa roja.';
      btnOpcion1.Text := 'Activar el sistema'; btnOpcion2.Text := 'Salir del vehiculo';
    end;
    3: begin
      lblFecha.Text := '20 ABRIL 1992'; lblLugar.Text := 'SEVILLA';
      lblImagen.Text := '[DIBUJO: carretera hacia Sevilla, 1992]';
      memHistoria.Text := 'Un destello lo cubre todo. Cuando recuperas la vision, el taller ha desaparecido. Una senal de carretera anuncia Sevilla y la Expo 92. El sistema temporal indica una averia.';
      btnOpcion1.Text := 'Ir hacia la Expo'; btnOpcion2.Text := 'Buscar un taller';
    end;
    4: begin
      lblFecha.Text := '20 ABRIL 1992'; lblLugar.Text := 'SEVILLA';
      lblImagen.Text := '[DIBUJO: taller mecanico de 1992]';
      memHistoria.Text := 'Un mecanico examina el automovil. Puede reparar el sistema, pero necesita un componente electronico que no tiene. Te indica una tienda cercana.';
      btnOpcion1.Text := 'Buscar la pieza'; btnOpcion2.Text := 'Contarle la verdad';
    end;
    5: begin
      lblFecha.Text := '20 ABRIL 1992'; lblLugar.Text := 'EXPO 92';
      lblImagen.Text := '[DIBUJO: ambiente de la Expo 92]';
      memHistoria.Text := 'Entre la multitud observas una fotografia familiar expuesta en un pequeno puesto. La conoces, pero ahora aparece en ella una persona que nunca estuvo alli. Algo ha cambiado.';
      btnOpcion1.Text := 'Investigar la fotografia'; btnOpcion2.Text := 'Ignorarla y buscar la pieza';
    end;
    6: begin
      lblFecha.Text := '20 ABRIL 1992'; lblLugar.Text := 'SEVILLA';
      lblImagen.Text := '[DIBUJO: efecto de alteracion temporal]';
      memHistoria.Text := 'Tus recuerdos comienzan a mezclarse. Comprendes que tu presencia ha alterado un encuentro ocurrido en 1992. Si no lo corriges, regresaras a un futuro diferente.';
      btnOpcion1.Text := 'Corregir el encuentro'; btnOpcion2.Text := 'Aceptar el nuevo futuro';
    end;
    7: begin
      lblFecha.Text := '20 ABRIL 1992'; lblLugar.Text := 'SEVILLA';
      lblImagen.Text := '[DIBUJO: componente electronico]';
      memHistoria.Text := 'Consigues el componente. El mecanico completa la reparacion. El sistema vuelve a mostrar tu fecha de origen: 24/08/2026.';
      btnOpcion1.Text := 'Regresar a 2026'; btnOpcion2.Text := 'Quedarse en 1992';
    end;
    8: begin
      lblFecha.Text := '20 ABRIL 1992'; lblLugar.Text := 'SEVILLA';
      lblImagen.Text := '[DIBUJO: decision temporal]';
      memHistoria.Text := 'Logras impedir el pequeno acontecimiento que habias provocado. La fotografia recupera su aspecto original. La linea temporal parece estable.';
      btnOpcion1.Text := 'Regresar a 2026'; btnOpcion2.Text := 'Investigar un poco mas';
    end;
    9: Terminar('REGRESO A CASA', 'Regresas a Madrid en 2026. El taller continua alli y todo parece normal. Sobre una mesa encuentras una fotografia de Sevilla 92 que antes no existia.');
    10: Terminar('UN FUTURO DIFERENTE', 'Regresas a 2026, pero Madrid no es exactamente como lo recuerdas. Tus decisiones de 1992 han creado una nueva linea temporal.');
    11: Terminar('1992', 'Decides no regresar. El automovil queda oculto y comienza una vida completamente nueva en la Espana de 1992.');
    12: Terminar('ATRAPADO EN EL TIEMPO', 'Investigas demasiado y el sistema vuelve a fallar. La aventura termina, por ahora, en 1992.');
  end;
end;

procedure TfrmAventura.Terminar(const ATitulo, ATexto: string);
begin
  frmFinal.MostrarFinal(ATitulo, ATexto);
  frmFinal.Show;
  Hide;
end;

procedure TfrmAventura.btnOpcion1Click(Sender: TObject);
begin
  case FEscenaActual of
    1: MostrarEscena(2); 2: MostrarEscena(3); 3: MostrarEscena(5);
    4: MostrarEscena(7); 5: MostrarEscena(6); 6: MostrarEscena(8);
    7: MostrarEscena(9); 8: MostrarEscena(9);
  end;
end;

procedure TfrmAventura.btnOpcion2Click(Sender: TObject);
begin
  case FEscenaActual of
    1: MostrarEscena(2); 2: MostrarEscena(1); 3: MostrarEscena(4);
    4: MostrarEscena(7); 5: MostrarEscena(7); 6: MostrarEscena(10);
    7: MostrarEscena(11); 8: MostrarEscena(12);
  end;
end;

end.
