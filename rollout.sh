#!/bin/bash

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

echo $IMAGE

#if [ -z "$IMAGE" ]
#then
   #echo "Please set environment variables with . ./setenv.sh"  
   #exit
#fi

kubectl set image deployment/$NAME $NAME=$IMAGE -n default

