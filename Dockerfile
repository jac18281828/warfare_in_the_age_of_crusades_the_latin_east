FROM debian:bullseye-slim

RUN apt update && \
    apt -y install gmt gmt-gshhg-high ghostscript

WORKDIR /bedrock

COPY ./ETOPO1_Bed_g_gmt4.grd /bedrock

CMD echo Bedrock!
