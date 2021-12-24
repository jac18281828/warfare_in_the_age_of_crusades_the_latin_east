ARG PROJECT
FROM ${PROJECT}_latineast_arabia:latest

ARG WORK=arabian_peninsula

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./arabian_peninsula.sh && cp -v arabian_peninsula.pdf /pdf

