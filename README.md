# 🚀 n8n + Evolution API Setup

Este repositorio contiene los archivos necesarios para desplegar una instancia funcional de n8n junto con Evolution API en una VPS.

## 📁 Estructura
- `setup.sh`: Script de instalación automatizada.
- `docker-compose.yml`: Define los servicios n8n y Evolution API.
- `.env.example`: Variables de entorno editables.
- `iptables.rules`: Reglas básicas de iptables.

## ⚙️ Requisitos
- VPS con Ubuntu/Debian
- Docker y Docker Compose instalados
- **Cuenta en ngrok** para obtener un dominio público (necesario para integrar servicios externos como Google Calendar)
  - Regístrate en https://ngrok.com
  - Obtén tu **token de autenticación** en el dashboard de ngrok
  - Copia el token en el archivo `.env`

## 🚀 Instalación
1. Clona el repositorio y entra al directorio:
   ```bash
   git clone <URL_REPO>
   cd n8n-setup

2. Copia y edita el archivo .env
cp .env.example .env
vi .env

Sustituye:

NGROK_AUTHTOKEN por tu token de ngrok
Credenciales de n8n (N8N_USER, N8N_PASSWORD)
Configuración de Evolution API si es necesario

3. Ejecuta el script:

chmod +x setup.sh
source .env
./start_n8n_services.sh

chmod +x stop_evolution.sh
./stop_n8n_services.sh


4. Accede a:

n8n → http://<IP_VPS>:5678
Evolution API → http://<IP_VPS>:8080
ngrok → revisa el dashboard para ver tu URL pública

🔗 ¿Por qué ngrok?
n8n necesita un dominio público accesible para recibir webhooks y conectarse con servicios externos como Google Calendar. ngrok crea un túnel seguro y te da una URL pública que puedes usar en las integraciones.


Recuerda abrir todos esos puertos en el security-group que tengas asociado a tu eni dentro de tu vps publica.

