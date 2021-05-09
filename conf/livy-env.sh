 #!/usr/bin/env bash

    # - SPARK_CONF_DIR  Directory containing the Spark configuration to use.
    export SPARK_CONF_DIR=/usr/hadoop/spark2/conf

    # - HADOOP_CONF_DIR Directory containing the Hadoop / YARN configuration to use.
    export HADOOP_CONF_DIR=/opt/hadoop-config/hadoop/conf

    # - LIVY_LOG_DIR    Where log files are stored.  (Default: ${LIVY_HOME}/logs)
    export LIVY_LOG_DIR=/var/log/livy2

    # - LIVY_PID_DIR    Where the pid file is stored. (Default: /tmp)
    export LIVY_PID_DIR=/var/run/livy2

    # - LIVY_SERVER_JAVA_OPTS  Java Opts for running livy server 
    # - (You can set jvm related setting here, like jvm memory/gc algorithm and etc.)
    export LIVY_SERVER_JAVA_OPTS="-Xmx2g"


    ## - Print All the Parameters set up for the Livy - ##
    echo "----Livy Server Properties----"
    echo "Spark Configuration Dir: ${SPARK_CONF_DIR}"
    echo "Hadoop Configuration Dir: ${HADOOP_CONF_DIR}"
    echo "Livy Log Dir: ${LIVY_LOG_DIR}"
    echo "Livy PID Dir: ${LIVY_PID_DIR}"
    echo "Livy Server Java Opts: ${LIVY_SERVER_JAVA_OPTS}"
    echo "Java Home: ${JAVA_HOME}"
    echo "Java version:" 
    java -version
