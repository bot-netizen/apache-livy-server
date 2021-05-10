# select operating system
FROM ubuntu:20.04

# Use the TZ to speed up the TZ part 
ENV TZ=America/Toronto
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install operating system packages 
RUN apt-get update -y && apt-get install git curl gettext unzip wget software-properties-common python3-pip dnsutils make -y 
#RUN apt-get update && apt-get install curl unzip wget python3-pip dnsutils -y

# install Java8
RUN apt-get update && apt-get -y install openjdk-8-jdk

# use bpkg to handle complex bash entrypoints
# setting this env explicitly is required to get the bpkg install script working 
ENV USER=root
RUN curl -Lo- "https://raw.githubusercontent.com/bpkg/bpkg/master/setup.sh" | bash
RUN bpkg install cha87de/bashutil -g
## add more bash dependencies, if necessary 

# add config, init and source files 
ADD init /opt/docker-init
ADD conf /opt/docker-conf

# binaries
# apache livy
RUN wget http://mirror.23media.de/apache/incubator/livy/0.6.0-incubating/apache-livy-0.6.0-incubating-bin.zip -O /tmp/livy-0.6.0-incubating-bin.zip
RUN unzip /tmp/livy-0.6.0-incubating-bin.zip -d /opt/

# apache spark
RUN wget https://archive.apache.org/dist/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz -O /tmp/spark-2.2.0-bin-hadoop2.7.tgz
RUN tar -xvzf /tmp/spark-2.2.0-bin-hadoop2.7.tgz -C /opt/

# set Python3 as default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy Livy Cond files
RUN cp /opt/docker-conf/* /opt/apache-livy-0.6.0-incubating-bin/conf/

# expose ports
EXPOSE 8998

# start from init folder
WORKDIR /opt/docker-init
ENTRYPOINT ["./entrypoint"]
