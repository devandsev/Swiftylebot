#!/usr/bin/env bash
name=swiftylebot

docker stop $name
docker rm $name
docker run -it --name $name -p 80:80 -p 8080:8080 --mount type=bind,source="$(pwd)",target=/app $name:latest bash
