#!/usr/bin/env bash

CLUSTER_NAME=$1

peg fetch ${CLUSTER_NAME}

peg install ${CLUSTER_NAME} ssh
peg install ${CLUSTER_NAME} aws
peg install ${CLUSTER_NAME} environment
peg install ${CLUSTER_NAME} hadoop
peg install ${CLUSTER_NAME} zookeeper

# install sqoop

peg sshcmd-node ${CLUSTER_NAME} 1 "wget http://apache.spinellicreations.com/sqoop/1.4.6/sqoop-1.4.6.bin__hadoop-2.0.4-alpha.tar.gz -P ~/Downloads" \
" && sudo tar zxvf ~/Downloads/sqoop-1.4.6.bin__hadoop-2.0.4-alpha.tar.gz -C /usr/local" \
" && cd /usr/local" \
" && sudo mv sqoop-1.4.6.bin__hadoop-2.0.4-alpha sqoop" \
" && sudo wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jre6.jar -P /usr/local/sqoop/lib" \
" && echo export SQOOP_HOME=/usr/local/sqoop >> ~/.profile" \
" && export PATH=${PATH}:${SQOOP_HOME}/bin" \
" && . ~/.profile"

'''
" && cd /usr/local/sqoop/bin" \
" && sudo rm configure-sqoop" \
" && sudo touch configure-sqoop" \
" && sudo echo SQOOP_HOME=/usr/local/sqoop >> configure_sqoop" \
" && sudo echo HADOOP_HOME=/usr/local/hadoop >> configure_sqoop" \
" && sudo echo ZOOKEEPER_HOME=/usr/local/zookeeper >> configure_sqoop" \
" && sudo echo export SQOOP_HOME >> configure_sqoop" \
" && sudo echo export HADOOP_HOME >> configure_sqoop" \
" && sudo echo export ZOOKEEPER_HOME >> configure_sqoop" \
" && sudo echo export HADOOP_COMMON_HOME=${HADOOP_HOME} >> configure_sqoop" \
" && sudo echo export HADOOP_MAPRED_HOME=${HADOOP_HOME} >> configure_sqoop" \
" && sudo echo export SQOOP_CONF_DIR=${SQOOP_HOME} >> configure_sqoop" \
" && sudo echo export SQOOP_CLASSPATH=/usr/local/sqoop/conf::/usr/local/sqoop/lib/ant-contrib-1.0b3.jar:/usr/local/sqoop/lib/ant-eclipse-1.0-jvm1.2.jar:/usr/local/sqoop/lib/avro-1.7.5.jar:/usr/local/sqoop/lib/avro-mapred-1.7.5-hadoop2.jar:/usr/local/sqoop/lib/commons-codec-1.4.jar:/usr/local/sqoop/lib/commons-compress-1.4.1.jar:/usr/local/sqoop/lib/commons-io-1.4.jar:/usr/local/sqoop/lib/commons-jexl-2.1.1.jar:/usr/local/sqoop/lib/commons-logging-1.1.1.jar:/usr/local/sqoop/lib/hsqldb-1.8.0.10.jar:/usr/local/sqoop/lib/jackson-annotations-2.3.0.jar:/usr/local/sqoop/lib/jackson-core-2.3.1.jar:/usr/local/sqoop/lib/jackson-core-asl-1.9.13.jar:/usr/local/sqoop/lib/jackson-databind-2.3.1.jar:/usr/local/sqoop/lib/jackson-mapper-asl-1.9.13.jar:/usr/local/sqoop/lib/kite-data-core-1.0.0.jar:/usr/local/sqoop/lib/kite-data-hive-1.0.0.jar:/usr/local/sqoop/lib/kite-data-mapreduce-1.0.0.jar:/usr/local/sqoop/lib/kite-hadoop-compatibility-1.0.0.jar:/usr/local/sqoop/lib/opencsv-2.3.jar:/usr/local/sqoop/lib/paranamer-2.3.jar:/usr/local/sqoop/lib/parquet-avro-1.4.1.jar:/usr/local/sqoop/lib/parquet-column-1.4.1.jar:/usr/local/sqoop/lib/parquet-common-1.4.1.jar:/usr/local/sqoop/lib/parquet-encoding-1.4.1.jar:/usr/local/sqoop/lib/parquet-format-2.0.0.jar:/usr/local/sqoop/lib/parquet-generator-1.4.1.jar:/usr/local/sqoop/lib/parquet-hadoop-1.4.1.jar:/usr/local/sqoop/lib/parquet-jackson-1.4.1.jar:/usr/local/sqoop/lib/postgresql-9.4.1212.jre6.jar:/usr/local/sqoop/lib/slf4j-api-1.6.1.jar:/usr/local/sqoop/lib/snappy-java-1.0.5.jar:/usr/local/sqoop/lib/xz-1.0.jar:/usr/local/sqoop/sqoop-1.4.6.jar:/usr/local/sqoop/sqoop-test-1.4.6.jar >> configure_sqoop" \
" && sudo echo export SQOOP_JAR_DIR=${SQOOP_HOME} >> configure_sqoop" \
" && sudo echo export HADOOP_CLASSPATH=/usr/local/sqoop/conf::/usr/local/sqoop/lib/ant-contrib-1.0b3.jar:/usr/local/sqoop/lib/ant-eclipse-1.0-jvm1.2.jar:/usr/local/sqoop/lib/avro-1.7.5.jar:/usr/local/sqoop/lib/avro-mapred-1.7.5-hadoop2.jar:/usr/local/sqoop/lib/commons-codec-1.4.jar:/usr/local/sqoop/lib/commons-compress-1.4.1.jar:/usr/local/sqoop/lib/commons-io-1.4.jar:/usr/local/sqoop/lib/commons-jexl-2.1.1.jar:/usr/local/sqoop/lib/commons-logging-1.1.1.jar:/usr/local/sqoop/lib/hsqldb-1.8.0.10.jar:/usr/local/sqoop/lib/jackson-annotations-2.3.0.jar:/usr/local/sqoop/lib/jackson-core-2.3.1.jar:/usr/local/sqoop/lib/jackson-core-asl-1.9.13.jar:/usr/local/sqoop/lib/jackson-databind-2.3.1.jar:/usr/local/sqoop/lib/jackson-mapper-asl-1.9.13.jar:/usr/local/sqoop/lib/kite-data-core-1.0.0.jar:/usr/local/sqoop/lib/kite-data-hive-1.0.0.jar:/usr/local/sqoop/lib/kite-data-mapreduce-1.0.0.jar:/usr/local/sqoop/lib/kite-hadoop-compatibility-1.0.0.jar:/usr/local/sqoop/lib/opencsv-2.3.jar:/usr/local/sqoop/lib/paranamer-2.3.jar:/usr/local/sqoop/lib/parquet-avro-1.4.1.jar:/usr/local/sqoop/lib/parquet-column-1.4.1.jar:/usr/local/sqoop/lib/parquet-common-1.4.1.jar:/usr/local/sqoop/lib/parquet-encoding-1.4.1.jar:/usr/local/sqoop/lib/parquet-format-2.0.0.jar:/usr/local/sqoop/lib/parquet-generator-1.4.1.jar:/usr/local/sqoop/lib/parquet-hadoop-1.4.1.jar:/usr/local/sqoop/lib/parquet-jackson-1.4.1.jar:/usr/local/sqoop/lib/postgresql-9.4.1212.jre6.jar:/usr/local/sqoop/lib/slf4j-api-1.6.1.jar:/usr/local/sqoop/lib/snappy-java-1.0.5.jar:/usr/local/sqoop/lib/xz-1.0.jar:/usr/local/sqoop/sqoop-1.4.6.jar:/usr/local/sqoop/sqoop-test-1.4.6.jar >> configure_sqoop" \
" && sudo echo export export SQOOP_CLASSPATH >> configure_sqoop" \
" && sudo echo export export SQOOP_CONF_DIR >> configure_sqoop" \
" && sudo echo export export SQOOP_JAR_DIR >> configure_sqoop" \
" && sudo echo export export HADOOP_CLASSPATH >> configure_sqoop" \
" && sudo echo export export HADOOP_COMMON_HOME >> configure_sqoop" \
" && sudo echo export export HADOOP_MAPRED_HOME >> configure_sqoop"
'''





