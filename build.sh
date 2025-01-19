#!/bin/bash

set -ouex pipefail
dnf install -y tmux 

systemctl enable podman.socket

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer