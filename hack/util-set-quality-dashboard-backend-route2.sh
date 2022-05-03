#!/bin/bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/..
PATCH_FILE="$ROOT/components/quality-dashboard/frontend/backend-url-patch.json"
BACKEND_ROUTE=$1

TMP_FILE=$(mktemp)

cat $PATCH_FILE | jq '
    map(
        if (.op == "add" and .path == "/data/BACKEND_ROUTE") then
            {
                "op": .op,
                "path": .path,
                "value": [
                    .value[] | if .name == "BACKEND_ROUTE" then
                        {"name": "BACKEND_ROUTE", "value": "'"$BACKEND_ROUTE"'"}
                    else
                        .
                    end
                ]
            }
        else
            .
        end
    )' > "$TMP_FILE"

mv "$TMP_FILE" "$PATCH_FILE"
