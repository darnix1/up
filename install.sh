#!/bin/bash

# Solicitar información al usuario
read -p "Ingrese el nombre: " nombre
read -p "Ingrese la fecha (YYYY-MM-DD): " fecha
read -p "Ingrese la IP: " ip

# Formatear la entrada y agregarla al archivo en GitHub
entrada="### $nombre $fecha $ip"
echo "$entrada" >> https://github.com/darnix1/vip/blob/main/izin

# Actualizar el repositorio en GitHub
git add archivo_en_github
git commit -m "Añadir información para $nombre"
# Reemplaza 'tu_usuario' con tu nombre de usuario en GitHub
token="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"
git push origin master -u darnix1:$token
