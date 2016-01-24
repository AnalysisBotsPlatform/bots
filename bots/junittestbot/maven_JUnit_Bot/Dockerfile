FROM ubuntu:14.04

# add necessary scripts and binaries
ADD scripts /home/scripts
ADD binaries /home/binaries
ADD logo /home/logo

# setup the jdk
RUN mkdir -p /opt/Oracle_Java/
RUN tar -xzf /home/binaries/jdk-8u72-linux-x64.tar.gz
RUN mv jdk1.8.0_72 /opt/Oracle_Java/
RUN /home/scripts/setupJava.sh

#setup maven
RUN tar -xzf /home/binaries/apache-maven-3.3.9-bin.tar.gz
RUN mv apache-maven-3.3.9 /opt/apache-maven-3.3.9


ENTRYPOINT ["/home/scripts/executeTests.sh", "/home/ProjectWritable"]

