unit Aventura;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Memo, FMX.ScrollBox, FMX.ListBox;

type
  TfrmAventura = class(TForm)
    lblLugar: TLabel;
    lblFecha: TLabel;
    lblEscena: TLabel;
    memHistoria: TMemo;
    btnOpcion1: TButton;
    btnOpcion2: TButton;
    btnOpcion3: TButton;
    lblInventario: TLabel;
    lstInventario: TListBox;
    btnMenu: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOpcion1Click(Sender: TObject);
    procedure btnOpcion2Click(Sender: TObject);
    procedure btnOpcion3Click(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
  private
    FEscenaActual: Integer;
    FOpcion1Destino: Integer;
    FOpcion2Destino: Integer;
    FOpcion3Destino: Integer;
    FTieneLlaveMetalica: Boolean;
    FTienePeriodico1992: Boolean;
    FTieneDestornillador: Boolean;
    FTieneFotoAntigua: Boolean;
    FTieneFusible: Boolean;
    FCajaAbierta: Boolean;
    FConoce1962: Boolean;
    procedure MostrarEscena(Numero: Integer);
    procedure ConfigurarOpcion(Boton: TButton; const Texto: string; Destino: Integer);
    procedure IrAEscena(Destino: Integer);
    procedure ActualizarInventario;
    procedure MostrarFinal(const Titulo, Texto: string);
  public
    procedure IniciarPartida;
  end;

var
  frmAventura: TfrmAventura;

implementation

uses Principal, Final;

{$R *.fmx}

procedure TfrmAventura.FormCreate(Sender: TObject);
begin
  IniciarPartida;
end;

procedure TfrmAventura.IniciarPartida;
begin
  FEscenaActual := 1;
  FTieneLlaveMetalica := False;
  FTienePeriodico1992 := False;
  FTieneDestornillador := False;
  FTieneFotoAntigua := False;
  FTieneFusible := False;
  FCajaAbierta := False;
  FConoce1962 := False;
  ActualizarInventario;
  MostrarEscena(1);
end;

procedure TfrmAventura.ConfigurarOpcion(Boton: TButton; const Texto: string; Destino: Integer);
begin
  Boton.Text := Texto;
  Boton.Visible := Texto <> '';
  Boton.Enabled := Texto <> '';
  if Boton = btnOpcion1 then FOpcion1Destino := Destino
  else if Boton = btnOpcion2 then FOpcion2Destino := Destino
  else if Boton = btnOpcion3 then FOpcion3Destino := Destino;
end;

procedure TfrmAventura.ActualizarInventario;
begin
  lstInventario.Clear;
  if FTieneLlaveMetalica then lstInventario.Items.Add('Llave metalica');
  if FTieneDestornillador then lstInventario.Items.Add('Destornillador');
  if FTienePeriodico1992 then lstInventario.Items.Add('Periodico 1992');
  if FTieneFotoAntigua then lstInventario.Items.Add('Foto antigua');
  if FTieneFusible then lstInventario.Items.Add('Fusible');
end;

procedure TfrmAventura.MostrarEscena(Numero: Integer);
begin
  FEscenaActual := Numero;
  btnOpcion1.Visible := False;
  btnOpcion2.Visible := False;
  btnOpcion3.Visible := False;
  lblEscena.Text := 'ESCENA ' + Numero.ToString;

  case Numero of
    1:
      begin
        lblLugar.Text := 'MARBELLA';
        lblFecha.Text := '2026';
        memHistoria.Text :=
          'Encuentras un anuncio de un SEAT 600 antiguo a un precio demasiado bueno.' + sLineBreak +
          'El vendedor insiste en que tienes que verlo personalmente.' + sLineBreak + sLineBreak +
          'En una casa antigua te recibe Emilio, un hombre de mas de ochenta anos.' + sLineBreak + sLineBreak +
          'EMILIO: Asi que tu eres el del coche.' + sLineBreak +
          'PROTAGONISTA: Si. Si sigue en venta.' + sLineBreak +
          'EMILIO: En venta sigue. Lo que no se es si te lo voy a vender a ti.';
        ConfigurarOpcion(btnOpcion1, 'Que tiene de especial?', 2);
        ConfigurarOpcion(btnOpcion2, 'Por que lo vende?', 3);
        ConfigurarOpcion(btnOpcion3, 'Examinar el coche', 4);
      end;

    2:
      begin
        lblLugar.Text := 'CASA DE EMILIO';
        lblFecha.Text := '2026';
        memHistoria.Text :=
          'PROTAGONISTA: Que tiene de especial?' + sLineBreak +
          'EMILIO: Nada. Es un SEAT 600 viejo.' + sLineBreak + sLineBreak +
          'Emilio mira el coche.' + sLineBreak +
          'EMILIO: Y sera mejor que siga siendo solo eso.';
        ConfigurarOpcion(btnOpcion1, 'Examinar el coche', 4);
        ConfigurarOpcion(btnOpcion2, 'Preguntar por Emilio', 3);
        ConfigurarOpcion(btnOpcion3, 'Cerrar la compra', 5);
      end;

    3:
      begin
        lblLugar.Text := 'CASA DE EMILIO';
        lblFecha.Text := '2026';
        memHistoria.Text :=
          'PROTAGONISTA: Por que lo vende?' + sLineBreak +
          'EMILIO: Porque ya no tengo edad para ciertas cosas.' + sLineBreak +
          'PROTAGONISTA: Para conducir?' + sLineBreak +
          'EMILIO: Para equivocarme otra vez.';
        ConfigurarOpcion(btnOpcion1, 'Examinar el coche', 4);
        ConfigurarOpcion(btnOpcion2, 'Cerrar la compra', 5);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    4:
      begin
        lblLugar.Text := 'GARAGE DE EMILIO';
        lblFecha.Text := '2026';
        if not FTieneDestornillador then
        begin
          FTieneDestornillador := True;
          memHistoria.Text :=
            'El 600 parece original salvo por una caja metalica debajo del salpicadero.' + sLineBreak +
            'Encuentras un destornillador en la guantera y lo guardas.' + sLineBreak + sLineBreak +
            'PROTAGONISTA: Esto no parece original.' + sLineBreak +
            'EMILIO: No lo es.' + sLineBreak +
            'PROTAGONISTA: Que hace?' + sLineBreak +
            'EMILIO: Ahora mismo, nada.';
        end
        else
          memHistoria.Text := 'La caja metalica sigue siendo el elemento mas raro del coche.';
        ConfigurarOpcion(btnOpcion1, 'Examinar la caja', 6);
        ConfigurarOpcion(btnOpcion2, 'Cerrar la compra', 5);
        ConfigurarOpcion(btnOpcion3, 'Hablar con Emilio', 3);
      end;

    5:
      begin
        lblLugar.Text := 'CASA DE EMILIO';
        lblFecha.Text := '2026';
        FTieneLlaveMetalica := True;
        memHistoria.Text :=
          'La compra queda cerrada. Emilio te entrega las llaves y otra pequena llave metalica.' + sLineBreak + sLineBreak +
          'EMILIO: Esta no es de las puertas.' + sLineBreak +
          'PROTAGONISTA: Entonces de que es?' + sLineBreak +
          'EMILIO: Cuando encuentres donde encaja, probablemente ya sera demasiado tarde para preguntarmelo.' + sLineBreak + sLineBreak +
          'Antes de marcharte te avisa:' + sLineBreak +
          'EMILIO: Si esta noche hay tormenta, deja el coche aparcado.' + sLineBreak +
          'PROTAGONISTA: Por los rayos?' + sLineBreak +
          'EMILIO: Por lo que ocurre despues.';
        ConfigurarOpcion(btnOpcion1, 'Salir con el coche', 7);
        ConfigurarOpcion(btnOpcion2, 'Examinar la caja', 6);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    6:
      begin
        lblLugar.Text := 'GARAGE DE EMILIO';
        lblFecha.Text := '2026';
        if FTieneLlaveMetalica and not FCajaAbierta then
        begin
          FCajaAbierta := True;
          memHistoria.Text :=
            'La llave metalica abre la caja del salpicadero.' + sLineBreak +
            'Dentro hay un selector con tres marcas desgastadas: 62, 92 y 26.' + sLineBreak + sLineBreak +
            'EMILIO: Te dije que era mejor no tocar eso.';
        end
        else
          memHistoria.Text := 'La caja contiene un selector extrano. Emilio no quiere explicarlo.';
        ConfigurarOpcion(btnOpcion1, 'Cerrar la caja y marcharse', 7);
        ConfigurarOpcion(btnOpcion2, 'Preguntar por los numeros', 5);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    7:
      begin
        lblLugar.Text := 'MARBELLA';
        lblFecha.Text := '2026 - TARDE';
        memHistoria.Text :=
          'Conduces el 600 por Marbella. Empieza a llover.' + sLineBreak + sLineBreak +
          'RADIO: Se mantiene el aviso por fuertes tormentas en la Costa del Sol...' + sLineBreak + sLineBreak +
          'Entre interferencias aparece una voz antigua:' + sLineBreak +
          'RADIO: ...veintitres horas... Radio Juventud...';
        ConfigurarOpcion(btnOpcion1, 'Sintonizar la radio', 8);
        ConfigurarOpcion(btnOpcion2, 'Examinar la caja', 9);
        ConfigurarOpcion(btnOpcion3, 'Volver a casa', 10);
      end;

    8:
      begin
        lblLugar.Text := 'MARBELLA - EN MARCHA';
        lblFecha.Text := '2026';
        memHistoria.Text :=
          'Por unos segundos escuchas una emisora imposible.' + sLineBreak + sLineBreak +
          'RADIO: Marbella, agosto de mil novecientos noventa y dos...' + sLineBreak +
          'La senal desaparece.';
        ConfigurarOpcion(btnOpcion1, 'Examinar la caja', 9);
        ConfigurarOpcion(btnOpcion2, 'Seguir conduciendo', 10);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    9:
      begin
        lblLugar.Text := 'INTERIOR DEL SEAT 600';
        lblFecha.Text := '2026';
        memHistoria.Text :=
          'La caja se ha activado sola. Ahora se leen tres fechas:' + sLineBreak +
          '1962' + sLineBreak + '1992' + sLineBreak + '2026' + sLineBreak + sLineBreak +
          'La posicion 1992 emite una luz debil.';
        ConfigurarOpcion(btnOpcion1, 'Tocar 1992', 11);
        ConfigurarOpcion(btnOpcion2, 'No tocar nada', 10);
        ConfigurarOpcion(btnOpcion3, 'Cerrar la caja', 10);
      end;

    10:
      begin
        lblLugar.Text := 'CARRETERA DE MARBELLA';
        lblFecha.Text := '2026 - NOCHE';
        memHistoria.Text :=
          'La tormenta se vuelve brutal. Un rayo cae muy cerca y el motor se para.' + sLineBreak +
          'La caja del salpicadero se enciende y 1992 empieza a parpadear.' + sLineBreak + sLineBreak +
          'PROTAGONISTA: Vamos... ahora no.';
        ConfigurarOpcion(btnOpcion1, 'Intentar arrancar', 11);
        ConfigurarOpcion(btnOpcion2, 'Salir del coche', 12);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    11:
      begin
        lblLugar.Text := 'CARRETERA DE MARBELLA';
        lblFecha.Text := '???';
        memHistoria.Text :=
          'El motor arranca. Otro rayo ilumina toda la carretera.' + sLineBreak +
          'Las agujas giran sin control. Durante un instante no ves nada.' + sLineBreak + sLineBreak +
          'Despues, silencio. La tormenta ha desaparecido.';
        ConfigurarOpcion(btnOpcion1, 'Seguir conduciendo', 13);
        ConfigurarOpcion(btnOpcion2, 'Detener el coche', 13);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    12:
      begin
        lblLugar.Text := 'ARCEN';
        lblFecha.Text := '2026';
        memHistoria.Text :=
          'Sales un instante, pero una descarga cae tan cerca que vuelves al coche.' + sLineBreak +
          'La caja se activa antes de que puedas hacer nada.';
        ConfigurarOpcion(btnOpcion1, 'Volver al volante', 11);
        ConfigurarOpcion(btnOpcion2, '', 0);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    13:
      begin
        lblLugar.Text := 'MARBELLA';
        lblFecha.Text := '1992';
        memHistoria.Text :=
          'Faltan edificios modernos, las farolas son distintas y todos los coches parecen antiguos.' + sLineBreak +
          'En un kiosco ves un periodico con fecha de agosto de 1992.' + sLineBreak + sLineBreak +
          'PROTAGONISTA: Emilio...';
        ConfigurarOpcion(btnOpcion1, 'Coger el periodico', 14);
        ConfigurarOpcion(btnOpcion2, 'Buscar un telefono', 15);
        ConfigurarOpcion(btnOpcion3, 'Revisar el SEAT 600', 16);
      end;

    14:
      begin
        lblLugar.Text := 'MARBELLA';
        lblFecha.Text := '1992';
        FTienePeriodico1992 := True;
        memHistoria.Text :=
          'Guardas el periodico. En una noticia local aparece una fotografia de un joven junto a un taller.' + sLineBreak +
          'El rostro te resulta familiar.';
        ConfigurarOpcion(btnOpcion1, 'Examinar la fotografia', 17);
        ConfigurarOpcion(btnOpcion2, 'Buscar el taller', 18);
        ConfigurarOpcion(btnOpcion3, 'Volver al coche', 16);
      end;

    15:
      begin
        lblLugar.Text := 'CABINA TELEFONICA';
        lblFecha.Text := '1992';
        memHistoria.Text :=
          'Intentas llamar al numero de Emilio, pero ese numero todavia no existe.' + sLineBreak +
          'Un hombre observa el 600 y comenta que su padre tuvo uno parecido.';
        ConfigurarOpcion(btnOpcion1, 'Preguntar por talleres antiguos', 18);
        ConfigurarOpcion(btnOpcion2, 'Volver al coche', 16);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    16:
      begin
        lblLugar.Text := 'INTERIOR DEL SEAT 600';
        lblFecha.Text := '1992';
        memHistoria.Text :=
          'El selector muestra 1962, 1992 y 2026. La posicion 2026 no responde.' + sLineBreak +
          'Debajo de la caja hay una tapa sujeta por dos tornillos.';
        if FTieneDestornillador then
          ConfigurarOpcion(btnOpcion1, 'Usar destornillador', 19)
        else
          ConfigurarOpcion(btnOpcion1, 'Buscar una herramienta', 18);
        ConfigurarOpcion(btnOpcion2, 'Buscar informacion', 18);
        ConfigurarOpcion(btnOpcion3, 'Probar 1962', 23);
      end;

    17:
      begin
        lblLugar.Text := 'KIOSCO';
        lblFecha.Text := '1992';
        FTieneFotoAntigua := True;
        FConoce1962 := True;
        memHistoria.Text :=
          'La fotografia muestra a un joven Emilio en 1962, delante del mismo SEAT 600.' + sLineBreak +
          'El pie de foto menciona un pequeno taller de Marbella.';
        ConfigurarOpcion(btnOpcion1, 'Buscar el antiguo taller', 18);
        ConfigurarOpcion(btnOpcion2, 'Volver al coche', 16);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    18:
      begin
        lblLugar.Text := 'TALLER DE MARBELLA';
        lblFecha.Text := '1992';
        memHistoria.Text :=
          'El antiguo taller ahora funciona como almacen de electronica.' + sLineBreak +
          'El encargado reconoce una pieza del sistema del coche.' + sLineBreak +
          'ENCARGADO: Podria arreglarse si consigues un fusible de este tipo.';
        ConfigurarOpcion(btnOpcion1, 'Buscar el fusible', 20);
        ConfigurarOpcion(btnOpcion2, 'Preguntar por Emilio', 21);
        ConfigurarOpcion(btnOpcion3, 'Volver al coche', 16);
      end;

    19:
      begin
        lblLugar.Text := 'INTERIOR DEL SEAT 600';
        lblFecha.Text := '1992';
        FConoce1962 := True;
        memHistoria.Text :=
          'Retiras la tapa con el destornillador.' + sLineBreak +
          'Hay un alojamiento vacio para un fusible especial.' + sLineBreak +
          'Una nota dice: NO FORZAR REGRESO SIN FUSIBLE. E. 1962';
        if FTieneFusible then
          ConfigurarOpcion(btnOpcion1, 'Instalar el fusible', 22)
        else
          ConfigurarOpcion(btnOpcion1, 'Buscar el fusible', 20);
        ConfigurarOpcion(btnOpcion2, 'Probar 1962', 23);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    20:
      begin
        lblLugar.Text := 'TIENDA DE ELECTRONICA';
        lblFecha.Text := '1992';
        FTieneFusible := True;
        memHistoria.Text :=
          'El dependiente encuentra un fusible compatible.' + sLineBreak + sLineBreak +
          'OBJETO CONSEGUIDO: FUSIBLE';
        ConfigurarOpcion(btnOpcion1, 'Volver al SEAT 600', 19);
        ConfigurarOpcion(btnOpcion2, 'Preguntar por Emilio', 21);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    21:
      begin
        lblLugar.Text := 'TALLER DE MARBELLA';
        lblFecha.Text := '1992';
        FConoce1962 := True;
        memHistoria.Text :=
          'ENCARGADO: Emilio venia por aqui hace unos treinta anos buscando componentes raros.' + sLineBreak +
          'Treinta anos antes de 1992.' + sLineBreak +
          '1962.';
        ConfigurarOpcion(btnOpcion1, 'Volver al coche', 19);
        ConfigurarOpcion(btnOpcion2, 'Investigar 1962', 23);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    22:
      begin
        lblLugar.Text := 'SEAT 600';
        lblFecha.Text := '1992';
        memHistoria.Text :=
          'Instalas el fusible. 2026 vuelve a iluminarse, pero 1962 tambien permanece activa.' + sLineBreak +
          'Puedes regresar o descubrir que ocurrio treinta anos antes.';
        ConfigurarOpcion(btnOpcion1, 'Regresar a 2026', 24);
        ConfigurarOpcion(btnOpcion2, 'Viajar a 1962', 23);
        ConfigurarOpcion(btnOpcion3, 'Seguir en 1992', 18);
      end;

    23:
      begin
        lblLugar.Text := 'MARBELLA';
        lblFecha.Text := '1962';
        FConoce1962 := True;
        memHistoria.Text :=
          'El salto termina en una Marbella muy distinta.' + sLineBreak +
          'A lo lejos hay un pequeno taller. En la puerta ves al joven de la fotografia.' + sLineBreak + sLineBreak +
          'Es Emilio.';
        ConfigurarOpcion(btnOpcion1, 'Acercarse a Emilio', 25);
        ConfigurarOpcion(btnOpcion2, 'Observar sin intervenir', 26);
        ConfigurarOpcion(btnOpcion3, 'Regresar al coche', 22);
      end;

    24:
      begin
        MostrarFinal('FINAL PROVISIONAL - REGRESO',
          'Regresas a 2026 sin descubrir por que Emilio modifico el SEAT 600.' + sLineBreak +
          'Sabes que 1962 sigue esperando.');
        Exit;
      end;

    25:
      begin
        lblLugar.Text := 'TALLER';
        lblFecha.Text := '1962';
        memHistoria.Text :=
          'EMILIO JOVEN: Ese coche...' + sLineBreak +
          'PROTAGONISTA: Es complicado.' + sLineBreak +
          'EMILIO JOVEN: No. Lo complicado es que todavia no lo he terminado.';
        ConfigurarOpcion(btnOpcion1, 'Preguntar quien lo construye', 27);
        ConfigurarOpcion(btnOpcion2, 'Mostrar la foto de 1992', 28);
        ConfigurarOpcion(btnOpcion3, 'No contarle el futuro', 26);
      end;

    26:
      begin
        lblLugar.Text := 'MARBELLA';
        lblFecha.Text := '1962';
        memHistoria.Text :=
          'Observas a Emilio trabajando con piezas de radio, relojes y componentes electricos.' + sLineBreak +
          'Sobre una mesa hay un cuaderno con esquemas.';
        ConfigurarOpcion(btnOpcion1, 'Examinar el cuaderno', 27);
        ConfigurarOpcion(btnOpcion2, 'Hablar con Emilio', 25);
        ConfigurarOpcion(btnOpcion3, 'Volver al coche', 22);
      end;

    27:
      begin
        lblLugar.Text := 'TALLER';
        lblFecha.Text := '1962';
        memHistoria.Text :=
          'Los esquemas describen un dispositivo que utiliza descargas electricas para producir una alteracion temporal.' + sLineBreak +
          'En la portada Emilio ha escrito:' + sLineBreak + sLineBreak +
          'SI FUNCIONA, NO DEBE CAER EN MANOS DE NADIE. NI SIQUIERA EN LAS MIAS.';
        ConfigurarOpcion(btnOpcion1, 'Preguntar por el proyecto', 28);
        ConfigurarOpcion(btnOpcion2, 'Volver a 1992', 22);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    28:
      begin
        lblLugar.Text := 'TALLER';
        lblFecha.Text := '1962';
        memHistoria.Text :=
          'Emilio comprende que vienes del futuro.' + sLineBreak +
          'EMILIO JOVEN: Entonces funciono.' + sLineBreak +
          'PROTAGONISTA: Sesenta y cuatro anos despues me lo vendes tu mismo.' + sLineBreak +
          'EMILIO JOVEN: Entonces algo sale mal.' + sLineBreak +
          'PROTAGONISTA: Por que?' + sLineBreak +
          'EMILIO JOVEN: Porque jure que destruiria este coche antes de 1963.';
        ConfigurarOpcion(btnOpcion1, 'Continuar investigando', 29);
        ConfigurarOpcion(btnOpcion2, 'Volver a 1992', 22);
        ConfigurarOpcion(btnOpcion3, '', 0);
      end;

    29:
      begin
        MostrarFinal('FIN DEL PROLOGO',
          'Quedan establecidos los tres tiempos: 1962, 1992 y 2026.' + sLineBreak +
          'El siguiente bloque desarrolla puzles temporales entre las tres epocas.');
        Exit;
      end;
  end;

  ActualizarInventario;
end;

procedure TfrmAventura.IrAEscena(Destino: Integer);
begin
  if Destino > 0 then MostrarEscena(Destino);
end;

procedure TfrmAventura.btnOpcion1Click(Sender: TObject);
begin
  IrAEscena(FOpcion1Destino);
end;

procedure TfrmAventura.btnOpcion2Click(Sender: TObject);
begin
  IrAEscena(FOpcion2Destino);
end;

procedure TfrmAventura.btnOpcion3Click(Sender: TObject);
begin
  IrAEscena(FOpcion3Destino);
end;

procedure TfrmAventura.btnMenuClick(Sender: TObject);
begin
  Hide;
  frmPrincipal.Show;
end;

procedure TfrmAventura.MostrarFinal(const Titulo, Texto: string);
begin
  frmFinal.lblTituloFinal.Text := Titulo;
  frmFinal.memFinal.Text := Texto;
  frmFinal.Show;
  Hide;
end;

end.
