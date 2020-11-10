#!/usr/bin/env bash

dockerpath="hanyslmm/flasksklearn-hon"

# Run in Docker Hub container with kubernetes
kubectl run flask-hon\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=flask-hon-label

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward flask-hon 8000:80
