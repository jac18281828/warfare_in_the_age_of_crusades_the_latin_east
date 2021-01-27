FROM gmt_debian:1.0

ARG PROJECT=central_europe

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY city.dat .
COPY battle.dat .

CMD /central_europe/central_europe.sh --sleep
