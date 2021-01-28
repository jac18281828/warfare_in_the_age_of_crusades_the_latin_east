FROM debian:bullseye-slim as builder

RUN apt update && \
    apt -y install gmt 

WORKDIR /bedrock

ARG EAST=42
ARG WEST=-5
ARG NORTH=55
ARG SOUTH=29

COPY ./ETOPO1_Bed_g_gmt4.grd /bedrock

RUN gmt grdcut /bedrock/ETOPO1_Bed_g_gmt4.grd -R${WEST}/${EAST}/${SOUTH}/${NORTH} -G/bedrock/ETOPO1_levant.grd

FROM debian:bullseye-slim

RUN apt update && \
    apt -y install gmt gmt-gshhg-high ghostscript

COPY --from=builder /bedrock/ETOPO1_levant.grd /bedrock/ETOPO1_levant.grd

CMD echo Bedrock!
