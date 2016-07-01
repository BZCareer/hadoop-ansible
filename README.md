

# Hadoop Ansible

This ansible playbook contains roles for the following technologies:

* Apache Hadoop v2.7.1
* Apache Spark v1.6.1
* Apache Storm v1.0.1
* Apache Zookeeper v3.5.0
* Apache Kafka v2.11-0.9.0.1
* Apache Pig v0.15.0
* Apache Hive v2.0.0
* ElasticSearch v2.3.3
* Cassandra v3.7

Note: This ansible module is not ready yet and is still in development.

## Ansible Variables:

If you would like to select which roles you would like to use in this playbook, I've exposed variables for each module `install_$role` so you can include the ones you want and not include others. See below example of inventory.yml variables:


```bash

[all:vars]
# Required variables for this installation
HOME=/home/vagrant
zk_urls=hadoopmaster:2181,hadoopdata1:2181,hadoopdata2:2181
hadoop_gid=hadoop
hadoop_uid=hadoop
hadoopmaster=192.168.33.40

# For selecting which modules to install. To enable set each variable below to true. To disable set to false
install_zookeeper=true
install_hadoop=true
install_kafka=true
install_storm=true
install_spark=true
install_cassandra=true
install_elasticsearch=true
install_kibana=true
install_logstash=true
install_pig=true
install_mysql=true
install_hive=true
```

## Prerequisite:

Hadoop will require creation of public key private key pair. Create your public id_rsa.pub, id_rsa and place it in this folder:

`/roles/hadoop/files/`


## Vagrant
```bash
vagrant plugin install vagrant-env
vagrant up
```

## Screenshots:

* Apache Cassandra 3 Node Cluster
![alt tag](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/Cassandra-3-NodeCluster.png)

* Apache Hadoop 3 Node Cluster
![alt tag](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/Hadoop-DataNods.png)
![alt tag](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/HadoopYarn.png)			

* Apache Spark 3 Node Cluster
![alt tag](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/SparkJobs.png)
![alt tag](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/SparkExecutors.png)
![alt tag](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/SparkStandaloneConsole.png)

## Video Demo:

Click on image below to see video demonstration:

[![ScreenShot](https://raw.githubusercontent.com/BZCareer/hadoop-ansible/master/imgs/VideoDemoScreenshot.png)](https://vimeo.com/170316038)



## License
Licensed under the Apache License, Version 2.0.
