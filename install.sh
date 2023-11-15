#!/bin/bash

function_verify () {
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
  permited=$(curl -sSL "https://raw.githubusercontent.com/DanssBot/DanBot/main/control")
  [[ $(echo $permited|grep "${IP}") = "" ]] && {
  clear
  echo -e "\n\n\n\033[1;91m————————————————————————————————————————————————————\n      ¡ESTA KEY NO CONCUERDA CON EL INSTALADOR! \n      BOT: @CONECTEDMX_BOT \n————————————————————————————————————————————————————\n\n\n"
  [[ -d /etc/VPS-MX ]] && rm -rf /etc/VPS-MX
  exit 1
  } || {
  ### INTALAR VERSION DE SCRIPT
  v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/version/master/vercion")
  echo "$v1" > /etc/versin_script
  }
}

ofus() {
      unset server
      server=$(echo ${txt_ofuscatw} | cut -d':' -f1)
      unset txtofus
      number=$(expr length $1)
      for ((i = 1; i < $number + 1; i++)); do
        txt[$i]=$(echo "$1" | cut -b $i)
        case ${txt[$i]} in
        ".")txt[$i]="C";;
"C")txt[$i]=".";;
"3")txt[$i]="@";;
"@")txt[$i]="3";;
"4")txt[$i]="9";;
"9")txt[$i]="4";;
"6")txt[$i]="P";;
"P")txt[$i]="6";;
"L")txt[$i]="K";;
"K")txt[$i]="L";;
esac
        txtofus+="${txt[$i]}"
      done
      echo "$txtofus" | rev
}

error_fun () {

echo ""
msg -bar2 && msg -verm "ERROR DE GENERADOR | ARCHIVOS INCOMPLETOS\n	KEY USADA" && msg -bar2
[[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq
rm -rf lista-arq
exit 1
}
invalid_key () {

echo ""
msg -bar2 && msg -verm "  Code Invalido -- #¡Key Invalida#! " && msg -bar2
[[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq
rm -rf lista-arq
exit 1
}


while [[ ! $Key ]]; do
msg -bar2 && msg -ne "\033[1;93m          >>> INGRESE SU KEY ABAJO <<<\n   \033[1;37m" && read Key
tput cuu1 && tput dl1
done
msg -ne "    # Verificando Key # : "
cd $HOME
wget -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -e "\033[1;32m Ofus Correcto" |pv -qL 30 || {
   echo -e "\033[1;91m Ofus Incorrecto"
   invalid_key
   exit
   }
IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/venip
#sleep 1s
function_verify
#updatedb
if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "Code de KEY Invalido!") ]]; then
   msg -bar2
   msg -verd "    Ficheros Copiados: \e[97m[\e[93m@conectedmx_bot\e[97m]"
   REQUEST=$(ofus "$Key"|cut -d'/' -f2)
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   pontos="." 
   stopping="Descargando Ficheros"
   for arqx in $(cat $HOME/lista-arq); do
   msg -verm "${stopping}${pontos}" 
   wget --no-check-certificate -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun
#
   tput cuu1 && tput dl1
   pontos+="."
   done
   invalid_key
