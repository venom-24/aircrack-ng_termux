#!/bin/bash

echo "instalando dependencias de aircrack-ng"

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

wget https://raw.githubusercontent.com/pitube08642/aircrack-ng-for-termux/main/dists/termux/aircrack-ng/${architectureURL}.deb

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


