#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
	else
	clear
  	echo"KeyboardVisualizer Installation"
  	sudo apt install buil-essential gcc make qt5-qmake git -y
	git clone https://github.com/CalcProgrammer1/KeyboardVisualizer.git
	cd KeyboardVisualizer
	qmake -Makefile
	make
	
fi

