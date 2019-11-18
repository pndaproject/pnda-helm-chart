{{/*
Standard Labels from Helm documentation https://helm.sh/docs/chart_best_practices/#labels-and-annotations
*/}}

{{- define "pnda.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
{{- end -}}

{{- define "pnda.console-backend-data-logger.name" -}}
{{- default "console-backend-data-logger" .Values.consoleBackendDataLogger.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "pnda.console-backend-data-logger.fullname" -}}
{{- $name := default "console-backend-data-logger" .Values.consoleBackendDataLogger.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.console-backend-data-logger.labels" -}}
app.kubernetes.io/name:  {{ include "pnda.console-backend-data-logger.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}

{{- define "pnda.console-backend-data-manager.name" -}}
{{- default "console-backend-data-manager" .Values.consoleBackendDataManager.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "pnda.console-backend-data-manager.fullname" -}}
{{- $name := default "console-backend-data-manager" .Values.consoleBackendDataManager.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.console-backend-data-manager.labels" -}}
app.kubernetes.io/name:  {{ include "pnda.console-backend-data-manager.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}

{{- define "pnda.console-frontend.name" -}}
{{- default "console-frontend" .Values.consoleFrontend.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.console-frontend.fullname" -}}
{{- $name := default "console-frontend" .Values.consoleFrontend.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.console-frontend.labels" -}}
app.kubernetes.io/name:  {{ include "pnda.console-frontend.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}

{{- define "pnda.data-service.name" -}}
{{- default "data-service" .Values.dataService.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.data-service.fullname" -}}
{{- $name := default "data-service" .Values.dataService.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.data-service.labels" -}}
app.kubernetes.io/name: {{ include "pnda.data-service.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}

{{- define "pnda.deployment-manager.name" -}}
{{- default "deployment-manager" .Values.deploymentManager.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.deployment-manager.fullname" -}}
{{- $name := default "deployment-manager" .Values.deploymentManager.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.deployment-manager.labels" -}}
app.kubernetes.io/name: {{ include "pnda.deployment-manager.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}

{{- define "pnda.package-repository.name" -}}
{{- default "package-repository" .Values.packageRepository.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.package-repository.fullname" -}}
{{- $name := default "package-repository" .Values.packageRepository.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.package-repository.labels" -}}
app.kubernetes.io/name: {{ include "pnda.package-repository.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}

{{- define "pnda.kafka-hdfs-connector.name" -}}
{{- default "kafka-hdfs-connector" .Values.kafkaHdfsConnector.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.kafka-hdfs-connector.fullname" -}}
{{- $name := default "kafka-hdfs-connector" .Values.kafkaHdfsConnector.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.kafka-hdfs-connector.labels" -}}
app.kubernetes.io/name: {{ include "pnda.kafka-hdfs-connector.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}


{{- define "pnda.testing.name" -}}
{{- default "testing" .Values.testing.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.testing.fullname" -}}
{{- $name := default "testing" .Values.testing.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "pnda.testing.labels" -}}
app.kubernetes.io/name: {{ include "pnda.testing.name" . }}
{{ include "pnda.labels" . }}
{{- end -}}
