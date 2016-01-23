FROM ubuntu:14.04

# add necessary scripts and binaries
ADD scripts /home/scripts
ADD binaries /home/binaries

# setup the jdk
RUN mkdir -p /opt/Oracle_Java/
RUN tar -xzf /home/binaries/jdk-8u72-linux-x64.tar.gz
RUN mv jdk1.8.0_72 /opt/Oracle_Java/

RUN /home/scripts/setupJava.sh

# create a folder for binaries of the project to compile to
RUN mkdir -p /home/projectBinaries


ENTRYPOINT ["/home/scripts/executeTests.sh",  "/home/binaries/junit-4.12.jar", "/home/binaries/hamcrest-core-1.3.jar", "/home/projectBinaries", "/home/scripts/execSingleCompiledTest.sh"]

