#!/usr/bin/env bash

set -e

docker-compose build

for project in \
    anatolia \
        balkans \
        central_europe \
        cyprus \
        europe_anatolia \
        europe_mediterranean \
        levant \
        niledelta \
        southwest_asia \
        arabian_peninsula
do
    docker-compose run ${project}
done
