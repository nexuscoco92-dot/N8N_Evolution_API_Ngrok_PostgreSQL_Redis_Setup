#!/bin/bash

# Stop and remove existing n8n container if it exists
if [ "$(docker ps -q -f name=n8n)" ]; then
    echo "Stopping existing n8n container..."
    docker stop n8n
fi

if [ "$(docker ps -a -q -f name=n8n)" ]; then
    echo "Removing existing n8n container..."
    docker rm n8n
fi

# Remove n8n_data volume if it exists
if [ "$(docker volume ls -q -f name=n8n_data)" ]; then
    echo "Removing n8n_data volume..."
    docker volume rm n8n_data
fi

# Deploy services using docker-compose
echo "Deploying services with docker-compose..."
docker-compose up -d
