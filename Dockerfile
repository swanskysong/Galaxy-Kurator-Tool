# Extended Galaxy DockerFile for Kurator

FROM bgruening/galaxy-stable

MAINTAINER Tianhong Song, swanskysong@gmail.com

# Install Kurator
RUN install-repository "--url https://toolshed.g2.bx.psu.edu/ -o thsong --name kurator"

# Install Oracle Java 8 as required by Kurator
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean
