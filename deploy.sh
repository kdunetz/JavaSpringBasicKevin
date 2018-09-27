#!/bin/bash

#OLDWAY kubectl delete -f deployment/deploy_docker_hub.yml -n default
#OLDWAY kubectl create -f deployment/deploy_docker_hub.yml -n default
if [ -z "$1" ]
then
   echo "Must pass the docker file image (e.g, 1, 2, 3)"
   exit
fi

#NAME=javaspringbasickad

if [ -z "$IMAGE" ]
then
   IMAGE=kdunetz/kadspringapp:$1
fi

if [ -z "$NAME" ]
then
   NAME=javaspringbasickad
fi

if [ -z "$NAMESPACE" ]
then
   NAMESPACE=default
fi


IMAGE=${IMAGE//[\/]/\\\/}
kubectl delete -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE
kubectl create -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE
