# tp-ca
TP Computación Aplicada Cuatrimestre-1-2025

## Avances

### ✔️ 1. Preparación del entorno de trabajo

- Se descargaron todas las partes de la máquina virtual Debian personalizada provista por la cátedra (TPVMCA.part01.rar a TPVMCA.part07.rar).
- Se creó un script en PowerShell (`extraer-vm.ps1`) para verificar la presencia de todas las partes, validar la existencia de WinRAR y automatizar la extracción del contenido.
- El script fue ejecutado correctamente desde Windows Terminal, extrayendo la imagen de la máquina virtual sin errores.
- Se importó la imagen extraída en Oracle VirtualBox y se resolvieron problemas de red relacionados con una interfaz inexistente.
- Se logró iniciar la máquina virtual correctamente.

### ✔️ 2. Acceso y configuración inicial del sistema Debian

- Se accedió al menú GRUB modificando su arranque temporal para ingresar como `root` utilizando el modo `init=/bin/bash`.
- Desde esa sesión, se montó el sistema de archivos en modo escritura y se blanqueó la contraseña del usuario `root`.
- La nueva clave establecida para root es `palermo`, según lo requerido por las consignas del TP.
- Se configuró el nombre de host (`hostname`) del sistema a `TPServer` utilizando el comando `hostnamectl set-hostname TPServer`.
- Se ajustó la configuración del teclado para que coincida con el hardware físico, facilitando la interacción con el sistema.

### 🖥️ 3. Configuración de servicios y herramientas esenciales

- Se verificó e instaló `sudo` para la gestión de permisos administrativos.
- Se instaló `net-tools` para disponer de herramientas de red como `ifconfig`.
- Se instaló `vim` como editor de texto para la edición de archivos de configuración.
- Se instaló `openssh-server` para permitir conexiones remotas al servidor.

### ✔️ 4. Configuración del servicio SSH

- Se activó y habilitó el servicio SSH mediante `systemctl start ssh` y `systemctl enable ssh`.
- Se generó un par de claves RSA de prueba en el sistema host utilizando `ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_tp_root`.
- Se configuró el archivo `/root/.ssh/authorized_keys` con la clave pública generada, y se aseguraron los permisos correctos.
- Se ajustó el archivo de configuración `/etc/ssh/sshd_config` estableciendo explícitamente:
  ```
  PermitRootLogin prohibit-password
  PubkeyAuthentication yes
  ```
- El acceso al usuario `root` mediante contraseña fue deshabilitado, permitiendo exclusivamente autenticación con clave pública, como exige el Trabajo Práctico Integrador.
- Se probó el acceso desde el host con:
  ```
  ssh -i ~/.ssh/id_tp_root -p 2222 root@127.0.0.1
  ```
  confirmando el acceso exitoso sin uso de contraseña.

> En caso de recibir la clave oficial proporcionada por la cátedra, bastará con reemplazar el contenido del archivo `authorized_keys`.

> Instalación de Apache de acuerdo a la docuementación actual (6/5/2025) [aquí](https://www.php.net/manual/en/install.unix.debian.php):
```
apt install php-common libapache2-mod-php php-cli
``` 

