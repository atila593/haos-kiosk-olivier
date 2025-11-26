# Assurez-vous d'utiliser la bonne image de base pour votre OS (debian ou alpine)
# Correction 1: Définit ARCH comme argument pour contourner l'erreur "invalid reference format: must be lowercase"
ARG BUILD_FROM
FROM ghcr.io/home-assistant/${ARCH}-base:latest

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

# Définir le script par défaut
CMD ["/run.sh"]
