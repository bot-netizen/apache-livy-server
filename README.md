# Apache Livy Docker Container

Based on the latest release of the [Apache Livy project](https://livy.incubator.apache.org/)





------

### Versions:

Livy-Server: 0.6.0

Apache Spark: 2.2.1

Python: Python3 (including boto3 1.9)

    

------

### Usage:

```bash
docker run -d -p 8998:8998 -e SPARK_MASTER_ENDPOINT=1.2.3.4 -e SPARK_MASTER_PORT=7077 -v /tmp:/tmp cloudiator/livy-server:latest
```
