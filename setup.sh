#!/bin/bash
set -e

echo "🚀 Iniciando instalación del entorno..."

# Actualizar paquetes
sudo apt update && sudo apt upgrade -y

# Instalar Docker
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Instalar ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
sudo mv ngrok /usr/local/bin/
rm ngrok-stable-linux-amd64.zip

# Autenticación ngrok
if [ -z "$NGROK_AUTHTOKEN" ]; then
  echo "⚠️ NGROK_AUTHTOKEN no está definido. Exporta la variable o edita el archivo .env"
else
  ngrok config add-authtoken $NGROK_AUTHTOKEN
fi

# Aplicar reglas iptables
sudo iptables-restore < iptables.rules

# Crear red Docker
docker network inspect n8n-net >/dev/null 2>&1 || docker network create n8n-net

# Levantar contenedores
docker-compose up -d

echo "✅ Entorno desplegado correctamente."
