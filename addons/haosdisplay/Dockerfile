# Utilise la variable standard BUILD_FROM fournie par le Superviseur
ARG BUILD_FROM
FROM ${BUILD_FROM}

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
