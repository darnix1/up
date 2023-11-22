
down=($(ifconfig $(ip route | grep default | awk '{print $5}') | grep -o "(.*)" ))
download_down=$(echo ${down[1]}${down[2]} | sed -e 's/(//' |sed -e 's/)//')
download_up=$(echo ${down[3]}${down[4]} | sed -e 's/(//' |sed -e 's/)//')
echo -e " DESCARGA : $download_down | SUBIDA : $download_up" |column -t -s '|'


echo -e "\033[1;37m DESCARGA ↡ \033[1;32m --> \033[1;34m " $download_down "\033[1;32m <--\033[1;37m Ethernet ⇧ "

echo -e "\033[1;37m SUBIDA ↡ \033[1;32m --> \033[1;34m " $download_up "\033[1;32m <--\033[1;37m Ethernet ⇧ "

