# Docker Data Engineering Image
# Maintainer: bchwtz

FROM jupyter/all-spark-notebook:13b866ff67b9

USER jovyan



USER root

RUN apt-get update && apt-get install -y \
    ssh \
    pdsh \
    htop \
    tmux \
    vim

RUN wget ftp://ftp.fau.de/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz \
	&& tar -xzf hadoop-3.3.0.tar.gz -C /opt \
	&& mv hadoop-3.3.0 /opt/hadoop-3.3.0 \
	&& rm hadoop-3.3.0.tar.gz
	
ADD ./script/setup_hadoop.sh /
RUN chmod +x /setup_hadoop.sh
RUN /setup_hadoop.sh

ADD ./config/hadoop/core-site.xml /opt/hadoop-3.3.0/etc/hadoop/
ADD ./config/hadoop/hdfs-site.xml /opt/hadoop-3.3.0/etc/hadoop/
ADD ./config/hadoop/mapred-site.xml /opt/hadoop-3.3.0/etc/hadoop/
ADD ./config/hadoop/yarn-site.xml /opt/hadoop-3.3.0/etc/hadoop/

ADD ./script/setup_userprofile.sh /
RUN chmod +x /setup_userprofile.sh

USER jovyan
RUN /setup_userprofile.sh


EXPOSE 8888 4040 9870 8088
