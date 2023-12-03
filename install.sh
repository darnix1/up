#!/bin/bash
[[ -e /etc/VPS-MX ]] && rm -rf /etc/VPS-MX &> /dev/null
verificar_arq () {
case $1 in
"menu"|"message.txt"|"ID")ARQ="${scpdir}/";; #Menu
"usercodes")ARQ="${scpusr}/";; #Panel SSRR
"C-SSR.sh")ARQ="${scpinst}/";; #Panel SSR
"openssh.sh")ARQ="${scpinst}/";; #OpenVPN
"squid.sh")ARQ="${scpinst}/";; #Squid
"dropbear.sh"|"proxy.sh"|"wireguard.sh")ARQ="${scpinst}/";; #Instalacao
"proxy.sh")ARQ="${scpinst}/";; #Instalacao
"openvpn.sh")ARQ="${scpinst}/";; #Instalacao
"ssl.sh"|"python.py")ARQ="${scpinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${scpinst}/";; #Instalacao
"Shadowsocks-libev.sh")ARQ="${scpinst}/";; #Instalacao
"Shadowsocks-R.sh")ARQ="${scpinst}/";; #Instalacao
"UDPcustom.sh"|"v2ray.sh"|"slowdns.sh")ARQ="${scpinst}/";; #Instalacao
"budp.sh")ARQ="${scpinst}/";; #Instalacao
"name")ARQ="${scpdir}/tmp/";; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${scpinst}/";; #Instalacao
*)ARQ="${scpfrm}/";; #Herramientas
esac
mv -f ${scpinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}
scpdir="/etc/VPS-MX";scpinstal="$HOME/install";scpidioma="${scpdir}/idioma";scpusr="${scpdir}/controlador";scpfrm="${scpdir}/herramientas";scpinst="${scpdir}/protocolos"
dir(){ mkdir -m 777 -p $1 &> /dev/null ; }
  dir "/etc/VPS-MX"
 dirs="${scpinstall} ${scpidioma} ${scpinst} ${scpusr} ${scpfrm}"
	for x in $dirs; do
	[[ ! -e $x ]] && mkdir -p $x &> /dev/null
	done
	wget -O $HOME/lista-arq https://raw.githubusercontent.com/PPPCrew/qwer/main/lista-arq
	for arqxx in "$(cat $HOME/lista-arq)"; do
	wget -O ${scpinstall}/${arqxx} https://raw.githubusercontent.com/PPPCrew/qwer/main/${arqxx};verificar arq "${arqxx}" &> /dev/null
	done
  cd
  chmod -R 755 /etc/VPS-MX
  rm -rf /etc/VPS-MX/MEUIPvps;dir "/etc/VPS-MX/passw";dir "/etc/VPS-MX/v2ray"
  echo "/etc/VPS-MX/menu" >/usr/bin/menu && chmod +x /usr/bin/menu;echo "/etc/VPS-MX/menu" >/usr/bin/VPSMX && chmod +x /usr/bin/VPSMX;echo "/etc/VPS-MX/menu" >/usr/bin/donpato && chmod +x /usr/bin/donpato;echo "@donpatobot" >/etc/VPS-MX/message.txt
  #UNLOKERS
dires="/usr/local/lib /usr/local/lib/ubuntn /usr/local/lib/ubuntn/apache /usr/local/lib/ubuntn/apache/ver /usr/share /usr/share/mediaptre /usr/share/mediaptre/local /usr/share/mediaptre/local/log /usr/share/mediaptre/local/log/lognull /etc/VPS-MX/B-VPS-MXuser /usr/local/megat /usr/local/include /usr/local/include/snaps /usr/local/lib/sped /usr/local/lib/rm /usr/local/libreria /usr/local/lib/rm"
	for x in $dires; do
	[[ ! -e $x ]] && mkdir -m 777 -p $x &> /dev/null
  cd /etc/VPS-MX/herramientas
  wget https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/VPS-MX.tar.gz >/dev/null 2>&1
  tar -xf speedtest_v1.tar >/dev/null 2>&1
  rm -rf speedtest_v1.tar >/dev/null 2>&1
  cd
  [[ ! -d /etc/VPS-MX/v2ray ]] && dir "/etc/VPS-MX/v2ray"
  [[ ! -d /etc/VPS-MX/Slow ]] && dir "/etc/VPS-MX/Slow"
  [[ ! -d /etc/VPS-MX/Slow/install ]] && dir "/etc/VPS-MX/Slow/install"
  [[ ! -d /etc/VPS-MX/Slow/Key ]] && dir "/etc/VPS-MX/Slow/Key"
  touch /usr/share/lognull &>/dev/null
  wget https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/SPR -O /usr/bin/SPR &>/dev/null &>/dev/null
  chmod 775 /usr/bin/SPR &>/dev/null
  wget -O /bin/rebootnb https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/rebootnb &>/dev/null
  chmod +x /bin/rebootnb
  wget -O /bin/resetsshdrop https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/resetsshdrop &>/dev/null
  chmod +x /bin/resetsshdrop
  wget -O /etc/versin_script_new https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/Version &>/dev/null
  wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/sshd &>/dev/null
  chmod 777 /etc/ssh/sshd_config
  wget -O /usr/bin/trans https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/trans &>/dev/null
  wget -O /bin/Desbloqueo.sh https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/desbloqueo.sh &>/dev/null
  chmod +x /bin/Desbloqueo.sh
  wget -O /bin/monitor.sh https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/monitor.sh &>/dev/null
  chmod +x /bin/monitor.sh
  wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/NetVPS/Multi-Script/main/LACASITAMX-v9x/Otros/estilos.css &>/dev/null
  [[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp &>/dev/null
  ufw allow 80/tcp &>/dev/null
  ufw allow 3128/tcp &>/dev/null
  ufw allow 8799/tcp &>/dev/null
  ufw allow 8080/tcp &>/dev/null
  ufw allow 81/tcp &>/dev/null
  grep -v "^PasswordAuthentication" /etc/ssh/sshd_config >/tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
  echo "PasswordAuthentication yes" >>/etc/ssh/sshd_config
  rm -rf /usr/local/lib/systemubu1 &>/dev/null
  rm -rf /etc/versin_script &>/dev/null
  v1="V10X"
  echo "$v1" >/etc/versin_script
  echo "$v1" >/etc/versin_script_new 
  echo '#!/bin/sh -e' >/etc/rc.local
  sudo chmod +x /etc/rc.local
  echo "sudo rebootnb" >>/etc/rc.local
  echo "sudo resetsshdrop" >>/etc/rc.local
  echo "sleep 2s" >>/etc/rc.local
  echo "exit 0" >>/etc/rc.local
  /bin/cp /etc/skel/.bashrc ~/
  echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/' >>/etc/profile
  echo 'clear' >>.bashrc
  echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/' >>.bashrc
  echo 'echo ""' >>.bashrc
  #
  echo 'figlet -f slant "LACASITA" |lolcat' >>.bashrc
  echo 'mess1="$(less /etc/VPS-MX/message.txt)" ' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'echo -e "\t\033[92mRESELLER : $mess1 "' >>.bashrc
  echo 'echo -e "\t\e[1;33mVERSION: \e[1;31m$(cat /etc/versin_script_new)"' >>.bashrc
  echo 'echo "" ' >>.bashrc
  echo 'echo -e "\t\033[1;100mPARA MOSTAR PANEL BASH ESCRIBA:\e[0m\e[1;41m sudo menu \e[0m"' >>.bashrc
  echo 'echo ""' >>.bashrc
  rm -rf /usr/bin/pytransform &>/dev/null
  cd /etc/VPS-MX;rm menu
  wget -q -O menu.zip https://www.dropbox.com/scl/fi/rhw5263el8b9bst6b5536/menu.zip?rlkey=q3ezlo1h2jj8apeh1eebr8taw&dl=0 &> /dev/null 2>&1
  unzip ./menu.zip

  [[ ! -e /etc/autostart ]] && {
    echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
    chmod +x /etc/autostart
  } || {
    #[[ $(ps x | grep "bot_plus" | grep -v grep | wc -l) != '0' ]] && wget -qO- https://raw.githubusercontent.com/carecagm/main/Install/ShellBot.sh >/etc/SSHPlus/ShellBot.sh
    for proc in $(ps x | grep 'dmS' | grep -v 'grep' | awk {'print $1'}); do
      screen -r -S "$proc" -X quit
    done
    screen -wipe >/dev/null
    echo '#!/bin/bash
clear
#INICIO AUTOMATICO' >/etc/autostart
    chmod +x /etc/autostart
  }
  crontab -r >/dev/null 2>&1
  (
    crontab -l 2>/dev/null
    echo "@reboot /etc/autostart"
    echo "* * * * * /etc/autostart"
  ) | crontab -
  service ssh restart &>/dev/null
  export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games/
  rm -rf /usr/bin/pytransform &>/dev/null
  rm -rf VPS-MX.sh
  rm -rf lista-arq
  service ssh restart &>/dev/null
  echo -e "\n\e[1;92m             [✓] INSTALACIÓN EXITOSA [✓]\n"
  echo -e "      \e[1;33mUse el comando: "
  echo -e "                      \033[1;41m  menu  \033[0;37m\n"
token="6628971386:AAETlAT26YC0JXbcnsQ6nm7Tm0H4uqiWfhg";[[ -z $id ]] && id="6456812024"
                patobot="───── ❝ ⚡Nꮻꭲꮖ-Ꮲꭺꭲꮻ⚡ ❞ ─────

📍 𝑵𝒐𝒕𝒊𝒇𝒊𝒄𝒂𝒄𝒊𝒐𝒏 𝒅𝒆 𝒊𝒏𝒔𝒕𝒂𝒍𝒂𝒄𝒊𝒐𝒏 𝒏𝒖𝒆𝒗𝒂 📍

──── ❝ 🚀𝙇𝘼𝘾𝘼𝙎𝙄𝙏𝘼𝙈𝙓🚀 ❞ ────

┣▇▇▇═─ •𝙄𝙋: $(wget -qO- ipv4.icanhazip.com)
┣▇▇▇═─ •𝙄𝘿: $id
┣▇▇▇═─ •𝙎𝙇𝙊𝙂𝘼𝙉: @donpatobot
┣▇▇▇═─ •𝙁𝙀𝘾𝙃𝘼:$_fecha
┣▇▇▇═─ •𝙃𝙊𝙍𝘼: $_hora
┣▇▇▇═─ •𝙆𝙀𝙔: $Key

──── ❝ ⚡💎𝕔𝕣𝕖𝕕𝕚𝕥𝕠𝕤💎⚡ ❞ ────

•𝙋𝙧𝙞𝙣𝙘𝙞𝙥𝙖𝙡𝙚𝙨: @kalix1, @Rufu99.
•𝙍𝙖𝙢𝙖𝙨 𝙙𝙚𝙡 𝙢𝙤𝙙: @drowkid01.

───── ❝ ⚡Nꮻꭲꮖ-Ꮲꭺꭲꮻ⚡ ❞ ─────"
                        url="https://api.telegram.org/bot$token/sendMessage";curl -s --max-time 10 -d "chat_id=$id&disable_web_page_preview=1&text=$patobot" $url &>/dev/null
