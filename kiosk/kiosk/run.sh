#!/usr/bin/env bash
set -e

# ---- Load config ----
HA_URL=${HA_URL:-"http://homeassistant.local:8123"}
BROWSER_REFRESH=${BROWSER_REFRESH:-600}

# ---- Start Xorg ----
echo "[INFO] Starting X server..."
Xorg :0 -nolisten tcp &
sleep 2
export DISPLAY=:0

# ---- Start Firefox Kiosk ----
echo "[INFO] Starting Firefox in kiosk mode..."
firefox --kiosk "$HA_URL" &

# ---- Hide cursor ----
unclutter -idle 5 -root &

# ---- Auto-refresh loop ----
while true; do
    sleep $BROWSER_REFRESH
    xdotool key F5
done
