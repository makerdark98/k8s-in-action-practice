#!/bin/bash
helm upgrade --install docker-registry-ui \
    --namespace registry-dashboard \
    --set registry.external=true \
    --set registry.url=https://registry.makerdark98.dev \
    --set ui.title="Docker Registry UI" \
    --set ui.replicaCount=1 \
    --set ui.nodeSelector.node-type=master \
    --set ui.image.tag=main \
    --set ui.delete_images=true \
    --set ui.ingress.enabled=false \
    --set ui.proxy=false \
    ./docker-registry-ui
