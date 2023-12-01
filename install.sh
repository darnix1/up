#!/bin/bash

# Verificar el sistema operativo
if [ -f /etc/debian_version ]; then
    # Paso 01 para Debian
    sudo apt-get update
sudo apt-get install -y build-essential libsqlite3-dev zlib1g-dev libncurses5-dev libgdbm-dev libbz2-dev libreadline5-dev libssl-dev libdb-dev make
sudo apt-get install -y build-essential
sudo apt-get install make -y
    # Paso 02
    wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
    sudo mv Python-2.7.3.tgz /usr/src
    cd /usr/src
    sudo tar -xzf Python-2.7.3.tgz

    # Paso 03
    cd Python-2.7.3

    # Paso 04
    ./configure --prefix=/usr --enable-shared
fi

# Resto de las instrucciones
# ...

#echo "El script ha completado su ejecución."
