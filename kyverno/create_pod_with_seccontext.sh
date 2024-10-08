#!/bin/bash

kubectl run nginx-root --image=nginx --restart=Never --dry-run=client -o yaml > pod.yaml
echo "securityContext:" >> pod.yaml
echo "  runAsUser: 0" >> pod.yaml
kubectl apply -f pod.yaml