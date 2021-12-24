ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=levant_anatolia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./levant_anatolia.sh && cp -v levant_anatolia.pdf /pdf

