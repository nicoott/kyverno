#!/bin/bash

helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update

helm install kyverno kyverno/kyverno -n kyverno --create-namespace

kubectl get pods -n kyverno
kubectl get services -n kyverno