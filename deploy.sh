#!/bin/bash

kubectl delete -f deployment/deploy_docker_hub.yml -n default
kubectl create -f deployment/deploy_docker_hub.yml -n default
