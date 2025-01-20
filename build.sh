#!/bin/bash

set -ouex pipefail
dnf install -y tmux

dnf install -y qt5-qtbase-devel
dnf install -y qt5-qtquickcontrols2 
dnf install -y qt5-qtquickcontrols
dnf install -y qt5-qtgraphicaleffects

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

cp -r /tmp/theme/plasma-chili /usr/share/sddm/themes/plasma-chili

cp /tmp/sddm.conf /etc/sddm.conf

ostree container commit