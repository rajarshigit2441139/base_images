#!/bin/sh

set -e

echo "Running nginx entrypoint scripts..."

for file in /docker-entrypoint.d/*; do
    if [ -x "$file" ]; then
        echo "Executing $file"
        "$file"
    fi
done

echo "Starting nginx..."

exec "$@"