#!/bin/sh

REDIS_PASSWORD="${REDIS_PASSWORD:-""}"
EXTERNAL_PORT="${PORT:-6379}"
DATA_FOLDER="${DATA_FOLDER:-""}"
test -z "$REDIS_PASSWORD" && echo "Set REDIS_PASSWORD env" >&2 && exit 1
test -z "$DATA_FOLDER" && echo "Set DATA_FOLDER env" >&2 && exit 1

echo "Binding to $EXTERNAL_PORT" >&2

docker run --env REDIS_PASSWORD="$REDIS_PASSWORD" -v "$DATA_FOLDER:/data" --rm -ti -p "$EXTERNAL_PORT:6379" ajnasz/redis
