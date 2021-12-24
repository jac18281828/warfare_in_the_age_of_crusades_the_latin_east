ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=europe_anatolia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./europe_anatolia.sh && cp -v europe_anatolia.pdf /pdf
