#!/bin/bash  

PROJECT_WRITABLE_PATH=$1
PROJECT_PATH=$2



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


# check whether the project directory contains a pom.xml file
if test ! -f "$PROJECT_PATH/pom.xml" 
then
	echo 'The project directory does not contain a readable pom.xml file needed for the exectution of maven.'
	exit 1
fi

# copy the project to a writable location in order to let maven write its output :)
cp -r "$PROJECT_PATH" "$PROJECT_WRITABLE_PATH"

cd "$PROJECT_WRITABLE_PATH"


echo '-------------------------------------------------------'
cat /home/logo
echo '-------------------------------------------------------'

# execute maven test:
/opt/apache-maven-3.3.9/bin/mvn test | grep -v Download | egrep -v '\[.*\]'



