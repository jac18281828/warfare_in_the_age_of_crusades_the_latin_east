ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=anatolia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./anatolia.sh && cp -v anatolia.pdf /pdf

