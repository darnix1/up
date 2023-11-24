#!/bin/bash
# //====================================================
# //	System Request:Debian 10/Ubuntu 18.04+/20+
# //	Author:	Devils Tunnel 
# //	Dscription: Xray Management
# //	email: csordervpn@gmail.com
# //  telegram: https://t.me/devilstunnels
# //====================================================
# // font color configuration | DEVILS TUNNEL AUTOSCRIPT
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
err_fun() {
    case $1 in
    1)
      msg -verm "Usuario Nulo - Regresando al Menu SSH"
      sleep 3s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    2)
      msg -verm "Usuario con nombre muy corto (5-15 Caracteres)"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    3)
      msg -verm "Usuario con nombre muy grande (5-15 Caracteres)"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    4)
      msg -verm "Contraseña Nula"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    5)
      msg -verm "Contraseña muy corta (5-15 Caracteres)"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    6)
      msg -verm "Contraseña muy grande (5-15 Caracteres)"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    7)
      msg -verm "Duracion Nula"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    8)
      msg -verm "Duracion invalida utilize numeros"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    9)
      msg -verm "Duracion maxima y de un año"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    11)
      msg -verm "Limite Nulo"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    12)
      msg -verm "Limite invalido utilize numeros"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    13)
      msg -verm "Limite maximo de 999"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    14)
      msg -verm "Usuario Ya Existe"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    15)
      msg -verm "HWID/Nombre Nulo (8-10 Caracteres)"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    16)
      msg -verm "HWID Ya Existe"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    17)
      msg -verm "TOKEN/Nombre Nulo (8-10 Caracteres)"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    18)
      msg -verm "TOKEN Ya Existe"
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    19)
      msg -verm "User o Pass ya Ocupado reintente con Otro"
      sleep 3s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    20)
      msg -verm "No usar mismo user como pass y misma cantidad de caracteres "
      sleep 2s
      tput cuu1
      tput dl1
      tput cuu1
      tput dl1
      ;;
    esac
  }
#tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
#none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• CREAR USUARIO VMESS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

		#read -rp "Usuario: " -e user
                while true; do
        echo -ne "\e[1;93mDigite Nuevo Usuario: \e[1;32m" && read user
        user="$(echo $user | sed -e 's/[^a-z0-9 -]//ig')"
        if [[ -z $user ]]; then
          err_fun 1 && menu
        elif [[ "${#user}" -lt "5" ]]; then
          err_fun 2 && continue
        elif [[ "${#user}" -gt "20" ]]; then
          err_fun 3 && continue

        fi
        break
      done
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
            echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• CREAR USUARIO VMESS •              ${NC} $COLOR1 $NC"
            echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

			echo ""
			echo "Ya se creó un cliente con el nombre especificado, elija otro nombre."
			echo ""
			echo -e "$COLOR1━━━━━━━━━━━━━━━━━$NC"
			read -n 1 -s -r -p "Presiona una tecla para ir al menu"
      menu
		fi
	done
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
read -p "Uuid (Manual): " uuid
read -p "Expired (days): " masaaktif
read -p "Limit User (GB): " Quota
read -p "Limit User (IP): " iplimit
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

---------------------
# Format Vmess WS (CDN)
---------------------

- name: Vmess-$user-WS (CDN)
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
---------------------
# Format Vmess WS (CDN) Non TLS
---------------------

- name: Vmess-$user-WS (CDN) Non TLS
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
---------------------
# Format Vmess gRPC (SNI)
---------------------

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

---------------------
 Link Akun Vmess                   
---------------------
Link TLS         : 
${vmesslink1}
---------------------
Link none TLS    : 
${vmesslink2}
---------------------
Link GRPC        : 
${vmesslink3}
---------------------

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

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
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
<code>     CUENTA XRAY/VMESS</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Usuario   : ${user}
Dominio    : ${domain}
Limite Cuota : ${Quota} GB
Port TLS  : 443
Port NTLS : 80
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
<code> VMESS gRPC</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>${vmesslink3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
El usuario expira el  : $expe
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• CUENTA CREADA VMESS •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "Usuario          : ${user}"
echo -e "Dominio          : ${domain}"
echo -e "User Ip            : ${iplimit} IP"
echo -e "Port TLS         : 443"
echo -e "Port none TLS    : 80"
echo -e "id               : ${uuid}"
echo -e "alterId          : 0"
echo -e "Security         : auto"
echo -e "Network          : ws"
echo -e "Path             : (/Multi-Path)/vmess"
echo -e "Dynamic          : http://bug/path"
echo -e "ServiceName      : vmess-grpc"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS         : "
echo -e "${vmesslink1}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link none TLS    : "
echo -e "${vmesslink2}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Expira en    : $expe"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
m-vmess
