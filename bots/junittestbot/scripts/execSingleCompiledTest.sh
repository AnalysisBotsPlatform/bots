#!/bin/bash

TEST_PATH=$1

JUNIT_PATH=$2
HAMCREST_PATH=$3

echo "+++++++++++++++++++++++++++++++++++++++++++"
echo "TEST: $(echo "$TEST_PATH" |  sed -e 's/.*\/\(.*\)\.class$/\1/')"
echo "+++++++++++++++++++++++++++++++++++++++++++"

java -cp ".:$JUNIT_PATH:$HAMCREST_PATH" org.junit.runner.JUnitCore $(echo "$TEST_PATH" | tr "/" "." | sed -e 's/\.class$//') | grep -v 'at ' | sed -e 's/^java.lang./    /'

echo "___________________________________________"
