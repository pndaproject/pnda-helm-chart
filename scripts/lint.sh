#!/bin/bash


docker run -ti --rm \
  --net=host \
  -v $PWD:/pnda \
  -v $HOME/.kube/config:/.kubeconfig \
  -e KUBECONFIG=/.kubeconfig \
  --workdir=/pnda quay.io/helmpack/chart-testing ct lint \
  --all \
  --chart-repos incubator=http://storage.googleapis.com/kubernetes-charts-incubator \
  --chart-repos stable=https://kubernetes-charts.storage.googleapis.com \
  --chart-repos gradiant=https://gradiant.github.io/charts \
  --chart-repos jupyterhub=https://jupyterhub.github.io/helm-chart \
  --chart-repos elastic=https://helm.elastic.co 
