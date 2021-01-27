FROM gmt_debian:1.0

ARG PROJECT=niledelta

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /${PROJECT}

COPY ${PROJECT}.sh .
COPY city.dat .

CMD /niledelta/niledelta.sh --sleep
