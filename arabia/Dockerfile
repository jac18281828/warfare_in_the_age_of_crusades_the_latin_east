FROM jac18281828/gmt:110521 as builder

WORKDIR /bedrock

ARG EAST=85
ARG WEST=-5
ARG NORTH=55
ARG SOUTH=10

RUN gmt grdcut /bedrock/ETOPO1_Bed_g_gmt4.grd -R${WEST}/${EAST}/${SOUTH}/${NORTH} -G/bedrock/ETOPO1_arabia.grd

FROM debian:stable-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
        apt update && \
        apt install -y -q --no-install-recommends \
        gmt gmt-gshhg-high ghostscript

RUN rm -rf /var/lib/apt/lists/*

COPY --from=builder /bedrock/ETOPO1_arabia.grd /bedrock/ETOPO1_arabia.grd

CMD echo Bedrock!
