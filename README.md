# tp-ca
TP Computación Aplicada Cuatrimestre-1-2025

## Avances

### ✔️ 1. Preparación del entorno de trabajo

- Se descargaron todas las partes de la máquina virtual Debian personalizada provista por la cátedra (TPVMCA.part01.rar a TPVMCA.part07.rar).
- Se creó un script en PowerShell (`extraer-vm.ps1`) para verificar la presencia de todas las partes, validar la existencia de WinRAR, y automatizar la extracción del contenido.
- El script fue ejecutado correctamente desde Windows Terminal, extrayendo la imagen de la máquina virtual sin errores.
- Se importó la imagen extraída en Oracle VirtualBox y se resolvieron problemas de red relacionados con una interfaz inexistente.
- Se logró iniciar la máquina virtual correctamente.

### ✔️ 2. Acceso y configuración inicial del sistema Debian

- Se accedió al menú GRUB modificando su arranque temporal para ingresar como `root` utilizando el modo `init=/bin/bash`.
- Desde esa sesión, se montó el sistema de archivos en modo escritura y se blanqueó la contraseña del usuario `root`.
- La nueva clave establecida para root es `palermo`, según lo requerido por las consignas del TP.
