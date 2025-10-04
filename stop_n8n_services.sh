#!/bin/bash
echo "Stopping and removing all evolution_api containers and volumes..."
docker-compose down -v
echo "Cleanup complete."

