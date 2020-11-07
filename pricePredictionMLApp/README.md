
[![CircleCI](https://circleci.com/gh/hanyslmm/housingPricePredictionML.svg?style=svg)](https://circleci.com/gh/hanyslmm/housingPricePredictionML)

# Machine Learning Microservice API
In this project, you will apply some skills to operationalize a Machine Learning Microservice API. We are given a pre-trained, sklearn model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.

## Tasks
  1. Test project code using linting
  1. Complete a Dockerfile to containerize this application
  1. Deploy containerized application using Docker and make a prediction
  1. Improve the log statements in the source code for this application
  1. Configure Kubernetes and create a Kubernetes cluster
  1. Deploy a container using Kubernetes and make a prediction
  1. Upload a complete Github repo with CircleCI to indicate that code has been tested successfully

## How to run

  * Run a Docker Container using the script ./run_docker.sh
  * Upload the Docker Image using the script ./upload_docker.sh
  * Deploy with Kubernetes using the script ./run_kubernetes.sh
  * Make prediction either with Docker Container or Kubernetes Deployment using the script ./make_prediction.sh
 how to run the Python scripts and web app

## List of Docker commands

https://docs.docker.com/engine/reference/commandline/docker/

## Safely remove K8s Pods

https://www.bluematador.com/blog/safely-removing-pods-from-a-kubernetes-node


## CricleCi blog

https://circleci.com/blog/triggering-trusted-ci-jobs-on-untrusted-forks/

https://circleci.com/docs/2.0/status-badges/
