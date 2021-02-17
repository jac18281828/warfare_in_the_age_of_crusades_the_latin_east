#!/usr/bin/env /bin/bash

set -e

DEBTAG='gmt_bedrock_asiaminor:1.0'

docker build --tag ${DEBTAG} .

ALLTAG='gmt_latineast_all:1.0'

docker build --tag ${ALLTAG} -f- . <<EOF

FROM ${DEBTAG}

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

for dir in anatolia balkans central_europe cyprus europe_anatolia europe_mediterranean levant levant_anatolia niledelta
do
    echo $dir ...
    (cd $dir && sh ./build.sh)
done
          
