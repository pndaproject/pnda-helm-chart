# microk8s: Install a local development k8s cluster in your machine

As an alternative for local deployment you can use [microk8s](https://microk8s.io/). 
Microk8s does not deploy kubernetes in a virtual machine as minikube, and provide interesting addons such us prometheus or istio.

1. Install microk8s in your local Linux Machine and enable dns, dashboard, ingress and storage addons:

```
sudo snap install microk8s --classic
microk8s.enable dns dashboard ingress storage
```

2. Check microk8s local cluster health with

```
microk8s.inspect
```
Enable ip tables forwarding if needed:

```
sudo iptables -P FORWARD ACCEPT
```

3. Install kubectl:
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.2/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

4. Copy k3s kube-config to your user kube-config path:
```
sudo k3s kubectl config view --raw > ~/.kube/config
```

5. Check for Ready node, takes maybe 30 seconds:
```
kubectl get node
```
