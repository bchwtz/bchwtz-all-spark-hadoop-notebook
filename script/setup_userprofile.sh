#!/bin/bash

ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

echo -e "\nexport PDSH_RCMD_TYPE=ssh" >> ~/.bashrc

echo -e "\n" >> ~/.bashrc 
echo 'export HADOOP_HOME="/opt/hadoop-3.3.0"' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=${HADOOP_HOME}' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=${HADOOP_HOME}' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=${HADOOP_HOME}' >> ~/.bashrc
echo 'export YARN_HOME=${HADOOP_HOME}' >> ~/.bashrc

echo 'export JAVA_HOME=$(dirname $(dirname $(update-alternatives --list java)))' >> /opt/hadoop-3.3.0/etc/hadoop/hadoop-env.sh