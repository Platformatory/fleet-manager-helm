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

{{- define "fleetmanager.orchestrator.domain" -}}
{{- printf "orchestrator.%s" .Values.fleetmanager.domain -}}
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

{{- define "fleetmanager.renderConfigValue" -}}
{{- $value := .value -}}
{{- $indent := default 0 .indent -}}
{{- $context := .context -}}
{{- $kind := kindOf $value -}}
{{- $isMap := or (kindIs "map" $value) (hasPrefix $kind "map") -}}
{{- $isSlice := or (kindIs "slice" $value) (hasPrefix $kind "slice") -}}
{{- if or $isMap $isSlice -}}
{{ printf "\n%s" (indent $indent (tpl (toYaml $value) $context)) }}
{{- else if or (kindIs "string" $value) (eq $kind "string") -}}
{{ printf " %s" (tpl $value $context) }}
{{- else if kindIs "invalid" $value -}}
{{ printf " \"\"" }}
{{- else -}}
{{ printf " %v" $value }}
{{- end -}}
{{- end -}}
