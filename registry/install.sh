#!/bin/bash
# Change these credentials to your own
export REGISTRY_USER=admin
export REGISTRY_PASS=registry
export DESTINATION_FOLDER=./registry-creds

# Backup credentials to local files (in case you'll forget them later on)
mkdir -p ${DESTINATION_FOLDER}
echo ${REGISTRY_USER} >> ${DESTINATION_FOLDER}/registry-user.txt
echo ${REGISTRY_PASS} >> ${DESTINATION_FOLDER}/registry-pass.txt

docker run --entrypoint htpasswd registry:2.7.0 \
    -Bbn ${REGISTRY_USER} ${REGISTRY_PASS} \
    > ${DESTINATION_FOLDER}/htpasswd

unset REGISTRY_USER REGISTRY_PASS DESTINATION_FOLDER

kubectl label nodes k8s-in-action-control-plane node-type=master

helm upgrade --install docker-registry \
    --namespace registry \
    --set replicaCount=1 \
    --set persistence.enabled=true \
    --set persistence.size=20Gi \
    --set persistence.deleteEnabled=true \
    --set persistence.storageClass=docker-registry-local-storage \
    --set persistence.existingClaim=docker-registry-pv-claim \
    --set secrets.htpasswd=$(cat ${DISTINATION_FOLDER}/htpasswd) \
    --set nodeSelector.node-type=master \
    twuni/docker-registry \
    --version 1.10.1

kubectl -n registry port-forward $POD_NAME 8080:5000
