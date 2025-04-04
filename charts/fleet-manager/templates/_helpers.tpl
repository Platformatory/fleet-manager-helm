{{- define "kong.postgresql.fullname" -}}
{{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fleetmanager.ui.domain" -}}
{{- printf "app.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.api.domain" -}}
{{- printf "api.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.loki.domain" -}}
{{- printf "loki.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.ws-loki.domain" -}}
{{- printf "ws-loki.%s" .Values.fleetmanager.domain -}}
{{- end -}}