ARG PROJECT
FROM ${PROJECT}_latineast_asiaminor:latest

ARG WORK=niledelta

ENV LANG=C.UTF-8 \
    TZ=CDT6CST

WORKDIR /latineast/${WORK}

CMD for EAST in 35 33; do ./niledelta.sh --east ${EAST} && cp -v niledelta_${EAST}.pdf /pdf; done

