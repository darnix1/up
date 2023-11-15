#!/bin/bash
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



    while [[ ! $Keey ]]; do
        clear
        export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games
        echo -e "\n      \033[1;32m DIGITA TU KEY A VERIFICAR "
        msg -ne "Script Key: " && read Keey
        [[ ! -z $Keey ]] && Keey="$(echo "$Keey" | tr -d '[[:space:]]')"
        tput cuu1 && tput dl1
    done
    REQUEST=$(ofus "$Keey" | cut -d'/' -f2)
    echo -e "\n"
    echo -e " FILE Contend : ${REQUEST} $(echo ${REQUEST} | wc -c)"
    echo -e "\n"
    echo -e " VERIFICA, Si tu key Contiene \033[1;45m KEY DE ChumoGH! \033[0m "
    echo -e "\n"
    echo -e " Link Key: http://$(ofus $Keey) \n                      "
    IiP=$(ofus "$Keey" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
    [[ $(curl -s --connect-timeout 2 $IiP:8888) ]] && echo -e "\033[1;42mCONEXION CON SERVIDOR EXITOSA\033[0m" || echo -e "\033[1;43mCONEXION CON SERVIDOR FALLIDA\033[0m"
    wget --no-check-certificate -O $HOME/list-key $(ofus $Keey)/$(wget -qO- ipv4.icanhazip.com) >/dev/null 2>&1 && echo -ne "\033[1;32m  [ VERIFICANDO ]" || echo -e "\033[1;31m [ No Existe Acceso al KEY ]" #&& echo -e "\033[1;32m [ Key  ]\n" || echo -e "\033[1;31m [ No Existe Acceso al KEY ]"
    ofen=$(wget -qO- $(ofus $Keey))
    unset arqx
    [[ -d $HOME/install ]] && rm -rf $HOME/install/* || mkdir $HOME/install
    verificar_arq() {
        echo "$1" >>$HOME/install/log.txt
    }
    n=1
    IP=$(ofus "$Keey" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" >/usr/bin/vendor_code
    pontos="."
    stopping=" COMPROBANDO " | sed -e 's/[^a-z -]//ig'
    for arqx in $(cat $HOME/list-key); do
        echo -e "${stopping}${pontos}" && sleep 0.3s
        wget --no-check-certificate -O $HOME/install/${arqx} ${IP}:81/${REQUEST}/${arqx} >/dev/null 2>&1 && verificar_arq "${arqx}"
        tput cuu1 && tput dl1
        pontos+="."
        n=$(($n + 1))
    done
    echo -ne " ---> ESTADO : \033[1;45m$ofen\033[0m  con "
    [[ ! -e $HOME/install/log.txt ]] && touch $HOME/install/log.txt
    echo " $(cat <$HOME/install/log.txt | wc -l) FILES " && rm -f $HOME/install/log.txt
    msg -ne " \033[1;42mESTADO :\033[0m "
    [[ -e $HOME/list-key ]] && {
        echo -ne "  "
        [[ $ofen = "KEY DE ChumoGH!" ]] &&
            echo -e "KEY FUNCIONAL" && rm -f $HOME/list-key && echo -ne "\033[0m"
    } || echo -e " KEY INVALIDA O USADA\033[0m\n"
    #curl -s --connect-timeout 2 ${IiP}:81/${REQUEST}/menu_credito > menu_credito
    echo -e " RESELLER del Key :\033[0m  "
    [[ -e $HOME/install/menu_credito ]] && {
        echo -ne "  "
        [[ "$(cat $HOME/install/menu_credito)" = "" ]] && {
            echo -e "SIN RESELLER\033[0m"
        } || echo -e "$(cat $HOME/install/menu_credito)\033[0m" && rm -rf $HOME/install && echo -ne "\033[0m"
    } || echo -e " NO HAY CONTENIDO DE KEY Key\033[0m\n"
    read -p "Enter"


