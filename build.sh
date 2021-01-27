#!/usr/bin/env /bin/bash

set -e

TAG=gmt_debian:1.0

docker build --tag ${TAG} .

for dir in anatolia balkans central_europe cyprus europe_anatolia europe_mediterranean levant levant_anatolia niledelta
do
    echo $dir ...
    (cd $dir && sh ./build.sh)
done
          
