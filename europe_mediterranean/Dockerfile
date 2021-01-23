FROM gmt_debian:1.0

ARG PROJECT=europe_mediterranean

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY battle.dat .
COPY city.dat .
COPY place.dat .

ENTRYPOINT /europe_mediterranean/europe_mediterranean.sh
