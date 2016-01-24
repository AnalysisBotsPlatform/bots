#! /bin/bash

cd $1
find . -name "*.java" |
xargs -I{} bash -c "echo {}: && java -classpath /usr/src/spellchecker/bin wordChecking.Main {}"
