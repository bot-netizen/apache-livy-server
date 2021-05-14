# select operating system
FROM ubuntu:20.04

# Use the TZ to speed up the TZ part 
ENV TZ=America/Toronto
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install operating system packages 
#RUN apt-get update -y && apt-get install git curl gettext unzip wget software-properties-common python3-pip dnsutils make -y 
RUN apt-get update && apt-get install unzip wget python3-pip dnsutils -y

# install Java8
RUN apt-get update && apt-get -y install openjdk-8-jdk

# add config, init and source files #
ADD init /opt/docker-init
ADD conf /opt/docker-conf
ADD jars /opt/docker-jars 

# binaries
# apache livy
RUN unzip /opt/docker-jars/livy-0.5.0-incubating-bin.zip -d /opt/

# apache spark
RUN tar -xvf /opt/docker-jars/hadoop-2.7.3.tar.gz -C /opt/

# apache spark
RUN tar -xvzf /opt/docker-jars/spark-2.2.0-bin-hadoop2.7.tgz -C /opt/

# set Python3 as default
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy Livy Cond files
RUN cp /opt/docker-conf/* /opt/livy-0.5.0-incubating-bin/conf/

# expose ports
EXPOSE 8998

# start from init folder
WORKDIR /opt/docker-init
ENTRYPOINT ["./entrypoint"]