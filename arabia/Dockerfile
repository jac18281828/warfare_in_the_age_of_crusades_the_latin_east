FROM jac18281828/bedrock:latest as builder

WORKDIR /bedrock

ARG WEST=20
ARG EAST=85
ARG NORTH=50
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
