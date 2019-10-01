#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
	else
	clear
  	echo"KeyboardVisualizer Installation"
	sudo apt update
	sudo apt upgrade -y
	sudo apt autoremove -y
  	sudo apt install build-essential gcc make qt5-qmake git -y
	cd /opt/
	git clone https://github.com/CalcProgrammer1/KeyboardVisualizer.git
	cd KeyboardVisualizer
	qmake -makefile
	make
	wget https://raw.githubusercontent.com/AlexProgrammerDE/KeyboardVisualizer-Installer/master/Icon.xpm
	wget https://raw.githubusercontent.com/AlexProgrammerDE/KeyboardVisualizer-Installer/master/KeyboardVisualizer.desktop
	sudo mv KeyboardVisualizer.desktop /usr/share/applications/
	./KeyboardVisualizer
fi
