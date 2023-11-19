#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
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
export TIME="10"
IP=$(curl -sS ipv4.icanhazip.com)
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
domain=$(cat /etc/xray/domain)
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}            ${WH}• CREAR USUARIO SSH •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo
echo -e -n "\033[0;97;43;1mNOMBRE DE USUARIO:\033[0m "; read Login
echo
echo -e "\033[0;97;43;1mCONTRASEÑA PARA:\033[0m $Login: " read Pass
echo
echo -e "\033[0;97;43;1mLIMITE DE CONEXIONES:\033[0m " read iplimit
echo
echo -e "\033[0;97;43;1mLIMITE DE GB PARA:\033[0m $Login" read Quota
echo
echo -e "\033[0;97;43;1mDURACION DEL USUARIO:\033[0m " read masaaktif

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/ssh/ip
echo -e "$iplimit" > /etc/kyt/limit/ssh/ip/$Login
else
echo > /dev/null
fi
clear
clear
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
expi="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`

if [ ! -e /etc/ssh ]; then
  mkdir -p /etc/ssh
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${Login}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^#ssh#" | grep -w "${Login}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${Login}\b/d" /etc/ssh/.ssh.db
fi
echo "#ssh# ${Login} ${Pass} ${Quota} ${iplimit} ${expe}" >>/etc/ssh/.ssh.db
clear

cat > /var/www/html/ssh-$Login.txt <<-END
◇━━━━━━━━━━━━━━━━━◇
G E O  P R O J E C T 
◇━━━━━━━━━━━━━━━━━◇

Format SSH OVPN Account
◇━━━━━━━━━━━━━━━━━◇
Username         : $Login
Password         : $Pass
◇━━━━━━━━━━━━━━━━━◇
IP               : $IP
Host             : $domain
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 443, 109
Port Dropbear WS : 443, 109
Port SSH UDP     : 1-65535
Port SSH WS      : 80, 8080, 8081-9999
Port SSH SSL WS  : 443
Port SSL/TLS     : 400-900
Port OVPN WS SSL : 443
Port OVPN SSL    : 443
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
BadVPN UDP       : 7100, 7300, 7300
◇━━━━━━━━━━━━━━━━━◇
Aktif Selama     : $masaaktif Hari
Dibuat Pada      : $tnggl
Berakhir Pada    : $expe
◇━━━━━━━━━━━━━━━━━◇
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
◇━━━━━━━━━━━━━━━━━◇
OVPN Download : https://$domain:81/
◇━━━━━━━━━━━━━━━━━◇

END

CHATID="$CHATID"
KEY="$KEY"
TIME="$TIME"
URL="$URL"
TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>CUENTA SSH OVPN CREADA      </code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Usuario          : </code> <code>$Login</code>
<code>Contraseña       : </code> <code>$Pass</code>
<code>Limite en GB     ; </code> <code>$Quota</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>IP               : $IP</code>
<code>Host             : </code> <code>$domain</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 443, 109</code>
<code>Port SSH WS      : 80, 8080, 8081-9999 </code>
<code>Port SSH UDP     : 1-65535 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 400-900</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
🔌 SSL PEGA EN HTTP CUSTOM 
<code>$IP:443@$Login:$Pass</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
🔌 UDP PEGA EN HTTP CUSTOM 
<code>$domain:1-65535@$Login:$Pass</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
Activo Durante       : $masaaktif Dias
Inicia hoy           : $tnggl
Termina el           : $expe
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "CUENTA SSH OVPN CREADA     "
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Username         : $Login" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Password         : $Pass" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Limite GB        : $Quota " | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Limite IP        : ${iplimit} " | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "IP       : $IP" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Host     : $domain" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port OpenSSH     : 443, 80, 22" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port SSH UDP     : 1-65535" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port Dropbear    : 443, 109" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port SSH WS      : 80, 8080, 8081-9999" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port SSH SSL WS  : 443" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port SSL/TLS     : 400-900" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port OVPN WS SSL : 443" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port OVPN SSL    : 443" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port OVPN TCP    : 443, 1194" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Port OVPN UDP    : 2200" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "BadVPN UDP       : 7100, 7300, 7300" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Payload WSS      : GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "OVPN Download    : https://$domain:81/" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Save Link Account: https://$domain:81/ssh-$Login.txt" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Activo Durante   : $masaaktif Dias" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Inicia hoy     : $tnggl" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "Expira el      : $expe" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "\033[1;93m◇━━━━━━━━━━━━━━━━━◇\033[0m" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "" | tee -a /etc/xray/log-createssh-${Login}.log
echo -e "" | tee -a /etc/xray/log-createssh-${Login}.log
echo ""
read -n 1 -s -r -p "Presione cualquier tecla para regresar al menú"
m-sshws

