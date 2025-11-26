#!/usr/bin/env bash

echo "######## Starting HAOS Kiosk Mod - Firefox ########"

# Options depuis config.json
OPTIONS_FILE="/data/options.json"

HA_URL=$(jq -r '.ha_url' $OPTIONS_FILE)
DASHBOARD=$(jq -r '.ha_dashboard' $OPTIONS_FILE)
LOGIN_DELAY=$(jq -r '.login_delay' $OPTIONS_FILE)
ZOOM_LEVEL=$(jq -r '.zoom_level' $OPTIONS_FILE)

# Lancer Xorg en arrière-plan (virtuel si nécessaire)
Xvfb :0 -screen 0 1920x1080x24 &

export DISPLAY=:0

# Petit délai avant login
sleep $LOGIN_DELAY

# Lancer Firefox en mode kiosque
firefox-esr --kiosk "$HA_URL/$DASHBOARD" --width 1920 --height 1080 &

# Garder le conteneur actif
tail -f /dev/null
