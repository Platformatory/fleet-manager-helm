{{- define "kong.postgresql.fullname" -}}
{{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fleetmanager.ui.domain" -}}
{{- printf "console.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.api.domain" -}}
{{- printf "api.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.docs.domain" -}}
{{- printf "docs.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.loki.domain" -}}
{{- printf "logs.console.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.ws-loki.domain" -}}
{{- printf "wslogs.console.%s" .Values.fleetmanager.domain -}}
{{- end -}}


{{- define "fleetmanager.grafana.domain" -}}
{{- printf "dashboard.console.%s" .Values.fleetmanager.domain -}}
{{- end -}}