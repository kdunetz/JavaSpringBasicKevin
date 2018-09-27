#!/bin/bash

#if [ -z "$IMAGE" ]
#then
#   echo "Please set environment variables with . ./setenv.sh"  
#   exit
#fi

if [ -z "$IMAGE" ]
then
   IMAGE=kdunetz/kadspringapp:2
fi

if [ -z "$NAME" ]
then
   NAME=javaspringbasickad
fi

if [ -z "$NAMESPACE" ]
then
   NAMESPACE=default
fi

mvn package
docker build -t $IMAGE .
docker push $IMAGE 
IMAGE=${IMAGE//[\/]/\\\/}
kubectl delete -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE
kubectl create -f <(cat deployment/deploy_docker_hub.yml | sed "s/IMAGE/$IMAGE/g" | sed "s/NAME/$NAME/g") -n $NAMESPACE
