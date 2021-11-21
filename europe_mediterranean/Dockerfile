FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=europe_mediterranean

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./europe_mediterranean.sh && cp -v europe_mediterranean.pdf /pdf
