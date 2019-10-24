#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
	else
	clear
  echo "KeyboardVisualizer Installation"
	sudo apt update
	sudo apt autoremove -y
  sudo apt install build-essential gcc make qt5-qmake git -y
	mkdir KeyboardVisualizer
  cd KeyboardVisualizer
  mkdir opt
  cd opt
	git clone https://github.com/CalcProgrammer1/KeyboardVisualizer.git
	cd KeyboardVisualizer
	qmake -makefile
	make
	wget https://raw.githubusercontent.com/AlexProgrammerDE/KeyboardVisualizer-Installer/master/Icon.xpm
  cd ..
  cd ..
  mkdir usr
  cd usr
  mkdir share
  cd share
  mkdir applications
  cd applications
	wget https://raw.githubusercontent.com/AlexProgrammerDE/KeyboardVisualizer-Installer/master/KeyboardVisualizer.desktop
	cd ..
  cd ..
  cd ..
  mkdir DEBIAN
  cd DEBIAN
  cat <<EOF >> control
  Package: KeyboardVisualizer
  Version: 2.0
  Architecture: all
  Maintainer: AlexProgrammerDE
  Installed-Size: 100
  Homepage: https://github.com/AlexProgrammerDE/KeyboardVisualizer-Installer
  Description: The Inoffical installer for: https://github.com/CalcProgrammer1/KeyboardVisualizer
  EOF
  cd ..
  dpkg -b KeyboardVisualizer
  
fi
