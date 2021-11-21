FROM warfare_in_the_latin_east_latineast_asiaminor:latest

ARG PROJECT=niledelta

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${PROJECT}

CMD for EAST in 35 33; do ./niledelta.sh --east ${EAST} && cp -v niledelta_${EAST}.pdf /pdf; done

