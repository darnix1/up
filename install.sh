#!/bin/bash
# COLOR VALIDATION
clear
#Hss-Punya
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

#INTALLER-UDP
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
IPVPS=$(curl -s ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
RAM=$(free -m | awk 'NR==2 {print $2}')
USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
MYIP=$(curl -sS ipv4.icanhazip.com)
echo ""
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/darnix1/vip/main/izin | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
# validity
rm -f /usr/bin/e
valid=$(curl https://raw.githubusercontent.com/darnix1/vip/main/izin | grep $MYIP | awk '{print $3}')
echo "$valid" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
clear


version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/darnix1/vip/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}[$version]${Font_color_suffix}"
Info2="${Green_font_prefix}[Ultima version]${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix}${Red_font_prefix}[ Actualizar ]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/darnix1/vip/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
stl="${Info2}"
else
stl="${Error}"
fi
clear


# CERTIFICATE STATUS
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))
# VPS Information
DATE=$(date +'%Y-%m-%d')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "$COLOR1 $NC Expiry In   : $(( (d1 - d2) / 86400 )) Days"
}
mai="datediff "$Exp" "$DATE""

# Status ExpiRED Active | Geo Project
Info="(${green}Activado${NC})"
Error="(${green}Activado${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/darnix1/vip/main/izin | grep $MYIP | awk '{print $3}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear

# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"

# Getting CPU Information | Geo Project
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${coREDiilik:-1}))"
cpu_usage+=" %"
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(curl -s ipinfo.io/ip )
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
clear
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${green}ON✓${NC}"
else
   status_ssh="${RED}🔴${NC} "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${green}ON✓${NC}"
else
    status_ws_epro="${RED}🔴${NC} "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${green}ON✓${NC}"
else
   status_haproxy="${RED}🔴${NC} "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="${green}ON✓${NC}"
else
   status_xray="${RED}🔴${NC} "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="${green}ON✓${NC}"
else
   status_nginx="${RED}🔴${NC} "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="${green}ON✓${NC}"
else
   status_dropbear="${RED}🔴${NC} "
fi
#####INFOAKUN
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
###########

ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
# Definición de colores
ver="\033[32m"
bla="\033[37m"
roj="\033[31m"
res="\033[0m"
COLOR9="\e[33m"
NZ="\e[0m"
WK="\e[97m"
author=$(cat /usr/bin/SCRIPT/message.txt)

r="\033[1;33m"  #REDTERANG
a="PRO" 
clear
echo -e " "
#echo -e " ${z}╭══════════════════════════════════════════════════════════╮${NC}"
#echo -e " ${z}│$NC\033[41m         BIENVENIDO SCRIPT DARNIX           $NC${z}│$NC"
#echo -e " ${z}╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " $COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│$NC ${WH} ⇲ $NC${WH} System OS ${NC}     $Blue=$NC $MODEL${NC}"
echo -e " $COLOR1│$NC ${WH} ⇲ $NC${WH} Server RAM ${NC}    $Blue=$NC $USAGERAM MB $NC"
echo -e " $COLOR1│$NC ${WH} ⇲ $NC${WH} Tiempo log    ${NC} $Blue=$NC $SERONLINE${NC}"
echo -e " $COLOR1│$NC ${WH} ⇲ $NC${WH} IP VPS ${NC}        $Blue=$NC $IPVPS${NC}"
echo -e " $COLOR1│$NC ${WH} ⇲ $NC${WH} Dominio ${NC}       $Blue=$NC $domain${NC}"
echo -e " $COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e " ${ver}╭══════════════╮${res}${bla}╭═══════════════╮${res}${roj}╭════════════════╮${NC}"
echo -e " ${ver}│ ${NC}${WH}SSH$NC : $status_ssh" "     ${WH} NGINX$NC : $status_nginx" "   ${WH} FULLXRAY$NC : $status_xray  $NC${roj}│$NC" 
echo -e " ${ver}│ ${NC}${WH}WS-ePRO$NC : $status_ws_epro" " ${WH} DROPBEAR$NC : $status_dropbear" "${WH} HAPROXY$NC : $status_haproxy   $NC${roj}│$NC" 
echo -e " ${ver}╰══════════════╯${res}${bla}╰═══════════════╯${res}${roj}╰════════════════╯${NC}"
echo -e " $COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}01${WH}]${NC} ${WH} SSH MENU    $NC[$ssh1] $COLOR1│$NC ${WH}[${COLOR1}09${WH}]${NC} ${WH} ELIMINAR EXPIRADOS $NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}02${WH}]${NC} ${WH} VMESS MENU  $NC[$vma] $COLOR1│$NC ${WH}[${COLOR1}10${WH}]${NC} ${WH} RESPALDO/RESTAURAR $NC"   
echo -e " $COLOR1│$NC ${WH}[${COLOR1}03${WH}]${NC} ${WH} VLESS MENU  $NC[$vla] $COLOR1│$NC ${WH}[${COLOR1}11${WH}]${NC} ${WH} REINICIAR SERVIVIOS$NC" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}04${WH}]${NC} ${WH} TROJAN MENU $NC[$trb] $COLOR1│$NC ${WH}[${COLOR1}12${WH}]${NC} ${WH} NUEVO DOMINIO      $NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}05${WH}]${NC} ${WH} SHADOW MENU $NC[$ssa] $COLOR1│$NC ${WH}[${COLOR1}13${WH}]${NC} ${WH} CERTIFICAR SSL     $NC" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}06${WH}]${NC} ${WH} MENU TEMA$NC       $COLOR1│$NC ${WH}[${COLOR1}14${WH}]${NC} ${WH} CLEAR LOG          $NC" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}07${WH}]${NC} ${WH} BOT PANEL$NC       $COLOR1│$NC ${WH}[${COLOR1}15${WH}]${NC} ${WH} PUERTOS ABIERTOS   $NC"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}08${WH}]${NC} ${WH} BOT NOTIF$NC       $COLOR1|$NC ${WH}[${COLOR1}16${WH}]${NC} ${WH} UPDATE SCRIPT      $NC"  
echo -e " $COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e " $COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│$NC${WH} Version$NC       ${WH}=$NC $a $stl"  
echo -e " $COLOR1│$NZ${WK} Reseller$NZ      ${WK}=$NZ $author"
echo -e " $COLOR1│$NC${WH} Estado Actual$NC ${WH}=$NC $sts "
echo -e " $COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo
read -p " Selecciona una opcion : " opt
echo -e ""
case $opt in
1 | 01)
clear
m-sshws
;;
2 | 02)
clear
m-vmess
;;
3 | 03)
clear
m-vless
;;
4 | 04)
clear
m-trojan
;;
5 | 05)
clear
m-ssws
;;
6 | 06)
clear
menu-theme
;;
7 | 07)
clear
add-bot-panel
;;
8 | 08)
clear
bot
;;
9 | 09)
clear
xp
echo ""
echo -e " ${GREEN} Volviendo al menu en 1 sec ${NC}"
sleep 1
menu
;;
10)
clear
menu-backup
;;
11)
clear
restart
;;
12)
clear
addhost
;;
13)
clear
fixcert
;;
14)
clear
clearlog
;;
15)
clear
prot
echo ""
read -n 1 -s -r -p "Presiona cualquiera tecla para ir al menu"
menu
;;
16)
clear
clear
echo -e "${green}ANDA YAKIN UNTUK UPDATE SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"
wget https://raw.githubusercontent.com/darnix1/vip/main/update.sh && chmod +x update.sh && ./update.sh
;;
17)
clear
restart
;;
18)
clear
addhost
;;
19)
clear
fixcert
;;
20)
clear
wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp
;;
21)
clear
clearcache
;;
22)
clear
bot
;;
23)
clear
echo -e "${green}ANDA YAKIN UNTUK UPDATE SCRIPT INI ? $NC"
echo -e "${green}MINIMAL RAM 2 GB BIAR DISK TIDAK FULL $NC"
echo -e "${green}OS SUPPORT UBUNTU 20.04 ONLY $NC"
wget https://raw.githubusercontent.com/darnix1/vip/main/update.sh && chmod +x update.sh && ./update.sh
;;
24)
clear
add-bot-panel
;;
0 | 00)
figlet KYT PROJECT
exit
;;
x)
menu
;;
*)
echo -e ""
menu
;;
esac

