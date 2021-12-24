ARG PROJECT
FROM ${PROJECT}_latineast_arabia:latest

ARG WORK=southwest_asia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD ./southwest_asia.sh && cp -v southwest_asia.pdf /pdf

