# Base image officielle Home Assistant
FROM ghcr.io/home-assistant/amd64-base:latest

# Installer Firefox et codecs vidéo
RUN apt-get update && \
    apt-get install -y firefox-esr \
                       ffmpeg \
                       gstreamer1.0-plugins-base \
                       gstreamer1.0-plugins-good \
                       gstreamer1.0-plugins-bad \
                       gstreamer1.0-plugins-ugly \
                       gstreamer1.0-libav \
                       x11-xserver-utils \
                       xinit \
                       xvfb \
                       dbus-x11 \
                       mesa-utils \
                       fonts-dejavu \
                       --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copier le script run.sh
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Dossier de configuration de HAOS Kiosk
COPY config.json /data/options.json

# Définir le script par défaut
CMD ["/run.sh"]
