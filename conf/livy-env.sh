 #!/usr/bin/env bash

    # - SPARK_CONF_DIR  Directory containing the Spark configuration to use.
    export SPARK_CONF_DIR=/opt/hadoop-config/spark2/conf

    # - HADOOP_CONF_DIR Directory containing the Hadoop / YARN configuration to use.
    export HADOOP_CONF_DIR=/opt/hadoop-config/hadoop/conf
    export SPARK_HOME=/opt/spark-2.2.0-bin-hadoop2.7
    export HADOOP_HOME=/opt/hadoop-2.7.3
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre   
    export LD_LIBRARY_PATH="$HADOOP_HOME/lib/native/:$LD_LIBRARY_PATH"
    # - LIVY_LOG_DIR  Where log files are stored.  (Default: ${LIVY_HOME}/logs)
    export LIVY_LOG_DIR=/var/log/livy2

    # - LIVY_PID_DIR  Where the pid file is stored. (Default: /tmp)
    export LIVY_PID_DIR=/var/run/livy2

    # - LIVY_SERVER_JAVA_OPTS  Java Opts for running livy server 
    # - (You can set jvm related setting here, like jvm memory/gc algorithm and etc.)
    export LIVY_SERVER_JAVA_OPTS="-Xmx2g"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"

    ## - Print All the Parameters set up for the Livy - ##
    echo "----Livy Server Properties----"
    echo "Spark Configuration Dir: ${SPARK_CONF_DIR}"
    echo "Hadoop Configuration Dir: ${HADOOP_CONF_DIR}"
    echo "Livy Log Dir: ${LIVY_LOG_DIR}"
    echo "Livy PID Dir: ${LIVY_PID_DIR}"
    echo "Livy Server Java Opts: ${LIVY_SERVER_JAVA_OPTS}"
    echo "JAVA HOME $JAVA_HOME"
    echo "--- Java Details ---" 
    java -version
