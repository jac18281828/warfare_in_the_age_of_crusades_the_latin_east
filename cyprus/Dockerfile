FROM gmt_debian:1.0

ARG PROJECT=cyprus

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY city.dat .

ENTRYPOINT /cyprus/cyprus.sh --sleep
