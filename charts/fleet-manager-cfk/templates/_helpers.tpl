{{- if and (empty .Values.certs.kafka.cert) (empty .Values.certManager.route53.hostedZoneID) -}}
{{- fail "Either .Values.certs.kafka.cert or .Values.certManager.route53.hostedZoneID must be set" -}}
{{- end -}}
