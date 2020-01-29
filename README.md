# cloud-pnda Helm Chart

**cloud-pnda is under active development and is not suited for production use.**

![logo](kube-pnda_icon.png)

## Overview

This repo maintains the source code of the cloud-pnda helm chart and some auxiliary files such as example override yaml files (profiles) and grafana-dashboards.
cloud-pnda helm chart enables you to deploy PNDA (the scalable, open source big data analytics platform for networks and services) on Kubernetes.

It deploys [PNDA components](cloud-pnda/templates) and [Big Data Requirements](cloud-pnda/charts). 

A helm client uses the cloud-native helm chart to deploy PNDA platform on Kubernetes. 
Default configuration values can be overriden providing an external yaml file (See [Configuration Section](#Configuration)).

## Requirements

- Kubernetes (tested with v1.17)

Point kubectl to your own k8s cluster or follow any of the [tutorials](tutorials/) to deploy a testing k8s cluster in your local machine.

- Helm 2 (tested with v2.16.1)

```
curl https://get.helm.sh/helm-v2.16.1-linux-amd64.tar.gz | tar xz
sudo cp linux-amd64/helm /usr/local/bin/
rm -r linux-amd64
#Create tiller service account
kubectl -n kube-system create serviceaccount tiller
#Create cluster role binding for tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
#Initialize tiller
helm init --service-account tiller
```

- strimzi (tested with v0.16.1)

Cloud-pnda chart needs strimzi CRDs (custom resources definitions) to be available in your kubernetes cluster.
We expect to fix this pre-requirement when migrating to Helm 3.
To install strimzi via helm chart you can follow [this instructions](https://strimzi.io/2018/11/01/using-helm.html).

**WARNING!** You should install strimzi Cluster Operator in the same namespace as cloud-pnda.

To install it in pnda namespace:

```
helm repo add strimzi https://strimzi.io/charts/
helm repo update
helm install strimzi/strimzi-kafka-operator \
   --name strimzi \
   --namespace pnda \
   --version 0.16.1
```

## Installation
### From helm repository

The helm repository [https://pndaproject.github.io/pnda-helm-chart/](https://pndaproject.github.io/pnda-helm-chart/) provides packaged helm charts of this repo releases.

1. Install all [Requirements](#requirements).

2. Add cloud-pnda helm repo:
```
helm repo add pndaproject https://pndaproject.github.io/pnda-helm-chart/
helm repo update
```

3. Proceed with the helm install:
```
helm install pndaproject/cloud-pnda \
   --name cloud-pnda \
   --namespace pnda \
   --version 6.0.0-alpha
```

### From Source

1. Install all [Requirements](#requirements).

2. Update cloud-pnda dependecies:
```
helm dep update charts/cloud-pnda
```

3. Proceed with the helm install:
```
helm install charts/cloud-pnda \
   --name cloud-pnda \
   --namespace pnda
```

## UI - Access
Default configuration deploys a set of ingresses that works for local k8s clusters (microk8s, k3s), out-of-the-box:

- Access PNDA console at [http://console.127-0-0-1.nip.io](http://console.127-0-0-1.nip.io) with user pnda password pnda
- Access jupyerhub at [http://notebooks.127-0-0-1.nip.io](http://notebooks.127-0-0-1.nip.io) with user pnda password pnda
- Access grafana at [http://grafana.127-0-0-1.nip.io](http://grafana.127-0-0-1.nip.io) with user pnda password pnda
- Access hdfs namenode management ui at [http://hdfs.127-0-0-1.nip.io](http://hdfs.127-0-0-1.nip.io)
- Access kafka-manager ui at [http://kafka-manager.127-0-0-1.nip.io](http://kafka-manager.127-0-0-1.nip.io)
- Access schema-registry ui at [http://schema-registry.127-0-0-1.nip.io](http://schema-registry.127-0-0-1.nip.io)
- Access kafka-connect-ui at [http://connect.127-0-0-1.nip.io](http://connect.127-0-0-1.nip.io)

## Configuration

PNDA is configured by default for minimum resource requirements (for example HA is disabled by default).

To override default configuration values, the user must provide a yaml file in the helm install command:

```
helm install charts/cloud-pnda/ \
   --name cloud-pnda \
   --namespace pnda \
   -f custom-config.yaml
```
 
This repository contains several custom configuration examples in *profiles* folder with several pnda custom deployments:
- [profiles/red-pnda.yml](profiles/red-pnda.yml): profile to deploy pnda in a single computer for development purposes.
- [profiles/pico.yml](profiles/pico.yml): profile to deploy pnda in a cluster with minimum resources.
- *More to be added*.

The default values of [PNDA components](charts/cloud-pnda/templates) and [Big Data dependencies](charts/cloud-pnda/requirements.yaml) can be checked at [charts/cloud-pnda/values.yaml](charts/cloud-pnda/values.yaml) file.

For configuration of the [Big Data requirements](cloud-pnda/requirements.yaml) you should inspect the values.yaml of the corresponding chart. Here is a list of the requirements and the location of their charts:
- hdfs (this repo): [values.yaml](charts/hdfs/values.yaml).
- hbase (this repo): [values.yaml](charts/hbase/values.yaml).
- openstsdb (this repo): [values.yaml](charts/opentsdb/values.yaml).
- spark-standalone (this repo): [values.yaml](charts/spark-standalone/values.yaml).
- jupyterhub (jupyterhub repo): [values.yaml](https://github.com/jupyterhub/zero-to-jupyterhub-k8s/blob/master/jupyterhub/values.yaml).


## Credits

- [Zero to Jupyterhub with Kubernetes](https://zero-to-jupyterhub.readthedocs.io/en/latest/)
- [Confluent Platform helm chart](https://github.com/confluentinc/cp-helm-charts)
