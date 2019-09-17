# cloud-pnda Helm Chart

**cloud-pnda is under active development and is not suited for production use.**

![logo](kube-pnda_icon.png)

## Overview

This repo maintains the source code of the cloud-pnda helm chart and some auxiliary files such as example override yaml files (profiles) and grafana-dashboards.
cloud-pnda helm chart enables you to deploy PNDA (the scalable, open source big data analytics platform for networks and services) on Kubernetes.

It deploys [PNDA components](cloud-pnda/templates) and [Big Data Requirements](cloud-pnda/charts). 

A helm client uses the cloud-native helm chart to deploy PNDA platform on Kubernetes. 
Default configuration values can be overriden providing an external yaml file (See [Configuration Section](#Configuration)).

### Requirements

Tested with:

- Kubernetes v1.11
- Helm v2.13

## Quick Setup

Clone this repo and:

```
helm install --name pnda cloud-pnda/
```

## Configuration

PNDA is configured by default for minimum resource requirements (for example HA is disabled by default).

To override default configuration values, the user must provide a yaml file in the helm install command:

```
helm install --name pnda cloud-pnda/ -f custom-config.yaml
```
 
This repository contains several custom configuration examples in *profiles* folder with several pnda custom deployments:
- [profiles/red-pnda.yml](profiles/red-pnda.yml): profile to deploy pnda in a single computer for development purposes.
- [profiles/pico.yml](profiles/pico.yml): profile to deploy pnda in a cluster with minimum resources.
- *More to be added*.

The default values of [PNDA components](cloud-pnda/templates) and [Big Data requirements](cloud-pnda/charts) can be checked at [cloud-pnda/values.yaml](cloud-pnda/values.yaml) file.

The default values of [Big Data requirements](cloud-pnda/charts) not provided in [cloud-pnda/values.yaml] can be checked in each requirement chart:
- hdfs [values.yaml](cloud-pnda/charts/hdfs/values.yaml).
- hbase [values.yaml](cloud-pnda/charts/hbase/values.yaml).
- openstsdb [values.yaml](cloud-pnda/charts/opentsdb/values.yaml).
- spark-standalone [values.yaml](cloud-pnda/charts/spark-standalone/values.yaml).
- jupyterhub [values.yaml](cloud-pnda/charts/values.yaml).
- cp-zookeeper [values.yaml](cloud-pnda/charts/cp-zookeeper/values.yaml).
- cp-kafka [values.yaml](cloud-pnda/charts/cp-kafka/values.yaml).


## Deploy from PNDA helm repository

The helm repository [https://pndaproject.github.io/pnda-helm-repo/](https://pndaproject.github.io/pnda-helm-repo/) provides packaged helm charts of this repo releases.

To add this repo to helm and install a packaged chart, follow this instructions:

Add this repo to your helm:
```
helm repo add pndaproject https://pndaproject.github.io/pnda-helm-repo/
helm repo update
```

Install to your kubernetes cluster:
```
helm install --name pnda pndaproject/cloud-pnda
```

## Tutorials

We have created several step-by-step tutorials to deploy pnda in several types of kubernetes clusters:

- [Minikube tutorial](tutorials/minikube.md).
- [Microk8s tutorial](tutorials/microk8s.md).

## Credits

- [Zero to Jupyterhub with Kubernetes](https://zero-to-jupyterhub.readthedocs.io/en/latest/)
- [Confluent Platform helm chart](https://github.com/confluentinc/cp-helm-charts)
