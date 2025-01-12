#!/usr/bin/bash


#Array declarations

declare -a suckdep    #Dependencies for suckless software
declare -A suckless   #Suckless software per se

#Variable and array assignation

maindir=$(pwd)   #takes note of current directory

suckdep[0]="build-essential"
suckdep[1]="libc6"
suckdep[2]="libfontconfig-dev"
suckdep[3]="libx11-dev"
suckdep[4]="libxft-dev"
suckdep[5]="libxinerama-dev"

suckless["st"]="https://github.com/PibeCaverna/FST" 
suckless["slstatus"]="https://github.com/PibeCaverna/FSLSTATUS" 
suckless["dmenu"]="https://github.com/PibeCaverna/FDMENU" 
suckless["dwm"]="https://github.com/PibeCaverna/FDWM"


#Installs suckless software dependencies

for i in "${!suckdep[@]}"
do
  apt-get install -y "${suckdep[$i]}"
done

rm -r /usr/src/* #empties /usr/src/, may change to just run it after a flag
cd /usr/src/     # cds to /usr/src/ to install suckless utilities

#Clones and install suckless utilities
for i in "${!suckless[@]}";
do
  git clone "${suckless[$i]}" "$i"
  echo "cloning" "$i" "from" "${suckless[$i]}"
  cd "$i"
  make clean install
  cd /usr/src/
  echo "installed" "$i" 
done

#Returns to main directory
cd "$maindir"

#Copies .xinitrc to home
cp .xinitrc ~/

