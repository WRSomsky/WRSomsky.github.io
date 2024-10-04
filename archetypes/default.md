+++
draft = true
date = {{ .Date }}
title = '{{ replace .File.ContentBaseName "-" " " | title }}'

categories = [
{{- $categories := .Site.Taxonomies.categories }}
{{- range $name, $taxonomy := $categories }}
  ## "{{$name}}",
{{- end }}
  ]
tags = [
{{- $tags := .Site.Taxonomies.tags }} {{- range $name, $taxonomy := $tags }}
  ## "{{$name}}",
{{- end }}
  ]
+++
