#!/bin/bash

wget ftp://ftp.fau.de/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz
tar -xzf hadoop-3.3.0.tar.gz
mv hadoop-3.3.0 /opt/hadoop-3.3.0
rm hadoop-3.3.0.tar.gz