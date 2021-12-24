ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=balkans

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./balkans.sh && cp -v balkans.pdf /pdf

