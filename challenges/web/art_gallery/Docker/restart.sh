#!/bin/sh
sudo docker container prune -f
sudo docker volume prune -f
sudo docker compose build
sudo docker compose up
