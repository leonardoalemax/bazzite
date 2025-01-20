#!/bin/bash

set -ouex pipefail
dnf install -y tmux

dnf install -y qt5-qtbase-devel
dnf install -y qt5-qtquickcontrols2 
dnf install -y qt5-qtquickcontrols
dnf install -y qt5-qtgraphicaleffects

dnf install -y syncthing

dnf install -y zsh

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

ostree container commit