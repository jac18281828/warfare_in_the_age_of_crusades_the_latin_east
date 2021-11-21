FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=balkans

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./balkans.sh && cp -v balkans.pdf /pdf

