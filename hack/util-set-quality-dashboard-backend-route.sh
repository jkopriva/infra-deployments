#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/..
PATCH_FILE="$ROOT/components/quality-dashboard/frontend/backend-url-patch.yaml"
export BACKEND_ROUTE=$1
TMP_FILE=$(mktemp)

envsubst < $PATCH_FILE > $TMP_FILE
mv "$TMP_FILE" "$PATCH_FILE"
