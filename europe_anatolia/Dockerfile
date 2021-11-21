FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=europe_anatolia

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./europe_anatolia.sh && cp -v europe_anatolia.pdf /pdf
