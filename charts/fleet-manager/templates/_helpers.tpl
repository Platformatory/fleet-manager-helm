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
{{- printf "logs.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.ws-loki.domain" -}}
{{- printf "wslogs.%s" .Values.fleetmanager.domain -}}
{{- end -}}


{{- define "fleetmanager.grafana.domain" -}}
{{- printf "dashboard.%s" .Values.fleetmanager.domain -}}
{{- end -}}

{{- define "fleetmanager.oidc.idpUrl" -}}
{{- $tokenEndpoint := default "" .Values.fleetmanager.oidc.tokenEndpoint -}}
{{- if $tokenEndpoint -}}
{{- $parsed := urlParse $tokenEndpoint -}}
{{- if and $parsed.scheme $parsed.host -}}
{{- printf "%s://%s" $parsed.scheme $parsed.host -}}
{{- else -}}
{{- $tokenEndpoint -}}
{{- end -}}
{{- end -}}
{{- end -}}
