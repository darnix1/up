#!/bin/bash
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
clear
function con() {
    local -i bytes=$1;
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(( (bytes + 1023)/1024 ))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(( (bytes + 1048575)/1048576 ))MB"
    else
        echo "$(( (bytes + 1073741823)/1073741824 ))GB"
    fi
}
echo -n > /tmp/other.txt
data=( `cat /etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC" 
echo -e "$COLOR1 ${NC} ${COLBG1} ${WH}• USUARIOS EN LINEA •  ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC" 

for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
iplimit=$(cat /etc/kyt/limit/vmess/ip/${akun})
jum2=$(cat /tmp/ipvmess.txt | wc -l)
byte=$(cat /etc/vmess/${akun})
lim=$(con ${byte})
wey=$(cat /etc/limit/vmess/${akun})
gb=$(con ${wey})
lastlogin=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 2 | tail -1)
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC" 
printf "  %-13s %-7s %-8s %2s\n" "  Usuario   : ${akun}"
printf "  %-13s %-7s %-8s %2s\n" "  Login     : $lastlogin"
printf "  %-13s %-7s %-8s %2s\n" "  GB Usados : ${gb}" 
printf "  %-13s %-7s %-8s %2s\n" "  Limite GB : ${lim}" 
printf "  %-13s %-7s %-8s %2s\n" "  Limite IP : $iplimit" 
printf "  %-13s %-7s %-8s %2s\n" "  Login IP  : $jum2" 
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC" 
fi 
rm -rf /tmp/ipvmess.txt
done
rm -rf /tmp/other.txt
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
