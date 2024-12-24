#!/bin/sh

case ${1} in
	"r"|"remove") sudo rm /etc/systemd/system/downloadsort.service /usr/bin/DownloadSort.sh ;;
	"i"|"install") sudo cp downloadsort.service /etc/systemd/system/downloadsort.service; sudo cp DownloadSort.sh /usr/bin/DownloadSort.sh ;;
	"s"|"start") sudo systemctl start downloadsort.service ;;
	"k"|"kill") sudo systemctl stop downloadsort.service ;;
	*) echo "install.sh [r/remove] to remove\ninstall.sh [i/install] to install" ;;
esac
