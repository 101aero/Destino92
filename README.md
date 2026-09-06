# Destino 92

**Destino 92** es una aventura desarrollada con **Delphi / Object Pascal y FireMonkey (FMX)**, pensada para funcionar tanto en Windows como en dispositivos Android.

El proyecto combina exploracion, dialogos, objetos e inventario con una historia de viajes en el tiempo ambientada en Espana.

## Estado actual

El proyecto ya dispone de una primera version funcional con:

- Interfaz FireMonkey.
- Sistema de escenas y decisiones.
- Inventario.
- Historia ambientada inicialmente en Marbella.
- Compilacion para Windows.
- Soporte para Android 64-bit.
- Generacion del APK desde Delphi.
- Instalacion y ejecucion comprobadas en un dispositivo Android real.

## Android

El proyecto ha sido probado desde **Delphi 12** compilando para:

`Android 64-bit`

La aplicacion se ha instalado y ejecutado correctamente en una tablet Android mediante USB.

Para evitar un error durante la generacion del manifiesto Android, en la configuracion utilizada se establecieron estos valores:

```text
Output directory:
.\$(Platform)\$(Config)

Unit output directory:
.\$(Platform)\$(Config)
```

Ruta en Delphi:

`Project -> Options -> Building -> Delphi Compiler`

## Tecnologias

- Delphi 12
- Object Pascal
- FireMonkey (FMX)
- Android 64-bit
- Windows
- Git / GitHub

## Objetivo del proyecto

Destino 92 sirve como proyecto practico para seguir desarrollando conocimientos de Delphi y FireMonkey, incorporando progresivamente una estructura mas cercana a una aventura grafica:

- exploracion de escenarios;
- objetos interactivos;
- inventario;
- conversaciones;
- puzles;
- decisiones del jugador;
- diferentes epocas conectadas entre si.

El desarrollo continuara de forma incremental, manteniendo versiones funcionales tanto para Windows como para Android.

## Guia: desarrollar para Android con Delphi

He documentado el proceso para preparar Delphi, conectar un dispositivo Android y ejecutar una primera aplicacion directamente en un telefono o tablet:

https://informatoli.org/desarrollar-app-para-android-desde-delphi/

---

**InformatOLI — Desarrollo de software y ciberseguridad desde 1996**
