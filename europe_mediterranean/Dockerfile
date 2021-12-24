ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=europe_mediterranean

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./europe_mediterranean.sh && cp -v europe_mediterranean.pdf /pdf
