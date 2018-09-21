#!/bin/bash

NAME=javaspringbasickad
IMAGE=kdunetz/kadspringapp:3

#if [ -z "$IMAGE" ]
#then
   #echo "Please set environment variables with . ./setenv.sh"  
   #exit
#fi

mvn package

docker build -t $IMAGE .
docker push $IMAGE 

kubectl set image deployment/$NAME $NAME=$IMAGE -n default

