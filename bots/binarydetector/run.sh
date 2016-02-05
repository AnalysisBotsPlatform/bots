#! /bin/bash

CWD=$(pwd)
RESULT_FILE="${CWD}"/result.txt

cd "$1"
find . -type f ! -path './.git/*' | xargs -I{} bash -c "file {}" | grep -v "ASCII text" | grep -v "empty" > "${RESULT_FILE}"

LINES=$(cat "${RESULT_FILE}" | wc -l)

if [[ ${LINES} != 0 ]]
then
        cat "${RESULT_FILE}"
        cd "${CWD}"
        cp -R "$1/." "$2/"
        cd "$2"
        while read LINE
        do
                echo ${LINE} | awk '{ split($0, a, ":"); print a[1] }' | xargs -I{} bash -c "git rm '{}' > /dev/null"
        done < "${RESULT_FILE}"
        git config user.name "BinaryDetectorBot"
        git config user.email "noreply@analysisbots.com"
        git commit -m "Remove binary files automatically." > /dev/null
        git format-patch @^ --stdout > changes.patch
fi

exit 0
