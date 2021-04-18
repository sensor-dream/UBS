#!/bin/env bash

[[ -d discolored-jpg ]] && rm -r -f discolored-jpg
mkdir -p discolored-jpg
# cp -r ${path}/jpg ${path}/discolored-jpg

function oops() {
  convert -charcoal 50 $1 -write ../discolored-jpg/discolored-$1
}

cd jpg

find * -type f -name '*.jpg' -exec -c 'oops $0' {} \;
