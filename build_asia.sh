#!/usr/bin/env /bin/bash

set -e

TAG="gmt_bedrock_asiaminor:1.0"
docker build --tag ${TAG} asiaminor/

ALLTAG='gmt_latineast_asiaminor:1.0'

docker build --tag ${ALLTAG} -f- . <<EOF

FROM gmt_bedrock_asiaminor:1.0

WORKDIR /latineast

COPY /anatolia anatolia/
COPY balkans balkans/
COPY central_europe central_europe/
COPY cyprus cyprus/
COPY europe_anatolia europe_anatolia/
COPY europe_mediterranean europe_mediterranean/
COPY levant levant/
COPY levant_anatolia levant_anatolia/
COPY niledelta niledelta/

CMD /bin/bash
EOF

for dir in anatolia balkans central_europe cyprus europe_mediterranean levant niledelta 
do
    echo $dir ...
    (cd $dir && sh ./build.sh)
done
          
