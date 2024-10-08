#!/bin/bash

NAMESPACE="nott"

kubectl create namespace "${NAMESPACE}"
kubectl config set-context --current --namespace="${NAMESPACE}"