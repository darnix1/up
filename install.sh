#!/bin/bash
# Edition : Stable Edition V1.0
# Auther  : Muh Aripin Ilham
# (C) Copyright 2024-2024 By Under Tunnel
# =========================================
#!/bin/bash                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                #!/bin/bash
clear
RED='\033[0;31m'
NC='\033[0m'
BLUE="\033[36m"
GREEN='\033[0;32m'
grenbo="\e[92;1m"
UUID=$(tr </dev/urandom -dc a-z | head -c8)
echo -e "   ┌──────────────────────────────────────────┐\033[0m"
echo -e "   │\033[0m\033[101m        BOT  AUTOSCRIPT  TELEGRAM         \033[0m|\033[0m"
echo -e "   └──────────────────────────────────────────┘\033[0m"
echo -e "            Telegram Bot Setup menu"
echo -e "          make vpn in the telegram bot"
echo -e "──────────────────────────────────────────────────"
echo -e "   ${BLUE}get this value from @BotFather, required${NC}"
echo -e "    ${BLUE}take your id at @MissRose_bot,cmd (/id)${NC}"
echo -e "  ${BLUE}Tutorial? Join in the @undersTnl group${NC}"
echo -e "       ==>> CTRL + C GO TO BACK <<=="
echo -e ""
echo -e "            CONTOH : t.me/rullpqh"
echo -e "         CONTOH : wa.me/6281584099035"
echo -e "           ────────────────────────"
read -e -p "Input your Bot Token : " TOKET
read -e -p "Input your Id Telegram : " IDTELE
read -e -p "Input your Whstapp : " WHSTAP
read -e -p "Input your Telegram : " TELE


update_python() {
    echo "update repository python"
    apt install python3 python3-pip -y
    wget https://raw.githubusercontent/UnderTunnel/sc/mmk/main/regis.zip
    unzip regis.zip
}

main() {
    update_python
    cd /root/regis/shell
    chmod +x *
    cp * /usr/bin
    pip3.8 install -r /root/regis/requirements.txt
    cd 
    cat >/usr/bin/jhhhhh <<EOF
#!/bin/bash

cd 
python3.8 -m regis
EOF
    chmod +x /usr/bin/jhhhhh
    cat >/etc/systemd/system/regggg.service <<EOF
[Unit]
Description=FTVPN BOT 
Documentation=ftvpn
After=syslog.target network-online.target

[Service]
User=root
NoNewPrivileges=true
ExecStart=/usr/bin/jhhhhh

[Install]
WantedBy=multi-user.target

EOF
    cat >id <<EOF
TELEGRAM="$TELE" #CONTOH t.me/rullpqh
WHATSAPP="$WHSTAP"  #CONTOH wa.me/6281584099035
EOF
    cat >regis/var.txt <<EOF
BOT_TOKEN="$TOKET"
ADMIN="$IDTELE"
SESSIONS="${UUID}"
EOF
    systemctl daemon-reload
    systemctl stop regggg
    systemctl enable regggg
    systemctl start regggg
    systemctl restart regggg
    clear
#    systemctl status regggg
}
main "$@"
echo " Bot Sukses di Install.."
