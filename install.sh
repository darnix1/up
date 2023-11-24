#!/bin/bash
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
# Crear la carpeta
mkdir -p /user

# Crear el archivo dentro de la carpeta
touch "/user/log-vless-$user.txt"

clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script

echo -e "\e[32mloading...\e[0m"
clear
source /var/lib/kyt/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• CREAR USUARIO VMESS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		while true; do
    read -rp "Usuario: " -e user

    # Validar longitud mínima
    if (( ${#user} < 3 )); then
        echo "Error: El usuario es demasiado corto. Debe contener al menos 3 letras."
        continue
    fi

    # Validar longitud máxima
    if (( ${#user} > 6 )); then
        echo "Error: El usuario es demasiado largo. Debe contener máximo 6 letras."
        continue
    fi

    # Validar solo letras
    if ! [[ "$user" =~ ^[a-zA-Z]+$ ]]; then
        echo "Error: El usuario solo debe contener letras."
        continue
    fi

    # Validar no estar vacío
    if [ -z "$user" ]; then
        echo "Error: El campo no puede estar vacío."
        continue
    fi

    
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
            echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• CREAR USUARIO VMESS •              ${NC} $COLOR1 $NC"
            echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

			echo ""
			echo "Ya se creó un cliente con el nombre especificado, elija otro nombre."
			echo ""
			echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"
			read -n 1 -s -r -p "Presiona una tecla para ir al menu"
      menu
		fi
  break

	done
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
uuid=$(cat /proc/sys/kernel/random/uuid)
# Validar expiración en días
while true; do
    read -p "Expira en (dias): " masaaktif

    # Validar no estar vacío
    if [ -z "$masaaktif" ]; then
        echo "Error: El campo no puede estar vacío. Ingresa la expiración en días."
        continue
    fi

    # Validar solo números
    if ! [[ "$masaaktif" =~ ^[0-9]+$ ]]; then
        echo "Error: Ingresa solo números para la expiración en días."
        continue
    fi

    # Puedes agregar más validaciones según sea necesario

    break
done

# Validar límite de usuario en GB
while true; do
    read -p "Limite User (GB): " Quota

    # Validar no estar vacío
    if [ -z "$Quota" ]; then
        echo "Error: El campo no puede estar vacío. Ingresa el límite de usuario en GB."
        continue
    fi

    # Validar solo números
    if ! [[ "$Quota" =~ ^[0-9]+$ ]]; then
        echo "Error: Ingresa solo números para el límite de usuario en GB."
        continue
    fi

    # Puedes agregar más validaciones según sea necesario

    break
done

# Validar límite de usuario en IP
while true; do
    read -p "Limite User (IP): " iplimit

    # Validar no estar vacío
    if [ -z "$iplimit" ]; then
        echo "Error: El campo no puede estar vacío. Ingresa el límite de usuario en IP."
        continue
    fi

    # Puedes agregar validaciones específicas para la IP si es necesario

    break
done

tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json

asu=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $asu | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1


cat >/var/www/html/vmess-$user.txt <<-END

◇━━━━━━━━━━━━━━━━━◇
  G E O  P R O J E C T 
◇━━━━━━━━━━━━━━━━━◇

◇━━━━━━━━━━━━━━━━━◇
# Format Vmess WS TLS

- name: Vmess-$user-WS TLS
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess WS Non TLS

- name: Vmess-$user-WS Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}

# Format Vmess gRPC

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

◇━━━━━━━━━━━━━━━━━◇
 Link Akun Vmess                   
◇━━━━━━━━━━━━━━━━━◇
Link TLS         : 
${vmesslink1}
◇━━━━━━━━━━━━━━━━━◇
Link none TLS    : 
${vmesslink2}
◇━━━━━━━━━━━━━━━━━◇
Link GRPC        : 
${vmesslink3}
◇━━━━━━━━━━━━━━━━━◇

END
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vmess/ip
echo -e "$iplimit" > /etc/kyt/limit/vmess/ip/$user
else
echo > /dev/null
fi

if [ -z "${Quota}" ]; then
  Quota="0"
fi

# Sumar 1 GB adicional
c=$((${Quota} + 1))

# Convertir a bytes
d=$((${c} * 1024 * 1024 * 1024))

if [[ "${c}" != "0" ]]; then
  echo "${d}" > "/etc/vmess/${user}"
fi

DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vmess/.vmess.db
clear
CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>      XRAY/VMESS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Usuario   : ${user}
Dominio : ${domain}
Limite Cuota : ${Quota} GB
Port TLS  : 400-900
Port NTLS : 80, 8080, 8081-9999
id        : ${uuid}
alterId   : 0
Security  : auto
network   : ws or grpc
Path      : /Multi-Path
Dynamic   : https://bugmu.com/path
Name      : vmess-grpc</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code> VMESS WS TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>VMESS WS NO TLS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink2}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
Activo Durante   : $masaaktif Dias
Inicia Hoy   : $tnggl
Termina el   : $expe
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"    | tee -a /user/log-vmess-$user.txt
echo -e " Xray/Vmess Account " | tee -a /user/log-vmess-$user.txt
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m"| tee -a /user/log-vmess-$user.txt
echo -e "Usuario          : ${user}" | tee -a /user/log-vmess-$user.txt
echo -e "Dominio   : ${domain}" | tee -a /user/log-vmess-$user.txt
echo -e "User cuota       : ${Quota} GB" | tee -a /user/log-vmess-$user.txt
echo -e "User Ip            : ${iplimit} IP" | tee -a /user/log-vmess-$user.txt
echo -e "Port TLS         : 400-900" | tee -a /user/log-vmess-$user.txt
echo -e "Port none TLS    : 80, 8080, 8081-9999" | tee -a /user/log-vmess-$user.txt
echo -e "id               : ${uuid}" | tee -a /user/log-vmess-$user.txt
echo -e "Xray Dns      : ${NS}" | tee -a /user/log-vmess-$user.txt
echo -e "Pubkey        : ${PUB}" | tee -a /user/log-vmess-$user.txt
echo -e "alterId          : 0" | tee -a /user/log-vmess-$user.txt
echo -e "Security         : auto" | tee -a /user/log-vmess-$user.txt
echo -e "Network          : ws" | tee -a /user/log-vmess-$user.txt
echo -e "Path             : /Multi-Path" | tee -a /user/log-vmess-$user.txt
echo -e "Dynamic          : https://bugmu.com/path" | tee -a /user/log-vmess-$user.txt
echo -e "ServiceName      : vmess-grpc" | tee -a /user/log-vmess-$user.txt
#echo -e "Host XrayDNS : ${NS}" | tee -a /user/log-vmess-$user.txt
#echo -e "Location         : $CITY" | tee -a /user/log-vmess-$user.txt
#echo -e "Pub Key          : ${PUB}" | tee -a /user/log-vmess-$user.txt
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m"| tee -a /user/log-vmess-$user.txt
echo -e "Link TLS         : ${vmesslink1}" | tee -a /user/log-vmess-$user.txt
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /user/log-vmess-$user.txt
echo -e "Link none TLS    : ${vmesslink2}" | tee -a /user/log-vmess-$user.txt
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /user/log-vmess-$user.txt
echo -e "Activo Durante   : $masaaktif Dias" | tee -a /user/log-vmess-$user.txt
echo -e "Inicia Hoy       : $tnggl" | tee -a /user/log-vmess-$user.txt
echo -e "Termina el       : $expe" | tee -a /user/log-vmess-$user.txt
echo -e "\033[0;34m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /user/log-vmess-$user.txt
echo " " | tee -a /user/log-vmess-$user.txt
echo " " | tee -a /user/log-vmess-$user.txt
echo " " | tee -a /user/log-vmess-$user.txt
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
m-vmess
