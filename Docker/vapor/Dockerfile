FROM ubuntu:16.04

# Install CURL
RUN apt-get update && \
    apt-get -y install curl && \
    rm -rf /var/lib/apt/lists/*;

# Get Vapor repo including Swift
RUN curl -sL https://apt.vapor.sh | bash;

# Installing Swift & Vapor
RUN apt-get update && \
    apt-get -y install libpython2.7 swift vapor && \
    rm -rf /var/lib/apt/lists/*;

# Configuring git
RUN git config --global user.email "root@vapor.docker"
RUN git config --global user.name "Vapor Docker Image"
