#!/usr/bin/bash
#Array declarations

declare -a suckdep    #Dependencies for suckless software
declare -a basepkgs   #Base packages to use
declare -A suckless   #Suckless software per se
declare -a othrpkgs   #other pachages that I want installed

#Variable and array assignation

maindir=$(pwd)   #takes note of current directory

suckdep[0]="build-essential"
suckdep[1]="libc6"
suckdep[2]="libfontconfig-dev"
suckdep[3]="libx11-dev"
suckdep[4]="libxft-dev"
suckdep[5]="libxinerama-dev"
suckdep[6]="xinit"

basepkgs[0]="wget"
basepkgs[1]="zip"
basepkgs[2]="unzip"
basepkgs[3]="neovim"
basepkgs[4]="lf"
basepkgs[5]="curl"
basepkgs[6]="xclip"
basepkgs[7]="zig"

suckless["st"]="https://github.com/PibeCaverna/FST" 
suckless["slstatus"]="https://github.com/PibeCaverna/FSLSTATUS" 
suckless["dmenu"]="https://github.com/PibeCaverna/FDMENU" 
suckless["dwm"]="https://github.com/PibeCaverna/FDWM"

othrpkgs[0]="gimp"
othrpkgs[1]="inkscape"
othrpkgs[2]="sxiv"
othrpkgs[3]="vlc"
othrpkgs[4]="blender"
othrpkgs[5]="libreoffice"
othrpkgs[6]="texlive-full"
othrpkgs[7]="zathura"
othepkgs[8]="tmux"

#Installs suckless software dependencies

for i in "${!suckdep[@]}"
do
  apt-get -qq install -y "${suckdep[$i]}"
done

#install "basic" packages
for i in "${!basepkgs[@]}"
do
  apt-get -qq install -y "${basepkgs[$i]}"
done

#Installs Hack NerdFont

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
unzip -d /usr/share/fonts Hack.zip
fc-cache -f -v

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

#installs ly display manager
apt install libpam0g-dev libxcb-xkb-dev
git clone https://github.com/fairyglade/ly
cd ly 
zig build
zig build installsystemd
systemctl enable ly.service

#installs some nice to have packages

for i in "${!othrpkgs[@]}"
do 
  apt-get -qq install -y "${othrpkgs[$i]}"
done

#Brave browser install

curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser

#then you should be done, for custom configs just move everything in the config folder to your home's .config
