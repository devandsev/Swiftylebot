#!/usr/bin/env bash
docker build -f $(pwd)/vapor/Dockerfile -t vapor:latest .
docker build -f $(pwd)/app/Dockerfile -t swiftylebot:latest .
