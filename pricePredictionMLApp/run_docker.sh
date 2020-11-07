#!/usr/bin/env bash

# Build image
docker build --tag=flasksklearn-hon .

# List docker images
docker image ls

# Run flask app
docker run -p 8000:80 flasksklearn-hon
