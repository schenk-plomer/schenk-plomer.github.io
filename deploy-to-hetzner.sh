#!/bin/bash

SERVER_IP="46.225.91.144"
REMOTE_PATH="/opt/schenk-plomer"
LOCAL_DIR="/Users/maxischwaiger/Desktop/Schenk und Plomer HP/schenk-plomer.github.io"

echo "=========================================================="
echo "🚀 Starte Deployment für Schenk & Plomer auf Hetzner Cloud"
echo "=========================================================="

echo "1/3 Erstelle Zielverzeichnis auf dem Server (Passwort wird ggf. abgefragt)..."
ssh root@$SERVER_IP "mkdir -p $REMOTE_PATH"

echo "2/3 Kopiere Dateien auf den Server (Passwort wird ggf. abgefragt)..."
rsync -avz --exclude '.git' --exclude '.DS_Store' "$LOCAL_DIR/" root@$SERVER_IP:$REMOTE_PATH/

echo "3/3 Starte Docker Container auf dem Server (Passwort wird ggf. abgefragt)..."
ssh root@$SERVER_IP "cd $REMOTE_PATH && docker compose up -d"

echo "=========================================================="
echo "✅ Deployment erfolgreich abgeschlossen!"
echo "Du kannst jetzt im Nginx Proxy Manager (http://$SERVER_IP:81) einen neuen 'Proxy Host' anlegen:"
echo "- Domain Names: schenk-plomer.de (oder deine gewünschte Domain)"
echo "- Forward Hostname/IP: schenk-plomer-web"
echo "- Forward Port: 80"
echo "=========================================================="
