#!/bin/bash

function first_setup(){
    echo "Instalando, por favor espera..."

    timedatectl set-timezone Asia/Jakarta
    echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
    echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

    if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
        sudo apt update -y > /dev/null
        apt-get install --no-install-recommends software-properties-common > /dev/null
        add-apt-repository ppa:vbernat/haproxy-2.0 -y > /dev/null
        apt-get -y install haproxy=2.0.* > /dev/null
    elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
        curl https://haproxy.debian.net/bernat.debian.org.gpg |
            gpg --dearmor >/usr/share/keyrings/haproxy.debian.net.gpg
        echo deb "[signed-by=/usr/share/keyrings/haproxy.debian.net.gpg]" \
            http://haproxy.debian.net buster-backports-1.8 main \
            >/etc/apt/sources.list.d/haproxy.list
        sudo apt-get update > /dev/null
        apt-get -y install haproxy=1.8.* > /dev/null
    else
        echo -e "Tu sistema operativo no es compatible ($(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g') )"
        exit 1
    fi

    print_success "Instalación exitosa."
}

function print_success(){
    echo -e "\e[92m$1\e[0m"  # Imprime el mensaje de éxito en verde
}
