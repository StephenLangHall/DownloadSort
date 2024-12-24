#!/bin/sh

case ${1} in
	"r"|"remove") sudo rm /etc/systemd/system/downloadsort.service /usr/bin/DownloadSort.sh ;;
	"i"|"install") sudo cp downloadsort.service /etc/systemd/system/downloadsort.service; sudo cp DownloadSort.sh /usr/bin/DownloadSort.sh ;;
	*) echo "install.sh [r/remove] to remove\ninstall.sh [i/install] to install" ;;
esac
