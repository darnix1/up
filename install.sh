#!/bin/bash
### Color
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
# ===================
clear
  # // Exporint IP AddressInformation
export IP=$( curl -sS ipinfo.io/ip )

# // Clear Data
clear
clear && clear && clear
clear;clear;clear

  # // Banner
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "  Bienvenido al instalador de script ${YELLOW}(${NC}${green} Stable Edition ${NC}${YELLOW})${NC}"
echo -e "     Esto configurará rápidamente el servidor VPN en su servidor"
echo -e "         Auther : ${green}darnix ${NC}${YELLOW}(${NC} ${green}Geo Project ${NC}${YELLOW})${NC}"
echo -e "       © Recode By darnix ${YELLOW}(${NC} 2023 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo ""
sleep 5
clear
###### IZIN SC 
#!/bin/bash

while [[ ! $Keey ]]; do
        clear
        export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games
        echo -e "\n      \033[1;32m DIGITA TU KEY A VERIFICAR "
        msg -ne "Script Key: " && read Keey
        [[ ! -z $Keey ]] && Keey="$(echo "$Keey" | tr -d '[[:space:]]')"
        tput cuu1 && tput dl1
    done

# Continúa con el resto del script después de que se haya ingresado un UUID válido
#echo "Continuando con el script..."
    echo -e " \e[3;32m AUTORIZANDO IP DE USUARIO\e[0m" | pv -qL 10 ; rm $_Ink/list > /dev/null 2>&1; wget -P $_Ink https://raw.githubusercontent.com/DanssBot/SSHPLUS/main/Install/list >/dev/null 2>&1
    
    sleep 5s
    clear
    clear
ipsaya=$(wget -qO- ipinfo.io/ip)

data_ip="https://raw.githubusercontent.com/darnix1/vip/main/izin"

checking_sc() {
  # Comentar las líneas relacionadas con la verificación de la fecha de vencimiento
  # useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  # if [[ $date_list < $useexp ]]; then
  #   echo -ne
  # else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          INSTALACION EN CURSO          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISO CONCEDIDO${NC}"  # Ajusta el mensaje según tus necesidades
    echo -e "   \033[0;33mTu ip fue autorizado exitosamente.${NC}"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    # exit
  # fi
}

checking_sc

# // Checking Os Architecture
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
    echo -e "${OK} Your Architecture Is Supported ( ${green}$( uname -m )${NC} )"
else
    echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
    exit 1
fi

# // Checking System
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
    echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
    exit 1
fi

# // IP Address Validating
if [[ $IP == "" ]]; then
    echo -e "${EROR} IP Address ( ${YELLOW}Not Detected${NC} )"
else
    echo -e "${OK} IP Address ( ${green}$IP${NC} )"
fi

# // Validate Successfull
echo ""
read -p "$( echo -e "Presione ${GRAY}[ ${NC}${green}Enter${NC} ${GRAY}]${NC} Para iniciar la instalación") "
echo ""
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m" 
clear
# Version sc
clear
#########################
# USERNAME
rm -f /usr/bin/user
username=$(curl https://raw.githubusercontent.com/darnix1/vip/main/izin | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
expx=$(curl https://raw.githubusercontent.com/darnix1/vip/main/izin | grep $MYIP | awk '{print $3}')
echo "$expx" >/usr/bin/e
# DETAIL ORDER
username=$(cat /usr/bin/user)
oid=$(cat /usr/bin/ver)
exp=$(cat /usr/bin/e)
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
Info="(${green}Active${NC})"
Error="(${RED}ExpiRED${NC})"
today=`date -d "0 days" +"%Y-%m-%d"`
Exp1=$(curl https://raw.githubusercontent.com/darnix1/vip/main/izin | grep $MYIP | awk '{print $4}')
if [[ $today < $Exp1 ]]; then
sts="${Info}"
else
sts="${Error}"
fi
echo -e "\e[32mloading...\e[0m"
clear
# REPO    
    REPO="https://raw.githubusercontent.com/darnix1/vip/main/"

####
start=$(date +%s)
secs_to_human() {
    echo "Installation time : $((${1} / 3600)) hours $(((${1} / 60) % 60)) minute's $((${1} % 60)) seconds"
}
