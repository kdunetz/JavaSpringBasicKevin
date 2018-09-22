#!/bin/bash

#NAME=javaspringbasickad
#IMAGE=kdunetz/kadspringapp:$1

echo $IMAGE

#if [ -z "$IMAGE" ]
#then
   #echo "Please set environment variables with . ./setenv.sh"  
   #exit
#fi

kubectl set image deployment/$NAME $NAME=$IMAGE -n default

