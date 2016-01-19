# This bot is based on ubuntu
FROM ubuntu:14.04

# Update ubuntu to the newest version and install git
RUN apt-get -y update && apt-get install -y git

# Copy bot into image
COPY run.sh /run.sh

# Generate the statistics
ENTRYPOINT ["/run.sh"]
