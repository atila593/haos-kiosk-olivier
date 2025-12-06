################################################################################
# Add-on: HAOS Kiosk Display (haoskiosk)
# File: Dockerfile
# Version: 1.1.1 (FINAL for HA)
# Copyright Jeff Kosowsky
# Date: December 2025
################################################################################

ARG BUILD_FROM
FROM $BUILD_FROM

# -------------------------------
# Installer les dépendances
# -------------------------------
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
    onboard \
    py3-pip \
    python3-tkinter \
    patch \
    bash \
    gstreamer \
    gst-plugins-base \
    gst-plugins-good \
    gst-plugins-ugly \
    gst-plugins-bad \
    && apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v3.21/community luakit=2.3.6-r0 \
    && rm -rf /var/cache/apk/*

# -------------------------------
# Variables d'environnement
# -------------------------------
ENV DISPLAY=:0

# -------------------------------
# Copier les fichiers
# -------------------------------
COPY xorg.conf.default /etc/X11/
COPY userconf.lua /root/.config/luakit/
COPY run.sh /run.sh
COPY toggle_keyboard.py rest_server.py /
COPY unique_instance.patch /usr/share/luakit/lib

# -------------------------------
# Rendre les scripts exécutables et patcher Luakit
# -------------------------------
RUN chmod a+x /run.sh \
    && patch -p2 /usr/share/luakit/lib/unique_instance.lua < /usr/share/luakit/lib/unique_instance.patch \
    && pip install --no-cache-dir --break-system-packages aiohttp

# -------------------------------
# Lancer le script principal
# -------------------------------
CMD ["/run.sh"]
