FROM gmt_debian:1.0

ARG PROJECT=levant

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY battle.dat .
COPY city.dat .
COPY castle.dat .
COPY place.dat .

CMD /levant/levant.sh --sleep
