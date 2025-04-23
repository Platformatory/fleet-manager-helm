{{- define "fleetmanager.ui.domain" -}}
{{- printf "app.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.api.domain" -}}
{{- printf "api.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.grafana.domain" -}}
{{- printf "grafana.app.%s" .Values.fleetmanager.domain -}}
{{- end -}}