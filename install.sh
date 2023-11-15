#!/bin/bash

# Solicitar información al usuario
read -p "Ingrese el nombre: " nombre
read -p "Ingrese la fecha (YYYY-MM-DD): " fecha
read -p "Ingrese la IP: " ip

# Formatear la entrada
entrada="### $nombre $fecha $ip"

# Token de acceso personal
token="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"

# URL para actualizar el archivo en el repositorio
url="https://raw.githubusercontent.com/darnix1/vip/main/izin"

# Descargar el contenido actual del archivo
archivo_contenido=$(curl -sSL $url)

# Agregar la nueva entrada
nuevo_contenido="$archivo_contenido\n$entrada"

# Actualizar el archivo en GitHub utilizando cURL
curl -X PUT -H "Authorization: token $token" -d "$nuevo_contenido" $url
