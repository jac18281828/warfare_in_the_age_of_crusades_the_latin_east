#!/usr/bin/env /bin/bash

set -e

TAG='gmt_central_europe:1.0'

docker build --tag ${TAG} .

CONTAINER=$(docker run -d --rm ${TAG})

OUTPUT=/central_europe/central_europe.pdf

PDF=../pdf

if [ ! -d ${PDF} ]
then
    mkdir -p ${PDF}
fi

FILE="NOTFOUND"
while [[ "NOTFOUND" == ${FILE} ]]
do
    sleep 1
#   docker logs ${CONTAINER}
    FILE=$(docker exec ${CONTAINER} /bin/sh -c "if [ ! -f ${OUTPUT} ]; then echo NOTFOUND; fi")
done

echo cp ${CONTAINER}:${OUTPUT} ${PDF}
docker cp ${CONTAINER}:${OUTPUT} ${PDF}
docker cp ${CONTAINER}:/central_europe/inset.pdf ${PDF}/central_europe_inset.pdf
