#!/bin/bash

NAMESPACE="nott"

kubectl create namespace "${NAMESPACE}"
sleep 5
kubectl config set-context --current --namespace="${NAMESPACE}"