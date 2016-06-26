#!/bin/bash
# Author: Zak Hassan
# Convenience script for downloading artifacts before running ansible script. You will need to change 'get_url' to 'copy'
curl -o ../roles/pig/files/pig-0.15.0.tar.gz    http://apache.mirror.gtcomm.net/pig/pig-0.15.0/pig-0.15.0.tar.gz
curl -o ../roles/hive/files/apache-hive-2.0.0-bin.tar.gz   http://apache.mirror.gtcomm.net/hive/hive-2.0.0/apache-hive-2.0.0-bin.tar.gz
curl -o ../roles/spark/files/spark-1.6.1-bin-hadoop2.6.tgz   http://d3kbcqa49mib13.cloudfront.net/spark-1.6.1-bin-hadoop2.6.tgz
curl -o ../roles/hadoop/files/hadoop-2.7.1.tar.gz   http://mirror.csclub.uwaterloo.ca/apache/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz
curl -o ../roles/kafka/files/kafka_2.11-0.9.0.1.tgz   http://apachemirror.ovidiudan.com/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz
curl -o ../roles/storm/files/apache-storm-1.0.1.tar.gz   http://apache.mirror.gtcomm.net/storm/apache-storm-1.0.1/apache-storm-1.0.1.tar.gz
curl -o ../roles/zookeeper/files/zookeeper-3.5.0-alpha.tar.gz   http://apache.mirror.gtcomm.net/zookeeper/zookeeper-3.5.0-alpha/zookeeper-3.5.0-alpha.tar.gz
curl -o ../roles/elasticsearch/files/elasticsearch-2.3.3.tar.gz   https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.3/elasticsearch-2.3.3.tar.gz
