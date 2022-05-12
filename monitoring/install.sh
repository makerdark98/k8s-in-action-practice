#!/bin/bash
# Installation
# kubectl create namespace monitoring
# helm install --namespace monitoring prometheus prometheus-community/kube-prometheus-stack

# Edit ConfigMap
# kubectl edit configmap prometheus-grafana
#
# 생략
#apiVersion: v1
#data:
#  grafana.ini: |
#    [analytics]
#    check_for_updates = true
#    [grafana_net]
#    url = https://grafana.net
#    [log]
#    mode = console
#    [paths]
#    data = /var/lib/grafana/
#    logs = /var/log/grafana
#    plugins = /var/lib/grafana/plugins
#    provisioning = /etc/grafana/provisioning
#    [server]
#    domain = lmu.makerdark98.dev
#    root_url = %(protocol)s://%(domain)s:%(http_port)s/grafana/
#    serve_from_sub_path = true
# 생략

# Expose Port
# kubectl port-forward deployment/prometheus-grafana 9000:3000
