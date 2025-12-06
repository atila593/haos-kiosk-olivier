#!/bin/bash
set -e

# Log de démarrage pour vérifier que le script tourne
echo "RUN.SH STARTED at $(date)" >> /tmp/run_test.log

# Optionnel : patch clavier ou X11
setxkbmap fr

# Lancer Luakit (ou ton navigateur personnalisé)
luakit &

# Lancer ton serveur REST si nécessaire
python3 /rest_server.py &

# Optionnel : empêcher la fin du script pour garder le container actif
tail -f /dev/null
