ARG BUILD_FROM
FROM $BUILD_FROM

# Installation des dépendances graphiques et de Firefox
RUN apk update && apk add --no-cache \
    xorg-server \
    xf86-video-modesetting \
    xf86-input-libinput \
    libinput \
    udev \
    libinput-udev \
    libevdev \
    mesa-dri-gallium \
    mesa-egl \
    mesa-gles \
    libdrm \
    libxkbcommon \
    ttf-dejavu \
    util-linux \
    xdotool \
    xinput \
    xrandr \
    xset \
    unclutter-xfixes \
    setxkbmap \
    openbox \
    bash \
    # Navigateur Firefox
    firefox-esr \ 
    gtk3 \
    libstdc++ \
    libffi \
    && rm -rf /var/cache/apk/*

ENV DISPLAY=:0

# Copie et permission du script de démarrage
COPY run.sh /
RUN chmod a+x /run.sh

CMD ["/run.sh"]
