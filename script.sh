#!/bin/bash

## Image Names
## Backend
# bportilho/projetok8s-backend:1.0
## Database
# bportilho/projetok8s-database:1.0

echo "Build de Imagens"
docker build -t bportilho/projetok8s-backend:1.0 backend/.
docker build -t bportilho/projetok8s-database:1.0 database/.

echo "Push de Imagens"
docker push bportilho/projetok8s-backend:1.0
docker push bportilho/projetok8s-database:1.0

echo "Deploy de Services e Aplicacao"
kubectl apply -f ./svc-deploy.yml
kubectl apply -f ./app-deploy.yml