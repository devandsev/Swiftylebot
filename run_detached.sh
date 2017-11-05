#!/usr/bin/env bash
name=swiftylebot

docker stop $name
docker rm $name
docker run -d -it --name $name --mount type=bind,source="$(pwd)"/app,target=/app $name:latest bash
