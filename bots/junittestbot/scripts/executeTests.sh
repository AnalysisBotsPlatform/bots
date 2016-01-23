#!/bin/bash  


PROJECT_PATH=$5
TEST_PATH="${PROJECT_PATH}"/src/test
SOURCE_PATH="${PROJECT_PATH}"/src

JUNIT_PATH=$1
HAMCREST_PATH=$2

BIN_PATH=$3

PRINT_SCRIPT_PATH=$4


# check for non-empty argument
if test -z "$PROJECT_PATH"
then
	echo 'Please specifiy the root directory of your project as the first argument to this bot.'
	exit 1
fi


# check whether the given path is a valid directory
if test ! -d "$PROJECT_PATH" -a ! -r "$PROJECT_PATH"
then
	echo -n 'The path "'
	echo -n $PROJECT_PATH
	echo  '" you specified is not a valid directory or not readable.'
	exit 1
fi


# check whether the project directory contains a test directory
if test ! -d "$TEST_PATH" -a ! -r "$TEST_PATH"
then
	echo 'The project directory does not contain a readable test directory. The bot expects a directory structure like /src/test'
	exit 1
fi



# find the java testfiles and compile
find  "$TEST_PATH" -type f -name '*.java' -exec javac -d "$BIN_PATH" -cp "$PROJECT_PATH/src:$JUNIT_PATH" {} ";"

# run the tests
cd "$BIN_PATH"
#find "test" -type f -name '*.class' -exec bash -c "echo ____________________________; echo TEST:\ {}; java -cp '.:$JUNIT_PATH:$HAMCREST_PATH'"' org.junit.runner.JUnitCore $(echo {} | tr "/" "." | sed -e s/.class$//)' ";"

find "test" -type f -name '*.class' -exec "$PRINT_SCRIPT_PATH" {}  "$JUNIT_PATH" "$HAMCREST_PATH" ";"
