ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=levant

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./levant.sh && cp -v levant.pdf /pdf

