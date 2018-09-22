#!/bin/bash

#OLDWAY kubectl delete -f deployment/deploy_docker_hub.yml -n default
#OLDWAY kubectl create -f deployment/deploy_docker_hub.yml -n default

IMAGE=${IMAGE//[\/]/\\\/}
kubectl delete -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE
kubectl create -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE
