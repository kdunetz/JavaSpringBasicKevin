#!/bin/bash

IMAGE=kdunetz/kadspringapp:2
NAME=kadspringapp

#if [ -z "$IMAGE" ]
#then
#   echo "Please set environment variables with . ./setenv.sh"  
#   exit
#fi

mvn package
docker build -t $IMAGE .
docker push $IMAGE 
./deploy.sh
