# Try cloud-pnda on minikube

Deploy a local kubernetes with at leat 3 cpus and 4GB RAM with ingress enabled:

```
minikube start --memory=4096 --cpus=3 --kubernetes-version v1.11.8
minikube addons enable ingress
```

Initialize the local Helm CLI and also install Tiller into minikube in one step:

```
helm init --history-max 200
```

Install cloud-pnda chart:
```
helm install --name pnda --namespace pnda cloud-pnda/
```

Include vhosts entries pointing to minikube VM IP to access web uis.
For example, on a linux client host:

```
echo "\$(minikube ip) console.pnda.io notebooks.pnda.io grafana.pnda.io kafka-manager.pnda.io hdfs.pnda.io spark.pnda.io" | sudo tee -a /etc/hosts
```

- Access PNDA console at http://console.pnda.io with user pnda password pnda
- Access jupyerhub at http://notebooks.pnda.io with user pnda password pnda
- Access grafana at http://grafana.pnda.io with user pnda password pnda
- Access hdfs namenode management ui at http://hdfs.pnda.io
- Access kafka-manager ui at http://kafka-manager.pnda.io

cleanup:

```
helm delete --purge pnda
kubectl delete namespace pnda
```