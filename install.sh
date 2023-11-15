#!/bin/bash

remote_user="root"           # Usuario SSH en el servidor remoto
remote_ip="74.207.228.184"    # Dirección IP del servidor remoto
remote_port="22"              # Puerto SSH del servidor remoto
remote_path="/root/uuids.txt" # Ruta al archivo de UUIDs en el servidor remoto
password="K@kskdSkskf"          # Contraseña para el usuario en el servidor remoto

function is_uuid_used() {
    local target_uuid="$1"
    sshpass -p "$password" ssh -p "$remote_port" "$remote_user@$remote_ip" "grep -q '$target_uuid' $remote_path"
}

function add_uuid_to_used() {
    local uuid="$1"
    sshpass -p "$password" ssh -p "$remote_port" "$remote_user@$remote_ip" "echo '$uuid' >> $remote_path"
}
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          SCRIPT AUTOMX          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
echo -e " FAVOR INGRESA TU KEY EN EL ESPACIO DE ABAJO"

read -r uuid   # Lee el UUID ingresado por el usuario

while true; do
    if [[ -n $uuid && $uuid =~ ^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$ ]]; then
        if is_uuid_used "$uuid"; then
            echo -e "\n\033[1;31mKEY ya utilizado. Por favor, ingresa uno diferente:\033[0m"
            read -r uuid
        else
            add_uuid_to_used "$uuid"  # Agregar UUID al archivo en el servidor remoto
            echo -e "\n\033[1;32mKey agregado con éxito al archivo en el servidor remoto.\033[0m"
            break
        fi
    else
        echo -e "\n\033[1;31mKey inválido. Por favor, ingresa una Key válida:\033[0m"
        read -r uuid
    fi
done

# Continúa con el resto del script después de que se haya ingresado un UUID válido
#echo "Continuando con el script..."
    echo -e " \e[3;32m AUTORIZANDO IP DE USUARIO\e[0m" | pv -qL 10 ; rm $_Ink/list > /dev/null 2>&1; wget -P $_Ink https://raw.githubusercontent.com/DanssBot/SSHPLUS/main/Install/list >/dev/null 2>&1
    
    sleep 5s
    clear
    clear
