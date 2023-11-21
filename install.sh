#!/bin/bash
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
