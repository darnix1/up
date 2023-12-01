#!/bin/bash

# Nombre del archivo de salida
log_file="instalacion_python.log"

# Función para imprimir mensajes con el formato deseado
print_message() {
  echo "Instalando Python: $1"
}

# Función para ejecutar comandos y redirigir la salida al archivo de log
run_command() {
  print_message "$1"
  eval $1 >> $log_file 2>&1
  if [ $? -eq 0 ]; then
    print_message "Éxito"
  else
    print_message "Error. Consulta $log_file para más detalles."
    exit 1
  fi
}

# Paso 01
run_command "sudo apt-get install -y build-essential libsqlite3-dev zlib1g-dev libncurses5-dev libgdbm-dev libbz2-dev libreadline5-dev libssl-dev libdb-dev"

# Paso 02
run_command "wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz"
run_command "sudo mv Python-2.7.3.tgz /etc"
run_command "cd /etc"
run_command "sudo tar -xzf Python-2.7.3.tgz"

# Paso 03
run_command "cd Python-2.7.3"

# Paso 04
run_command "./configure --prefix=/usr --enable-shared"

# Paso 05
run_command "sudo make"

# Paso 06
run_command "sudo make install"

# Paso 07
run_command "python2 --version"
