cloud-pnda
==========
The scalable, open source big data analytics platform for networks and services.

Current chart version is `6.0.0-alpha`

Source code can be found [here](https://github.com/pndaproject/pnda-helm-chart)

## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../jmxproxy | jmxproxy | ~0.1.0 |
| http://storage.googleapis.com/kubernetes-charts-incubator | schema-registry | ~1.1.8 |
| http://storage.googleapis.com/kubernetes-charts-incubator | sparkoperator | ~0.6.1 |
| https://gradiant.github.io/charts | hbase | ~0.1.0 |
| https://gradiant.github.io/charts | hdfs | ~0.1.0 |
| https://gradiant.github.io/charts | kafka-connect-ui | ~0.1.0 |
| https://gradiant.github.io/charts | opentsdb | ~0.1.0 |
| https://gradiant.github.io/charts | spark-standalone | ~0.1.0 |
| https://helm.elastic.co | elasticsearch | ~7.4.0 |
| https://helm.elastic.co | kibana | ~7.4.0 |
| https://jupyterhub.github.io/helm-chart/ | jupyterhub | 0.9.0-beta.3 |
| https://kubernetes-charts.storage.googleapis.com | grafana | ~4.0.4 |
| https://kubernetes-charts.storage.googleapis.com | kafka-manager | ~2.2.0 |
| https://kubernetes-charts.storage.googleapis.com | redis | ~9.5.5 |
| https://kubernetes-charts.storage.googleapis.com | schema-registry-ui | ~0.4.1 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| consoleBackendDataLogger.fullnameOverride | string | `"console-backend-data-logger"` |  |
| consoleBackendDataLogger.image.pullPolicy | string | `"IfNotPresent"` |  |
| consoleBackendDataLogger.image.repository | string | `"pnda/console-backend-data-logger"` |  |
| consoleBackendDataLogger.image.tag | string | `"2.1.1"` |  |
| consoleBackendDataLogger.resources.limits.cpu | string | `"1000m"` |  |
| consoleBackendDataLogger.resources.limits.memory | string | `"1024Mi"` |  |
| consoleBackendDataLogger.resources.requests.cpu | string | `"10m"` |  |
| consoleBackendDataLogger.resources.requests.memory | string | `"128Mi"` |  |
| consoleBackendDataLogger.service.port | int | `3001` |  |
| consoleBackendDataLogger.service.type | string | `"ClusterIP"` |  |
| consoleBackendDataManager.fullnameOverride | string | `"console-backend-data-manager"` |  |
| consoleBackendDataManager.image.pullPolicy | string | `"IfNotPresent"` |  |
| consoleBackendDataManager.image.repository | string | `"pnda/console-backend-data-manager"` |  |
| consoleBackendDataManager.image.tag | string | `"2.1.1"` |  |
| consoleBackendDataManager.resources.limits.cpu | string | `"1000m"` |  |
| consoleBackendDataManager.resources.limits.memory | string | `"1024Mi"` |  |
| consoleBackendDataManager.resources.requests.cpu | string | `"10m"` |  |
| consoleBackendDataManager.resources.requests.memory | string | `"128Mi"` |  |
| consoleBackendDataManager.service.port | int | `3123` |  |
| consoleBackendDataManager.service.type | string | `"ClusterIP"` |  |
| consoleFrontend.conf.clusterName | string | `nil` |  |
| consoleFrontend.conf.datasets.hidden[0] | string | `"\"testbot\""` |  |
| consoleFrontend.conf.datasets.hidden[1] | string | `"\"+tmp\""` |  |
| consoleFrontend.conf.edgeNode | string | `""` |  |
| consoleFrontend.conf.grafanaLink | string | `"http://grafana.127-0-0-1.nip.io"` |  |
| consoleFrontend.conf.hdfsLink | string | `"http://hdfs.127-0-0-1.nip.io"` |  |
| consoleFrontend.conf.httpfsLink | string | `"http://httpfs.127-0-0-1.nip.io"` |  |
| consoleFrontend.conf.jupyterLink | string | `"http://notebooks.127-0-0-1.nip.io"` |  |
| consoleFrontend.conf.kafkaManagerLink | string | `"http://kafka-manager.127-0-0-1.nip.io"` |  |
| consoleFrontend.conf.kibanaLink | string | `"http://kibana.127-0-0-1.nip.io"` |  |
| consoleFrontend.conf.logLevel | string | `"INFO"` |  |
| consoleFrontend.conf.topics.hidden[0] | string | `"\"avro.internal.testbot\""` |  |
| consoleFrontend.conf.topics.hidden[1] | string | `"\"__consumer_offsets\""` |  |
| consoleFrontend.conf.topics.hidden[2] | string | `"\"_schemas\""` |  |
| consoleFrontend.conf.topics.hidden[3] | string | `"\"__connect.offset\""` |  |
| consoleFrontend.conf.topics.hidden[4] | string | `"\"__connect.status\""` |  |
| consoleFrontend.conf.topics.hidden[5] | string | `"\"__connect.config\""` |  |
| consoleFrontend.conf.topics.hidden[6] | string | `"\"__confluent.support.metrics\""` |  |
| consoleFrontend.conf.version | string | `nil` |  |
| consoleFrontend.fullnameOverride | string | `"console-frontend"` |  |
| consoleFrontend.image.pullPolicy | string | `"IfNotPresent"` |  |
| consoleFrontend.image.repository | string | `"pnda/console-frontend"` |  |
| consoleFrontend.image.tag | string | `"2.1.2"` |  |
| consoleFrontend.ingress.annotations | object | `{}` |  |
| consoleFrontend.ingress.enabled | bool | `true` |  |
| consoleFrontend.ingress.hosts[0] | string | `"console.127-0-0-1.nip.io"` |  |
| consoleFrontend.ingress.path | string | `"/"` |  |
| consoleFrontend.resources.limits.cpu | string | `"1000m"` |  |
| consoleFrontend.resources.limits.memory | string | `"1024Mi"` |  |
| consoleFrontend.resources.requests.cpu | string | `"10m"` |  |
| consoleFrontend.resources.requests.memory | string | `"128Mi"` |  |
| consoleFrontend.service.port | int | `80` |  |
| consoleFrontend.service.type | string | `"ClusterIP"` |  |
| dataService.conf.logLevel | string | `"INFO"` |  |
| dataService.fullnameOverride | string | `"data-service"` |  |
| dataService.image.pullPolicy | string | `"IfNotPresent"` |  |
| dataService.image.repository | string | `"pnda/data-service"` |  |
| dataService.image.tag | string | `"0.4.2"` |  |
| dataService.resources.limits.cpu | string | `"1000m"` |  |
| dataService.resources.limits.memory | string | `"1024Mi"` |  |
| dataService.resources.requests.cpu | string | `"10m"` |  |
| dataService.resources.requests.memory | string | `"128Mi"` |  |
| dataService.service.port | int | `7000` |  |
| dataService.service.type | string | `"ClusterIP"` |  |
| deploymentManager.conf.logLevel | string | `"INFO"` |  |
| deploymentManager.fullnameOverride | string | `"deployment-manager"` |  |
| deploymentManager.image.pullPolicy | string | `"IfNotPresent"` |  |
| deploymentManager.image.repository | string | `"pnda/deployment-manager"` |  |
| deploymentManager.image.tag | string | `"2.1.2"` |  |
| deploymentManager.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| deploymentManager.persistence.enabled | bool | `true` |  |
| deploymentManager.persistence.size | string | `"2Gi"` |  |
| deploymentManager.resources.limits.cpu | string | `"1000m"` |  |
| deploymentManager.resources.limits.memory | string | `"1024Mi"` |  |
| deploymentManager.resources.requests.cpu | string | `"10m"` |  |
| deploymentManager.resources.requests.memory | string | `"128Mi"` |  |
| deploymentManager.service.port | int | `5000` |  |
| deploymentManager.service.type | string | `"ClusterIP"` |  |
| elasticsearch.antiAffinity | string | `"hard"` |  |
| elasticsearch.enabled | bool | `false` |  |
| elasticsearch.esJavaOpts | string | `"-Xmx256m -Xms256m"` |  |
| elasticsearch.replicas | int | `1` |  |
| grafana.adminPassword | string | `"pnda"` |  |
| grafana.adminUser | string | `"pnda"` |  |
| grafana.enabled | bool | `true` |  |
| grafana.fullnameOverride | string | `"grafana"` |  |
| grafana.image.tag | string | `"6.4.4"` |  |
| grafana.ingress.enabled | bool | `true` |  |
| grafana.ingress.hosts[0] | string | `"grafana.127-0-0-1.nip.io"` |  |
| grafana.sidecar.datasources.enabled | bool | `true` |  |
| grafana.sidecar.datasources.label | string | `"grafana_datasource"` |  |
| hbase.conf.hbaseSite."hbase.rootdir" | string | `"hdfs://hdfs-namenode:8020/hbase"` |  |
| hbase.conf.hbaseSite."hbase.zookeeper.quorum" | string | `"zoo-entrance:2181"` |  |
| hbase.enabled | bool | `true` |  |
| hbase.fullnameOverride | string | `"hbase"` |  |
| hbase.hdfs.enabled | bool | `false` |  |
| hbase.regionServer.replicas | int | `1` |  |
| hdfs.conf.hdfsSite."dfs.replication" | int | `1` |  |
| hdfs.dataNode.pdbMinAvailable | int | `1` |  |
| hdfs.dataNode.replicas | int | `1` |  |
| hdfs.enabled | bool | `true` |  |
| hdfs.fullnameOverride | string | `"hdfs"` |  |
| hdfs.ingress.httpfs.enabled | bool | `true` |  |
| hdfs.ingress.httpfs.hosts[0] | string | `"httpfs.127-0-0-1.nip.io"` |  |
| hdfs.ingress.httpfs.path | string | `"/"` |  |
| hdfs.ingress.nameNode.enabled | bool | `true` |  |
| hdfs.ingress.nameNode.hosts[0] | string | `"hdfs.127-0-0-1.nip.io"` |  |
| hdfs.ingress.nameNode.path | string | `"/"` |  |
| hdfs.nameNode.pdbMinAvailable | int | `1` |  |
| hdfs.persistence.dataNode.accessMode | string | `"ReadWriteOnce"` |  |
| hdfs.persistence.dataNode.enabled | bool | `true` |  |
| hdfs.persistence.dataNode.size | string | `"4Gi"` |  |
| hdfs.persistence.nameNode.accessMode | string | `"ReadWriteOnce"` |  |
| hdfs.persistence.nameNode.enabled | bool | `true` |  |
| hdfs.persistence.nameNode.size | string | `"4Gi"` |  |
| jmxproxy.fullnameOverride | string | `"jmxproxy"` |  |
| jupyterhub.auth.admin.users[0] | string | `"pnda"` |  |
| jupyterhub.auth.dummy.password | string | `"pnda"` |  |
| jupyterhub.auth.type | string | `"dummy"` |  |
| jupyterhub.enabled | bool | `true` |  |
| jupyterhub.hub.extraConfig.00-custom-singleuser-hostname | string | `"c.KubeSpawner.extra_pod_config = {\n   \"hostname\": \"jupyter-{username}\",\n   \"subdomain\": \"jupyterhub\"\n}\n"` |  |
| jupyterhub.hub.extraConfig.01-posthook | string | `"c.KubeSpawner.lifecycle_hooks = {\n   \"postStart\": {\n     \"exec\": {\n       \"command\": [\n         \"sh\",\n         \"-c\",\n         \"rm -rf /home/jovyan/apps-notebooks \u0026\u0026 git clone http://deployment-manager-git:8099/jupyter-${JUPYTERHUB_USER} /home/jovyan/apps-notebooks || exit 0\"]\n     }\n   }\n }\n"` |  |
| jupyterhub.hub.extraConfig.jupyterlab | string | `"c.Spawner.cmd = ['jupyter-labhub']\n"` |  |
| jupyterhub.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"64m"` |  |
| jupyterhub.ingress.enabled | bool | `true` |  |
| jupyterhub.ingress.hosts[0] | string | `"notebooks.127-0-0-1.nip.io"` |  |
| jupyterhub.proxy.secretToken | string | `"83fc7b97f79e48a88dd565397a165ebfa9053e474350bb338448b94c6b19c076"` |  |
| jupyterhub.proxy.service.nodePorts | object | `{}` |  |
| jupyterhub.proxy.service.type | string | `"ClusterIP"` |  |
| jupyterhub.singleuser.cloudMetadata.enabled | bool | `true` |  |
| jupyterhub.singleuser.defaultUrl | string | `"/lab"` |  |
| jupyterhub.singleuser.extraEnv.SPARKCONF_SPARK_MASTER | string | `"spark://spark-standalone:7077"` |  |
| jupyterhub.singleuser.image.name | string | `"gradiant/jupyter"` |  |
| jupyterhub.singleuser.image.tag | string | `"6.0.1-spark"` |  |
| jupyterhub.singleuser.serviceAccountName | string | `"pnda"` |  |
| kafka-connect-ui.connectCluster.url | string | `"http://strimzi-connect-api:8083"` |  |
| kafka-connect-ui.enabled | bool | `true` |  |
| kafka-connect-ui.fullnameOverride | string | `"kafka-connect-ui"` |  |
| kafka-connect-ui.ingress.enabled | bool | `true` |  |
| kafka-connect-ui.ingress.hosts[0] | string | `"connect.127-0-0-1.nip.io"` |  |
| kafka-manager.clusters[0].jmxEnabled | string | `"true"` |  |
| kafka-manager.clusters[0].kafkaVersion | string | `"2.2.0"` |  |
| kafka-manager.clusters[0].name | string | `"pnda-Kafka"` |  |
| kafka-manager.clusters[0].tuning | object | `{}` |  |
| kafka-manager.enabled | bool | `true` |  |
| kafka-manager.fullnameOverride | string | `"kafka-manager"` |  |
| kafka-manager.image.repository | string | `"gradiant/kafka-manager"` |  |
| kafka-manager.image.tag | string | `"2.0.0.2"` |  |
| kafka-manager.ingress.enabled | bool | `true` |  |
| kafka-manager.ingress.hosts[0] | string | `"kafka-manager.127-0-0-1.nip.io"` |  |
| kafka-manager.zkHosts | string | `"zoo-entrance:2181"` |  |
| kafkaHdfsConnector.enabled | bool | `true` |  |
| kafkaHdfsConnector.fullnameOverride | string | `"kafka-hdfs-connector"` |  |
| kibana.enabled | bool | `false` |  |
| kibana.ingress.enabled | bool | `true` |  |
| kibana.ingress.hosts[0] | string | `"kibana.127-0-0-1.nip.io"` |  |
| opentsdb.conf."tsd.storage.hbase.zk_quorum" | string | `"zoo-entrance:2181"` |  |
| opentsdb.daemons | int | `1` |  |
| opentsdb.enabled | bool | `true` |  |
| opentsdb.fullnameOverride | string | `"opentsdb"` |  |
| opentsdb.hbase.enabled | bool | `false` |  |
| opentsdb.hbaseConfigMapName | string | `"hbase"` |  |
| packageRepository.conf.logLevel | string | `"INFO"` |  |
| packageRepository.fullnameOverride | string | `"package-repository"` |  |
| packageRepository.image.pullPolicy | string | `"IfNotPresent"` |  |
| packageRepository.image.repository | string | `"pnda/package-repository"` |  |
| packageRepository.image.tag | string | `"1.1.1"` |  |
| packageRepository.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| packageRepository.persistence.enabled | bool | `true` |  |
| packageRepository.persistence.size | string | `"5Gi"` |  |
| packageRepository.persistence.storageClass | string | `nil` |  |
| packageRepository.resources.limits.cpu | string | `"1000m"` |  |
| packageRepository.resources.limits.memory | string | `"1024Mi"` |  |
| packageRepository.resources.requests.cpu | string | `"10m"` |  |
| packageRepository.resources.requests.memory | string | `"128Mi"` |  |
| packageRepository.service.port | int | `8888` |  |
| packageRepository.service.type | string | `"ClusterIP"` |  |
| prometheus.rbac.enabled | bool | `true` |  |
| prometheus.rbac.namespace | string | `"monitoring"` |  |
| prometheus.rbac.serviceAccount | string | `"prometheus-k8s"` |  |
| prometheus.serviceMonitor.hbase.enabled | bool | `true` |  |
| prometheus.serviceMonitor.hbase.interval | string | `"15s"` |  |
| prometheus.serviceMonitor.hbase.namespace | string | `nil` |  |
| prometheus.serviceMonitor.hdfs.enabled | bool | `true` |  |
| prometheus.serviceMonitor.hdfs.interval | string | `"15s"` |  |
| prometheus.serviceMonitor.hdfs.namespace | string | `nil` |  |
| prometheus.serviceMonitor.kafka.enabled | bool | `true` |  |
| prometheus.serviceMonitor.kafka.interval | string | `"15s"` |  |
| prometheus.serviceMonitor.kafka.namespace | string | `nil` |  |
| prometheus.serviceMonitor.spark.enabled | bool | `true` |  |
| prometheus.serviceMonitor.spark.interval | string | `"15s"` |  |
| prometheus.serviceMonitor.spark.namespace | string | `nil` |  |
| redis.cluster.enabled | bool | `false` |  |
| redis.enabled | bool | `true` |  |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.usePassword | bool | `false` |  |
| roleBindingName | string | `"pnda"` |  |
| roleName | string | `"pnda-role"` |  |
| schemaregistry-ui.enabled | bool | `false` |  |
| schemaregistry-ui.fullnameOverride | string | `"schemaregistry-ui"` |  |
| schemaregistry-ui.ingress.enabled | bool | `true` |  |
| schemaregistry-ui.ingress.hosts[0] | string | `"schema-registry.127-0-0-1.nip.io"` |  |
| schemaregistry-ui.schemaRegistry.proxy | bool | `true` |  |
| schemaregistry-ui.schemaRegistry.url | string | `"http://schemaregistry"` |  |
| schemaregistry-ui.service.type | string | `"ClusterIP"` |  |
| schemaregistry.enabled | bool | `true` |  |
| schemaregistry.fullnameOverride | string | `"schemaregistry"` |  |
| schemaregistry.imageTag | string | `"5.3.2"` |  |
| schemaregistry.kafka.enabled | bool | `false` |  |
| schemaregistry.kafkaStore.overrideBootstrapServers | string | `"PLAINTEXT://strimzi-kafka-bootstrap:9092"` |  |
| serviceAccountName | string | `"pnda"` |  |
| spark-standalone.enabled | bool | `true` |  |
| spark-standalone.fullnameOverride | string | `"spark-standalone"` |  |
| spark-standalone.ingress.enabled | bool | `true` |  |
| spark-standalone.ingress.hosts[0] | string | `"spark.127-0-0-1.nip.io"` |  |
| spark-standalone.workers | int | `1` |  |
| sparkoperator.enabled | bool | `true` |  |
| sparkoperator.fullnameOverride | string | `"sparkoperator"` |  |
| strimzi.enabled | bool | `true` |  |
| strimzi.kafka.enabled | bool | `true` |  |
| strimzi.kafka.replicas | int | `1` |  |
| strimzi.kafkaConnect.enabled | bool | `true` |  |
| strimzi.kafkaConnect.image | string | `"pnda/strimzi-connector:2.3.1"` |  |
| strimzi.kafkaConnect.replicas | int | `1` |  |
| strimzi.zookeeper.replicas | int | `1` |  |
| testing.conf.logLevel | string | `"WARN"` |  |
| testing.enabled | bool | `true` |  |
| testing.fullnameOverride | string | `"testing"` |  |
| testing.image.pullPolicy | string | `"IfNotPresent"` |  |
| testing.image.repository | string | `"pnda/testing"` |  |
| testing.image.tag | string | `"1.1.1"` |  |
| testing.resources.limits.cpu | string | `"1000m"` |  |
| testing.resources.limits.memory | string | `"1024Mi"` |  |
| testing.resources.requests.cpu | string | `"10m"` |  |
| testing.resources.requests.memory | string | `"128Mi"` |  |
| testing.schedule | string | `"* * * * *"` |  |
