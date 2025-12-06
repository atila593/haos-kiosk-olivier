################################################################################
# Add-on: HAOS Kiosk Display (haoskiosk)
# File: Dockerfile
# Version: 1.1.1 (MODIFIED + s6-overlay)
# Copyright Jeff Kosowsky
# Date: December 2025
################################################################################

ARG BUILD_FROM
FROM $BUILD_FROM

# -------------------------------
# Installer s6-overlay
# -------------------------------
ARG S6_OVERLAY_VERSION=v3.2.0.3
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / \
    && rm /tmp/s6-overlay-amd64.tar.gz

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

RUN chmod a+x /run.sh \
    && patch -p2 /usr/share/luakit/lib/unique_instance.lua < /usr/share/luakit/lib/unique_instance.patch \
    && pip install --no-cache-dir --break-system-packages aiohttp

# -------------------------------
# Configurer le service s6 pour run.sh
# -------------------------------
# Crée le dossier services/run.sh avec le fichier run exécutable
RUN mkdir -p /etc/services.d/run.sh \
    && echo '#!/usr/bin/execlineb -P\n/run.sh' > /etc/services.d/run.sh/run \
    && chmod +x /etc/services.d/run.sh/run

# -------------------------------
# Entrypoint via s6-overlay
# -------------------------------
ENTRYPOINT ["/init"]

