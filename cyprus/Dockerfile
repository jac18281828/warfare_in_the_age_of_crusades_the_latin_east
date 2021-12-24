ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=cyprus

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./cyprus.sh && cp -v cyprus.pdf /pdf

