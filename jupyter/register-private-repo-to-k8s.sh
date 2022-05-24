#!/bin/bash
REPO=registry.makerdark98.dev
USER=<user>
PASS=<password>
NAMESPACE=jupyter
kubectl create secret docker-registry regcred \
    --docker-server=$REPO \
    --docker-username=$USER \
    --docker-password=$PASS \
    --docker-email=makerdark98@gmail.com \
    -n=$NAMESPACE

