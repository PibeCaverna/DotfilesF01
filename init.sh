#!/usr/bin/bash

#rm -r /usr/src/*

maindir=$(pwd)

declare -A suckless

suckless["st"]="https://github.com/PibeCaverna/FST" 
suckless["slstatus"]="https://github.com/PibeCaverna/FSLSTATUS" 
suckless["dmenu"]="https://github.com/PibeCaverna/FDMENU" 
suckless["dwm"]="https://github.com/PibeCaverna/FDWM"

fff="https://github.com/dylanaraps/fff"

cd /usr/src/
for i in "${!suckless[@]}";
do
  #git clone "${suckless[$i]}" "$i"
  #echo "$i" "de" "${suckless[$i]}" "clonado"
  cd "$i"
  make clean install
  cd ..
  echo "$i" "instalado"
done
#git clone "$fff" fff
cd fff
make PREFIX=/usr/local install
cd "$maindir"
ls
