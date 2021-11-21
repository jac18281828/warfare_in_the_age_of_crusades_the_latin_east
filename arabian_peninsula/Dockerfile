FROM warfare_in_the_latin_east_latineast_arabia:latest

ARG PROJECT=arabian_peninsula

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD ./arabian_peninsula.sh && cp -v arabian_peninsula.pdf /pdf

