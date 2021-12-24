ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=central_europe

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./central_europe.sh && cp -v central_europe.pdf /pdf

