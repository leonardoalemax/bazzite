#!/bin/bash

set -ouex pipefail
dnf install -y tmux

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

sudo tar -xzvf ~/Downloads/sddm-sober.tar.gz -C /usr/share/sddm/themes

systemctl disable sddm
systemctl enable gdm

ostree container commit