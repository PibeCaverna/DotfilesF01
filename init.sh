#!/usr/bin/bash

rm -r /usr/src/* #Vacia src, habria que buscar alguna forma de que sea solo una flag

maindir=$(pwd)   #Toma el directorio desde el cual se corre el script, así se puede volver

#El array que da a todos los repos suckless
declare -A suckless
suckless["st"]="https://github.com/PibeCaverna/FST" 
suckless["slstatus"]="https://github.com/PibeCaverna/FSLSTATUS" 
suckless["dmenu"]="https://github.com/PibeCaverna/FDMENU" 
suckless["dwm"]="https://github.com/PibeCaverna/FDWM"

#El array que da al repo de fff
fff="https://github.com/dylanaraps/fff"

cd /usr/src/ #Va a /usr/src/ donde vamos a tener todas las fuentes

#Bucle que descarga e instala el software suckless
for i in "${!suckless[@]}";
do
  #git clone "${suckless[$i]}" "$i"
  #echo "$i" "de" "${suckless[$i]}" "clonado"
  cd "$i"
  make clean install
  cd ..
  echo "$i" "instalado"
done

#Bucle que descarga e instala fff
git clone "$fff" fff
cd fff
make PREFIX=/usr/local install

#Retorno al directorio principal
cd "$maindir"

