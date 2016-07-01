

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

## Prerequisite:

Hadoop will require creation of public key private key pair. Create your public id_rsa.pub, id_rsa and place it in this folder:

`/roles/hadoop/files/`


## Vagrant
```bash
vagrant plugin install vagrant-env
vagrant up
```

## Screenshot of Cassandra 3 Node Cluster
![alt tag](https://raw.githubusercontent.com/BZCareer/monitor.d/master/imgs/Cassandra-3-NodeCluster.png)

## License

Licensed under the Apache License, Version 2.0.
