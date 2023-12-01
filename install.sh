#!/bin/bash

# Paso 01
sudo apt-get install -y build-essential libsqlite3-dev zlib1g-dev libncurses5-dev libgdbm-dev libbz2-dev libreadline5-dev libssl-dev libdb-dev

# Paso 02
wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
sudo mv Python-2.7.3.tgz /etc
cd /etc
sudo tar -xzf Python-2.7.3.tgz

# Paso 03
tar -xzf Python-2.7.3.tgz

# Paso 04
cd Python-2.7.3

# Paso 05
./configure --prefix=/usr --enable-shared

# Paso 06
sudo make

# Paso 07
sudo make install

# Paso 08
python2 --version
