#!/bin/bash


chown -R jovyan:users /opt/hadoop-3.3.0


/etc/init.d/ssh start
hdfs namenode -format
start-dfs.sh
#start-yarn.sh
