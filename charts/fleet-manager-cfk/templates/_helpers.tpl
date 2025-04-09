{{- define "oauth.clientIdSecret" -}}
{{- printf "%s:%s" .Values.oauth.clientId .Values.oauth.clientSecret -}}
{{- end -}}