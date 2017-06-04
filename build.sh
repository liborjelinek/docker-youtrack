#!/usr/bin/env bash

REPO=bircow/youtrack
YOUTRACK_VER=2017.1.31322

docker build -t $REPO:$YOUTRACK_VER -t $REPO:latest --build-arg "YOUTRACK_VER=$YOUTRACK_VER" .