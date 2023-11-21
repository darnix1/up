#!/bin/bash
#29-03-23-648
echo "$$" >/etc/SCRIPT-LATAM/temp/menuid
clear && clear
echo -e "\a\a\a"
check-update
if [ $(whoami) != 'root' ]; then #-- VERIFICAR ROOT
  echo -e "\033[1;31m -- NECESITAS SER USER ROOT PARA EJECUTAR EL SCRIPT --\n\n\033[97m                DIGITE: \033[1;32m sudo su; menu\n"
  sleep 5s
  exit && exit
fi
rebootnb "totallssh" & ##-->> CONTADOR DE SSH
##-->> COLORES
red=$(tput setaf 1)
gren=$(tput setaf 2)
yellow=$(tput setaf 3)
SCPdir="/etc/SCRIPT-LATAM" && [[ ! -d ${SCPdir} ]] && exit 1
SCTemp="/etc/SCRIPT-LATAM/temp" && [[ ! -d ${SCTemp} ]] && exit 1
SCPfrm="${SCPdir}/botmanager"
if [[ -e /etc/bash.bashrc-bakup ]]; then # -- CHECK AUTORUN
  AutoRun="\033[1;93m[\033[1;32m ON \033[1;93m]"
elif [[ -e /etc/bash.bashrc ]]; then
  AutoRun="\033[1;93m[\033[1;31m OFF \033[1;93m]"
fi
msg() { ##-->> COLORES, TITULO, BARRAS
  ##-->> ACTULIZADOR Y VERCION
  [[ ! -e /etc/SCRIPT-LATAM/temp/version_instalacion ]] && printf '1\n' >/etc/SCRIPT-LATAM/temp/version_instalacion
  v11=$(cat /etc/SCRIPT-LATAM/temp/version_actual)
  v22=$(cat /etc/SCRIPT-LATAM/temp/version_instalacion)
  if [[ $v11 = $v22 ]]; then
    vesaoSCT="\e[1;31m[\033[1;37m Ver.\033[1;32m $v22 \033[1;31m]"
  else
    vesaoSCT="\e[1;31m[\e[31m ACTUALIZAR \e[25m\033[1;31m]"
  fi
  ##-->> COLORES
  local colors="/etc/SCRIPT-LATAM/colors"
  if [[ ! -e $colors ]]; then
    COLOR[0]='\033[1;37m' #GRIS='\033[1;37m'
    COLOR[1]='\e[31m'     #ROJO='\e[31m'
    COLOR[2]='\e[32m'     #VERDE='\e[32m'
    COLOR[3]='\e[33m'     #AMARILLO='\e[33m'
    COLOR[4]='\e[34m'     #AZUL='\e[34m'
    COLOR[5]='\e[91m'     #ROJO-NEON='\e[91m'
    COLOR[6]='\033[1;97m' #BALNCO='\033[1;97m'

  else
    local COL=0
    for number in $(cat $colors); do
      case $number in
      1) COLOR[$COL]='\033[1;37m' ;;
      2) COLOR[$COL]='\e[31m' ;;
      3) COLOR[$COL]='\e[32m' ;;
      4) COLOR[$COL]='\e[33m' ;;
      5) COLOR[$COL]='\e[34m' ;;
      6) COLOR[$COL]='\e[35m' ;;
      7) COLOR[$COL]='\033[1;36m' ;;
      esac
      let COL++
    done
  fi
  NEGRITO='\e[1m'
  SINCOLOR='\e[0m'
  case $1 in
  -ne) cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SINCOLOR}" ;;
  -ama) cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -verm) cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -verm2) cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -azu) cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -verd) cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  -bra) cor="${COLOR[0]}${SINCOLOR}" && echo -e "${cor}${2}${SINCOLOR}" ;;
  "-bar2" | "-bar") cor="${COLOR[1]}════════════════════════════════════════════════════" && echo -e "${SINCOLOR}${cor}${SINCOLOR}" ;;
  # Centrar texto
  -tit) echo -e " \e[48;5;214m\e[38;5;0m   💻 𝙎 𝘾 𝙍 𝙄 𝙋 𝙏 | 𝙇 𝘼 𝙏 𝘼 𝙈 💻   \e[0m  $vesaoSCT" ;;
  esac
}
#--- INFO DE SISTEMA
os_system() {
  system=$(echo $(cat -n /etc/issue | grep 1 | cut -d' ' -f6,7,8 | sed 's/1//' | sed 's/      //'))
  echo $system | awk '{print $1, $2}'
}
#--- FUNCION IP INSTALACION
meu_ip() {
  if [[ -e /tmp/IP ]]; then
    echo "$(cat /tmp/IP)"
  else
    MEU_IP=$(wget -qO- ifconfig.me)
    echo "$MEU_IP" >/tmp/IP
  fi
}
#--- FUNCION IP ACTUAL
fun_ip() {
  if [[ -e /etc/SCRIPT-LATAM/MEUIPvps ]]; then
    IP="$(cat /etc/SCRIPT-LATAM/MEUIPvps)"
  else
    MEU_IP=$(wget -qO- ifconfig.me)
    echo "$MEU_IP" >/etc/SCRIPT-LATAM/MEUIPvps
  fi
}

#--- MENU DE SELECCION
selection_fun() {
  local selection
  local options="$(seq 0 $1 | paste -sd "," -)"
  read -p $'\033[1;97m  └⊳ Seleccione una opción:\033[1;32m ' selection
  if [[ $options =~ (^|[^\d])$selection($|[^\d]) ]]; then
    echo $selection
  else
    echo "Selección no válida: $selection" >&2
    exit 1
  fi
}
export -f msg
export -f selection_fun
export -f meu_ip
export -f fun_ip
clear && clear
msg -bar && msg -tit
title=$(echo -e "\033[1;4;92m$(cat ${SCPdir}/message.txt)\033[0;37m")
printf "%*s\n" $((($(echo -e "$title" | wc -c) + 68) / 2)) "$title"
msg -bar
echo -e "    \033[1;37mIP: \033[93m$(meu_ip)     \033[1;37mS.O: \033[96m$(os_system)"
##-->> CONTADOR DE CUENTAS
[[ -e /root/name ]] && figlet -p -f smslant < /root/name | lolcat || echo -e "\033[7;49;35m    ${TTini} New ChumoGH${TTcent}VPS ${TTfin}      \033[0m"
echo -e "\033[1;37m  ${RRini} Reseller : $(cat < /bin/ejecutar/menu_credito) 2022 ${RRfin}\033[0m"
lineam 
echo -e "${cor[2]}  ⇜ Comsumo de INTERNET TOTAL EN VPS ⇝ ⇅"
down=($(ifconfig $(ip route | grep default | awk '{print $5}') | grep -o "(.*)" ))
download_down=$(echo ${down[1]}${down[2]} | sed -e 's/(//' |sed -e 's/)//')
download_up=$(echo ${down[3]}${down[4]} | sed -e 's/(//' |sed -e 's/)//')
#echo -e " DESCARGA : $download_down | SUBIDA : $download_up" |column -t -s '|'
lineam 
echo -e "\033[1;36m  ↯↯↯ TRAFICO TOTAL DE BAJADA ↯↯↯ "
echo -e "\033[1;37m DESCARGA ↡ \033[1;32m --> \033[1;34m " $download_down "\033[1;32m <--\033[1;37m Ethernet ⇧ "
lineam 
echo -e "\033[1;36m  ⇈ TRAFICO TOTAL DE SUBIDA ⇈ "
echo -e "\033[1;37m SUBIDA ↡ \033[1;32m --> \033[1;34m " $download_up "\033[1;32m <--\033[1;37m Ethernet ⇧ "
lineam 
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR \033[0m"
read -p " "
