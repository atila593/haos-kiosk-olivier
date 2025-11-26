# Utilise la variable standard BUILD_FROM fournie par le Superviseur
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Installer Firefox et codecs vidéo (CORRECTION: Utilisation de 'apk' pour Alpine)
# Utilise les noms de paquets Alpine équivalents à votre liste d'origine
RUN apk update && \
    apk add --no-cache \
        firefox-esr \
        ffmpeg \
        xorg-server \
        xinit \
        xset \
        dbus-x11 \
        mesa-utils \
        ttf-dejavu \
    && rm -rf /var/cache/apk/*

# Copier le script run.sh
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Définir le script par défaut
CMD ["/run.sh"]
