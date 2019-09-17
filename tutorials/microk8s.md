# Try cloud-pnda on microk8s

As an alternative for local deployment you can use [microk8s](https://microk8s.io/). 
Microk8s does not deploy kubernetes in a virtual machine as minikube, and provide interesting addons such us prometheus or istio. 
Install microk8s in your local Linux Machine. Then enable this addons for microk8s:

```
microk8s.enable dns dashboard ingress storage
```

You can check if microk8s local cluster health with

```
microk8s.inspect
```

This command may output you have to enable ip tables forwarding with:
```
sudo iptables -P FORWARD ACCEPT
```

To make helm work with microk8s you have to point microk8s.kubectl to kubectl:
```
alias kubectl=microk8s.kubectl
```

Initialize the local Helm CLI and also install Tiller into minikube in one step:

```
helm init --history-max 200
```

Install cloud-pnda chart:
```
helm install --name pnda --namespace pnda cloud-pnda/
```

Include vhosts entries pointing to your localhost to access web uis.
For example, on a linux client host:

```
echo "127.0.0.1 console.pnda.io notebooks.pnda.io grafana.pnda.io kafka-manager.pnda.io hdfs.pnda.io spark.pnda.io" | sudo tee -a /etc/hosts
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