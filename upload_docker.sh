#!/usr/bin/env bash
# This tags and uploads an image to Docker Hub

#Assumes this is built
#docker build --tag=flasksklearn .


dockerpath="hanyslmm/flasksklearn-hon"

# Authenticate & Tag
echo "Docker ID and Image: $dockerpath"
docker login &&\
    docker image tag flasksklearn-hon $dockerpath

# Push Image
docker image push $dockerpath
