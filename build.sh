#!/bin/bash

set -ouex pipefail
dnf install -y tmux

dnf install -y qt5-qtbase-devel
dnf install -y qt5-qtquickcontrols2 
dnf install -y qt5-qtquickcontrols
dnf install -y qt5-qtgraphicaleffects

dnf install -y syncthing

rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
dnf install -y codium

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

ostree container commit