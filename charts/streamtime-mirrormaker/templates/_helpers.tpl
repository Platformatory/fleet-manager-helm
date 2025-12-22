{{/*
Expand the name of the chart.
*/}}
{{- define "streamtime-mirrormaker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "streamtime-mirrormaker.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "streamtime-mirrormaker.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "streamtime-mirrormaker.labels" -}}
helm.sh/chart: {{ include "streamtime-mirrormaker.chart" . }}
{{ include "streamtime-mirrormaker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "streamtime-mirrormaker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "streamtime-mirrormaker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
KafkaMirrorMaker2 name
*/}}
{{- define "streamtime-mirrormaker.mirrorMaker2Name" -}}
{{- printf "%s-mirrormaker2" (include "streamtime-mirrormaker.fullname" .) }}
{{- end }}

{{/*
Source cluster authentication secret name
*/}}
{{- define "streamtime-mirrormaker.sourceAuthSecretName" -}}
{{- printf "%s-source-auth" (include "streamtime-mirrormaker.fullname" .) }}
{{- end }}

{{/*
Destination cluster authentication secret name
*/}}
{{- define "streamtime-mirrormaker.destinationAuthSecretName" -}}
{{- printf "%s-destination-auth" (include "streamtime-mirrormaker.fullname" .) }}
{{- end }}

