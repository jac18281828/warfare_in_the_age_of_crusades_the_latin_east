FROM gmt_debian:1.0

ARG PROJECT=europe_anatolia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY battle.dat .
COPY city.dat .
COPY place.dat .

ENTRYPOINT /europe_anatolia/europe_anatolia.sh --sleep
