#!/bin/bash

# Función de ayuda
function show_help() {
  echo "Uso: $0 <origen> <destino>"
  echo "Ejemplo: $0 /var/log /backup_dir"
  echo "El backup se guardará como <nombre_directorio>_bkp_YYYYMMDD.tar.gz"
  exit 0
}

# Validar -help
if [[ "$1" == "-h" || "$1" == "-help" || "$1" == "--help" ]]; then
  show_help
fi

# Validar argumentos
if [[ -z "$1" || -z "$2" ]]; then
  echo "Error: Faltan argumentos."
  show_help
fi

ORIGEN="$1"
DESTINO="$2"

# Validar que los directorios existan
if [[ ! -d "$ORIGEN" ]]; then
  echo "Error: El directorio de origen '$ORIGEN' no existe."
  exit 1
fi

if [[ ! -d "$DESTINO" ]]; then
  echo "Error: El directorio de destino '$DESTINO' no existe."
  exit 1
fi

# Obtener nombre y fecha
DIR_NAME=$(basename "$ORIGEN")
FECHA=$(date +%Y%m%d)
ARCHIVO="${DIR_NAME}_bkp_${FECHA}.tar.gz"

# Ejecutar backup
tar -czf "$DESTINO/$ARCHIVO" "$ORIGEN" 2>/dev/null

# Validar resultado
if [[ $? -eq 0 ]]; then
  echo "Backup completado: $DESTINO/$ARCHIVO"
else
  echo "Error al crear el backup."
  exit 1
fi

exit 0