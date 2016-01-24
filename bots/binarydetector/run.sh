#! /bin/bash

cd $1
find . -type f | xargs -I{} bash -c "file {}" | grep -v "ASCII text" | grep -v "empty" > result.txt

LINES=$(cat result.txt | wc -l)

if [[ ${LINES} != 0 ]]
then
        cat result.txt
        exit 1
else
        exit 0
fi
