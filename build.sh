#!/bin/bash

set -ouex pipefail
dnf install -y tmux

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

cp -r /tmp/theme/plasma-chili /usr/share/sddm/themes/plasma-chili

cp /tmp/sddm.conf /etc/sddm.conf

ostree container commit