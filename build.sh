#!/bin/bash

set -ouex pipefail
dnf install -y tmux

dnf install -y qt5-qtbase-devel
dnf install -y qt5-qtquickcontrols2 
dnf install -y qt5-qtquickcontrols
dnf install -y qt5-qtgraphicaleffects

dnf install -y syncthing

printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee /etc/yum.repos.d/vscodium.repo
rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg

dnf install -y codium

dnf install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

rm /etc/sddm.conf.d/steamos.conf
rm /etc/sddm.conf.d/virtualkbd.conf

systemctl disable bazzite-autologin.service
systemctl enable ublue-update.timer

ostree container commit