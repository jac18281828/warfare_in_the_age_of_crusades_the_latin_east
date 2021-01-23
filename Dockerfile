FROM debian:bullseye-slim

RUN apt update && \
    apt -y install gmt ghostscript

WORKDIR /bedrock

COPY ../ETOPO1_Bed_g_gmt4.grd /bedrock

ENTRYPOINT ["echo", "Bedrock!"]
