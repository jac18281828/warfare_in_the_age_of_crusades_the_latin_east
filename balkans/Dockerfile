FROM gmt_debian:1.0

ARG PROJECT=balkans

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY city.dat .

ENTRYPOINT /balkans/balkans.sh --sleep
