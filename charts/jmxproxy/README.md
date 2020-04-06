jmxproxy
========
JMXProxy exposes all available MBean attributes on a given JVM via simple HTTP request. The results are in easily-parsable JSON format.

Source code can be found [here](https://mk23.github.io/jmxproxy/)



## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"gradiant/jmxproxy"` |  |
| image.tag | string | `"3.4.0"` |  |
| nodeSelector | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.port | int | `8000` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
