{{/*
CRD installation helpers used by Giant Swarm.
*/}}
{{- define "starboard-operator.crdInstall" -}}
{{- printf "%s-%s" ( default .Chart.Name .Values.nameOverride | trunc 63 ) "crd-install" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "starboard-operator.CRDInstallAnnotations" -}}
"helm.sh/hook": "pre-install,pre-upgrade"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded,hook-failed"
{{- end -}}

{{/* Create a label which can be used to select any orphaned crd-install hook resources */}}
{{- define "starboard-operator.CRDInstallSelector" -}}
{{- printf "%s" "crd-install-hook" -}}
{{- end -}}

{{/*
Spec post-install job used to apply upstream specs depending on CRDs.
*/}}
{{- define "starboard-operator.specInstall" -}}
{{- printf "%s-%s" ( default .Chart.Name .Values.nameOverride | trunc 63 ) "crd-install" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "starboard-operator.specInstallAnnotations" -}}
"helm.sh/hook": "post-install,post-upgrade"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded,hook-failed"
{{- end -}}

{{/* Create a label which can be used to select any orphaned spec-install hook resources */}}
{{- define "starboard-operator.specInstallSelector" -}}
{{- printf "%s" "spec-install-hook" -}}
{{- end -}}
