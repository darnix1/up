
down=($(ifconfig $(ip route | grep default | awk '{print $5}') | grep -o "(.*)" ))
download_down=$(echo ${down[1]}${down[2]} | sed -e 's/(//' |sed -e 's/)//')
download_up=$(echo ${down[3]}${down[4]} | sed -e 's/(//' |sed -e 's/)//')
echo -e "\033[1;37m DESCARGA \033[1;32m $download_down | \033[1;37m SUBIDA \033[1;32m $download_up" |column -t -s '|'



