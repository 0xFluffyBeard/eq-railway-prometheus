#!/bin/sh

gomplate --input-dir=/etc/prometheus/templates --output-map='/etc/prometheus/{{ .in | strings.ReplaceAll ".yml.tmpl" ".yml" }}'

sleep 5
exec /bin/prometheus "$@"