# cloud-pnda helm repository

This helm repository provides charts for the Cloud-Native <a href="http://pnda.io">PNDA poject</a>.

To add this repo to helm and install a packaged chart, follow this instructions:

Add this repo to your helm:

```
helm repo add pndaproject https://pndaproject.github.io/pnda-helm-chart/
helm repo update
```

Install to your kubernetes cluster:

```
kubectl create namespace pnda
helm install cloud-pnda pndaproject/cloud-pnda --version=0.1.0-beta1 --namespace pnda
```

> **NOTE**: currently cloud-pnda has not stable releases thus no "latest" version. You must explicitly set a pre-release version with --version flag in helm install command.

You may customize your deployment providing a custom values yaml:

```
kubectl create namespace pnda
helm install cloud-pnda pndaproject/cloud-pnda --version=0.1.0-beta1 --namespace pnda -f custom.yaml
```


More info to customize your pnda installation at [https://github.com/pndaproject/pnda-helm-chart/tree/master/charts/cloud-pnda](https://github.com/pndaproject/pnda-helm-chart/tree/master/charts/cloud-pnda).


Source code of this charts is available at [github](https://github.com/pndaproject/pnda-helm-chart).

