#!/usr/bin/env bash

COMMIT_ID=$(git rev-parse --short HEAD)
docker build . --tag paulintezer/nodessh:latest || exit
docker push paulintezer/nodessh:latest || exit
echo "Pushed successfully with tag: latest"
