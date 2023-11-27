#!/bin/bash
merah="\033[1;31m"  #REDTERANG
akuu="\033[33m"  #yello
##

clear

## HadesxVPN
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
z="\033[96m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
##Logo
# // Checking Os Architecture
if [[ "$(uname -m)" == "x86_64" || "$(uname -m)" == "arm64" ]]; then
    echo -e "${OK} Your Architecture Is Supported ( ${green}$(uname -m)${NC} )"
else
    echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$(uname -m)${NC} )"
    exit 1
fi
