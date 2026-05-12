#!/bin/sh

set -e

TEMPLATE_DIR="/etc/nginx/templates"
OUTPUT_DIR="/etc/nginx/conf.d"

if [ -d "$TEMPLATE_DIR" ]; then
    for template in "$TEMPLATE_DIR"/*.template; do
        [ -f "$template" ] || continue

        filename=$(basename "$template" .template)

        echo "Generating nginx config: $filename"

        envsubst \
            < "$template" \
            > "$OUTPUT_DIR/$filename"
    done
fi