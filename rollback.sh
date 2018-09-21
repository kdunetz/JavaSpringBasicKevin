NAME=javaspringbasickad

#kubectl rollout undo deployment/$NAME -n default
kubectl rollout undo deployments $NAME
