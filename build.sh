#!/bin/bash

set -ouex pipefail
dnf install -y tmux

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

cp /tmp/theme/sugar-dark /usr/share/sddm/themes/sugar-dark

cp /temp/sddm.conf /etc/sddm.conf

systemctl restart sddm.service

ostree container commit