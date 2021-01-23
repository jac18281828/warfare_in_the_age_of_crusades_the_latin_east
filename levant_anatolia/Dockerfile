FROM gmt_debian:1.0

ARG PROJECT=levant_anatolia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY city.dat .

ENTRYPOINT /levant_anatolia/levant_anatolia.sh --sleep
