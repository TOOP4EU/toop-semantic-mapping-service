#!/bin/bash
set -e #ux # not in dash: pipefail, find out with -o

# Coalesce
export GRLC_URL=${GRLC_URL:-"http://localhost:$GRLC_PORT"}

# Try to make initial configuration every 5 seconds until successful
until /usr/local/bin/confd -log-level="debug" -onetime -backend env -config-file /etc/confd/conf.d/config.default.toml; do
    echo "Waiting for confd to create initial configuration"
    sleep 5
done

exec "$@"