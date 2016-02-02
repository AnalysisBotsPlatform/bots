#! /bin/bash

CWD=$(pwd)
RESULT_FILE=${CWD}/result.txt

cd $1
find . -type f | xargs -I{} bash -c "file {}" | grep -v "ASCII text" | grep -v "empty" > ${RESULT_FILE}

LINES=$(cat ${RESULT_FILE} | wc -l)

if [[ ${LINES} != 0 ]]
then
        cat ${RESULT_FILE}
        exit 1
else
        exit 0
fi
