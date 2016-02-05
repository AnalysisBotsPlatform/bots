FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y git

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
