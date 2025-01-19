FROM ghcr.io/ublue-os/bazzite-deck-gnome:stable

COPY build.sh /tmp/build.sh
COPY sddm.conf /tmp/sddm.conf

COPY theme /tmp/theme

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit && \
    bootc container lint
    
