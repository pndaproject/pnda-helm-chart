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

- Helm 3 (tested with v3.0.2)

```
curl https://get.helm.sh/helm-v3.0.2-linux-amd64.tar.gz | tar xz
sudo cp linux-amd64/helm /usr/local/bin/
rm -r linux-amd64
```

## Installation

### Strimzi Dependency

Cloud-pnda uses [strimzi operator](https://strimzi.io) to Manage Kafka on Kubernetes
Strimzi-operator is not provided as a helm dependency because strimzi-CRDs (custom resources definitions) must be present
prior to `helm install cloud-pnda`. We hope to fix this in the future.

To install strimzi you can follow [this instructions](https://strimzi.io/2018/11/01/using-helm.html).

1.  Create a k8s namespace for cloud-pnda:

```
kubectl create namespace pnda
```

2. Install strimzi:

```
helm repo add strimzi https://strimzi.io/charts/
helm repo update
helm3 install strimzi strimzi/strimzi-kafka-operator \
   --namespace pnda \
   --version 0.16.1 
```

**WARNING!** If you install strimzi in a different namespace than cloud-pnda, You must install strimzi with `set watchNamespaces` pointing to the cloud-pnda namespace.
Example of strimzi in its own namespace:

```
helm repo add strimzi https://strimzi.io/charts/
helm repo update
kubectl create namespace strimzi
helm3 install strimzi strimzi/strimzi-kafka-operator \
   --namespace strimzi \
   --version 0.16.1 \
   --set watchNamespaces[0]=pnda
```
 
### From helm repository

The helm repository [https://pndaproject.github.io/pnda-helm-chart/](https://pndaproject.github.io/pnda-helm-chart/) provides packaged helm charts of this repo releases.

1. Install [strimzi](#Strimzi-Dependency).

2. Add cloud-pnda helm repo:
```
helm repo add pndaproject https://pndaproject.github.io/pnda-helm-chart/
helm repo update
```

3. Install cloud-pnda in the selected namespace:
```
helm install cloud-pnda pndaproject/cloud-pnda \
   --namespace pnda \
   --version 0.1.0
```

### From Source

1. Install [strimzi](#Strimzi-Dependency).

2. Update cloud-pnda dependecies:
```
helm dep update charts/cloud-pnda
```

3. Install cloud-pnda in the selected namespace:
```
helm install cloud-pnda charts/cloud-pnda \
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
helm install cloud-pnda charts/cloud-pnda/ \
   --namespace pnda \
   -f custom-config.yaml
```
 
This repository contains several custom configuration examples in *profiles* folder with several pnda custom deployments:
- [profiles/red-pnda.yml](profiles/red-pnda.yml): profile to deploy pnda in a single computer for development purposes.
- [profiles/pico.yml](profiles/pico.yml): profile to deploy pnda in a cluster with minimum resources.
- *More to be added*.

The default values of [PNDA components](charts/cloud-pnda/templates) and [Big Data dependencies](charts/cloud-pnda/requirements.yaml) can be checked at [charts/cloud-pnda/values.yaml](charts/cloud-pnda/values.yaml) file.

For customizing the external dependencies, go to each dependency information:

- Kafka and Zookeeper: manually edit the Kafka Resource with `kubectl --namespace pnda edit kafka strimzi`
- KafkaConnect: manually edit the KafkaConnect Resource with `kubectl --namespace pnda edit kafkaconnect strimzi`
- hdfs: More info [here](https://hub.helm.sh/charts/gradiant/hdfs).
- hbase: more info [here](https://hub.helm.sh/charts/gradiant/hbase)
- openstsdb: more info [here](https://hub.helm.sh/charts/gradiant/opentsdb).
- spark-standalone: more info [here](https://hub.helm.sh/charts/gradiant/spark-standalone).
- jupyterhub: more info [here](https://zero-to-jupyterhub.readthedocs.io/en/latest/customizing/index.html).


## Remove Installation

If you want to undone the deployment of cloud-pnda:

1. Uninstall helm chart:

```
helm uninstall cloud-pnda --namespace pnda
```

2. Remove pnda namespace:

```
kubectl delete namespace pnda
```

To remove strimzi:

1. Uninstall helm chart:

```
helm uninstall strimzi --namespace strimzi
```

2. Remove pnda namespace:

```
kubectl delete namespace strimzi
```

## Credits

- [Zero to Jupyterhub with Kubernetes](https://zero-to-jupyterhub.readthedocs.io/en/latest/)
- [Confluent Platform helm chart](https://github.com/confluentinc/cp-helm-charts)
