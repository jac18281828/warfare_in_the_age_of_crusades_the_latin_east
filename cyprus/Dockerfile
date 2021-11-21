FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=cyprus

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./cyprus.sh && cp -v cyprus.pdf /pdf

