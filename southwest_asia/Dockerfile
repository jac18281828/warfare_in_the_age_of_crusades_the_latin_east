FROM warfare_in_the_latin_east_latineast_arabia:latest

ARG PROJECT=southwest_asia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./southwest_asia.sh && cp -v southwest_asia.pdf /pdf

