#!/bin/bash

DEPLOYMENT_NAME="nginx-test"
IMAGE="nginx"
FILE_NAME="nginx-deployment.yaml"
kubectl create deployment --image="${IMAGE}" "${DEPLOYMENT_NAME}" --dry-run=client -o yaml > "${FILE_NAME}"