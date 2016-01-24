FROM java:latest

COPY run.sh /run.sh
COPY src /usr/src/spellchecker/src/

WORKDIR /usr/src/spellchecker

RUN mkdir bin && javac -sourcepath src -d bin src/editEntry/*.java src/wordChecking/*.java

ENTRYPOINT ["/run.sh"]
