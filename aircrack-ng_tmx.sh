#!/bin/bash

  #variables
                red='\033[1;31m'
                green='\033[1;32m'
                yellow='\033[1;33m'
                blue='\033[1;34m'                                    magenta='\033[1;35m'                                 cyan='\033[1;36m'                                    reset='\033[0m'
clear

printf $yellow

            figlet    -f smslant.flf   Aircrack-ng
echo
echo

printf $green
echo "INSTALANDO DEPENDENCIAS DE AIRCRACK-NG"
sleep 2.5
echo
echo
printf $reset
pkg install wget -y
apt install libc++ libnl libpcap libsqlite openssl pcre zlib -y

#arquitectura de dispositivos

case `dpkg --print-architecture` in                  aarch64)                                                 architectureURL="binary-aarch64/aircrack-ng_3_1.7_aarch64" ;;                       
arm)                                                     architectureURL="binary-arm/aircrack-ng_3_1.7_arm" ;;                         
 i*86)                                                    architectureURL="binary-i686/aircrack-ng_3_1.7_i686" ;;
x86_64)                                                  architectureURL="binary-x86_64/aircrack-ng_3_1.7_x86_64" ;;
*)
    echo "unknown or unsupported architecture"     
esac 
printf $green
echo
echo "INSTALANDO AIRCRACK-NG"
sleep 2.5
printf $reset
echo
wget https://github.com/venom-24/aircrack-ng_termux/raw/refs/heads/main/termux/aircrack-ng/${architectureURL}.deb


case `dpkg --print-architecture` in                  aarch64)
    architectureURL="aarch64" ;;                           
arm)
    architectureURL="arm" ;;                        

i*86)
     architectureURL="i686" ;;   

x86_64)                                                  architectureURL="x86_64" ;;                                          
*)                                                       echo "unknown or unsupported architecture"
esac

dpkg -i aircrack-ng_3_1.7_${architectureURL}.deb
echo
printf $cyan
echo "AIRCRACK-NG SE INSTALO CON EXITO"

printf $green
echo "INICIA LA SUITE ESCRIBIENDO EL COMANDO"
printf $cyan 
echo "aircrack-ng"
printf $reset
