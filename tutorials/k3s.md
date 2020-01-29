# k3s: Install a local development k8s cluster in your machine

As an alternative for local deployment you can use [k3s](https://k3s.io/). 
k3s does not deploy kubernetes in a virtual machine as minikube.

1. Install k3s in your local Linux Machine:

```
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.17.2+k3s1 sh -
```

2. Install kubectl:
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.2/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

3. Copy k3s kube-config to your user kube-config path:
```
sudo k3s kubectl config view --raw > ~/.kube/config
```

4. Check for Ready node, takes maybe 30 seconds:
```
kubectl get node
```

5. Install local path provisioner to use local paths for k8s persistent volumes:

```
mkdir /opt/local-path-provisioner
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

```