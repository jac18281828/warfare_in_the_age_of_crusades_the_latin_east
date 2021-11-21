FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=levant

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./levant.sh && cp -v levant.pdf /pdf

