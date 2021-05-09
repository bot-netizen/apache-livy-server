# Spark Livy Server

Based on the latest release of the [Apache Livy project](https://livy.incubator.apache.org/)


Version is build for running the livy server for a Hadoop Spark cluster, Requires the Spark and Hadoop Config files directory mounted on the `/opt/hadoop-config` directory inside the docker.

* Hadoop YARN configuration: /opt/hadoop-config/hadoop/conf
* Spark YARN configuration: /opt/hadoop-config/spark2/conf

------

### Versions:

* Livy-Server: 0.6.0
* Apache Spark: 2.2.1
* Hadoop Version: 2.7.0
* Python: Python3 

------

### Usage:

* How to Build

```bash
git clone
cd spark-livy
docker build --no-cache -t tdotlabs/spark-livy:0.1.0 .
```

* How to set config
```
1. Download the configurations for Hadoop and Spark2. 
2. Create a Directory and put hadoop and spark config dir in it. 
3. Mount the directory inside the docker as /opt/hadoop-config
```


* How to run

```bash
docker run -d -p 8998:8998 -v /tmp:/tmp tdotlabs/spark-livy:0.1.0 
```
