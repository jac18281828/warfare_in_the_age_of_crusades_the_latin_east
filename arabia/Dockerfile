FROM jac18281828/gmt:latest as builder

WORKDIR /bedrock

ARG EAST=85
ARG WEST=-5
ARG NORTH=55
ARG SOUTH=10

RUN gmt grdcut /bedrock/ETOPO1_Bed_g_gmt4.grd -R${WEST}/${EAST}/${SOUTH}/${NORTH} -G/bedrock/ETOPO1_arabia.grd

FROM debian:bullseye-slim

RUN apt update && \
    apt -y install gmt gmt-gshhg-high ghostscript

COPY --from=builder /bedrock/ETOPO1_arabia.grd /bedrock/ETOPO1_arabia.grd

CMD echo Bedrock!
