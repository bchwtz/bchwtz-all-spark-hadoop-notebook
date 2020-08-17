#!/bin/bash

echo -e "\nexport PDSH_RCMD_TYPE=ssh" >> ~/.bashrc

echo -e "\n" >> ~/.bashrc 
echo 'export HADOOP_HOME="/opt/hadoop-3.3.0"' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/sbin' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=${HADOOP_HOME}' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=${HADOOP_HOME}' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=${HADOOP_HOME}' >> ~/.bashrc
echo 'export YARN_HOME=${HADOOP_HOME}' >> ~/.bashrc