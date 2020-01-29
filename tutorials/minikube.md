# minikube: Install a local development k8s cluster in your machine

1. Deploy a local kubernetes with at leat 3 cpus and 4GB RAM with ingress enabled:

```
minikube start --memory=4096 --cpus=3 --kubernetes-version v1.11.8
minikube addons enable ingress
```
