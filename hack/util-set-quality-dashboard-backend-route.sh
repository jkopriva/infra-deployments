#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/..
TEMPLATE_FILE="$ROOT/components/quality-dashboard/frontend/backend-url-patch-template.yaml"
PATCH_FILE="$ROOT/components/quality-dashboard/frontend/backend-url-patch.yaml"
export BACKEND_ROUTE=$1

envsubst < $TEMPLATE_FILE > $PATCH_FILE
