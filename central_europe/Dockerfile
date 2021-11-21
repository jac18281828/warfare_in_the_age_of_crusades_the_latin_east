FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=central_europe

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./central_europe.sh && cp -v central_europe.pdf /pdf

