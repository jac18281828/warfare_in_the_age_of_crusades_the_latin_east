#!/usr/bin/env /bin/bash

set -e

TAG="gmt_bedrock_arabia:1.0"
docker build --tag ${TAG} arabia/

ALLTAG='gmt_latineast_arabia:1.0'

docker build --tag ${ALLTAG} -f- . <<EOF

FROM ${TAG}

WORKDIR /latineast

COPY arabian_peninsula arabian_peninsula/

CMD /bin/bash
EOF


for dir in arabian_peninsula
do
    echo $dir ...
    (cd $dir && sh ./build.sh)
done
          
