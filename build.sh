#!/bin/bash

set -ouex pipefail
dnf install -y tmux

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

tar -xzvf /tmp/theme/sugar-dark.tar.gz -C /usr/share/sddm/themes

cp /temp/sddm.conf /etc/sddm.conf

systemctl restart sddm.service

ostree container commit