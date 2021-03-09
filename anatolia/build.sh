#!/usr/bin/env /bin/sh

set -e

ALLTAG=gmt_latineast_asiaminor:1.0
WORKDIR=latineast
PROJECT=anatolia

IMAGEID=$(docker build -q -<<EOF
FROM ${ALLTAG}

ARG PROJECT=${PROJECT}

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

RUN ls -l

CMD ./${PROJECT}.sh --sleep

EOF
       )

CONTAINER=$(docker run -d --rm -t ${IMAGEID})

OUTPUT=/${WORKDIR}/${PROJECT}/${PROJECT}.pdf

PDF=../pdf

if [ ! -d ${PDF} ]
then
    mkdir -p ${PDF}
fi

FILE="NOTFOUND"
while [ "NOTFOUND" = "${FILE}" ]
do
    sleep 1
    #docker logs ${CONTAINER}
    FILE=$(docker exec ${CONTAINER} /bin/sh -c "if [ ! -s ${OUTPUT} ]; then echo NOTFOUND; fi")
done

sleep 5

echo cp ${CONTAINER}:${OUTPUT} ${PDF}
docker cp ${CONTAINER}:${OUTPUT} ${PDF}
