#!/usr/bin/env bash

# Source config variables
. $(pwd -P)/config

# Config check
if [[ ! $PORT ]]; then echo 'Missing $PORT (YouTrack network port) config variable!'; exit; fi
if [[ ! $DB ]]; then echo 'Missing $DB (YouTrack DB folder) config variable!'; exit; fi

docker run \
    -d
    --rm \
    --restart=always \
    -p $PORT:8080 \
    -v $DB:/youtrack/db \
    --name youtrack \
    $REPO

echo "Wait 20 seconds to initialize..."
sleep 20
echo "Go to http://localhost:$PORT in your browser and enjoy!"