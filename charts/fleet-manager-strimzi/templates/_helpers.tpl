{{- define "tieredStorage.keyPrefix" -}}
{{- if eq .Values.kafka.tieredStorage.cloud "oci" -}}
{{- printf "%s/strimzi-tiered-storage/" .Values.kafka.tieredStorage.bucketName -}}
{{- else -}}
{{- printf "strimzi-tiered-storage/" -}}
{{- end -}}
{{- end -}}


{{- define "tieredStorage.bucketName" -}}
{{- if eq .Values.kafka.tieredStorage.cloud "oci" -}}
{{ .Values.kafka.tieredStorage.oci.namespace -}}
{{- else -}}
{{ .Values.kafka.tieredStorage.bucketName -}}
{{- end -}}
{{- end -}}
