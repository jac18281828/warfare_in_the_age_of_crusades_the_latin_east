#!/usr/bin/env /bin/bash

set -e

TAG="gmt_bedrock_arabia:1.0"
docker build --tag ${TAG} arabia/

ALLTAG='gmt_latineast_arabia:1.0'

docker build --tag ${ALLTAG} -f- . <<EOF

FROM ${TAG}

WORKDIR /latineast

COPY southwest_asia/ southwest_asia
COPY arabian_peninsula arabian_peninsula/

CMD /bin/bash
EOF

#docker scan ${ALLTAG}


for dir in arabian_peninsula southwest_asia
do
    echo $dir ...
    (cd $dir && sh ./build.sh)
done
          
