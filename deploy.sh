#!/bin/bash

set -eox

APP_NAME="test-task-application"
SERVER_NAME="dev"

gcloud compute ssh ${SERVER_NAME} --zone=us-central1-a << EOF
  sudo su 
  cd /opt
  if [ ! -d "/opt/${APP_NAME}" ];
  then
    git clone https://github.com/shmykyta/${APP_NAME}.git
    echo "First time on the server, clone repo"
    cd ${APP_NAME}
  else
    cd ${APP_NAME}
    git stash
    git pull
    docker-compose down
    echo "Pull the latest update"
  fi
  docker-compose build
  docker-compose up -d --build
  echo 'Done.'
EOF
