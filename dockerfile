# Docker Data Engineering Image
# Maintainer: bchwtz

LABEL maintainer="bchwtz"

FROM jupyter/all-spark-notebook:13b866ff67b9

USER root

RUN apt-get update && apt-get install -y \
    ssh \
    pdsh \
    htop \
    tmux \
    vim \
	&& apt-get autoremove -yqq --purge \
    && apt-get clean

RUN wget ftp://ftp.fau.de/apache/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz \
	&& tar -xzf hadoop-3.3.0.tar.gz -C /opt \
	&& rm hadoop-3.3.0.tar.gz \
	&& chown -R jovyan:users /opt/hadoop-3.3.0
	
COPY ./config/hadoop/core-site.xml /opt/hadoop-3.3.0/etc/hadoop/
COPY ./config/hadoop/hdfs-site.xml /opt/hadoop-3.3.0/etc/hadoop/
COPY ./config/hadoop/mapred-site.xml /opt/hadoop-3.3.0/etc/hadoop/
COPY ./config/hadoop/yarn-site.xml /opt/hadoop-3.3.0/etc/hadoop/

COPY ./script/setup_userprofile.sh /
RUN chmod +x /setup_userprofile.sh

USER jovyan

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa \
	&& cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
	&& chmod 0600 ~/.ssh/authorized_keys

RUN echo -e "\nexport PDSH_RCMD_TYPE=ssh" >> ~/.bashrc \
	&& echo -e "\n" >> ~/.bashrc \
	&& echo 'export HADOOP_HOME="/opt/hadoop-3.3.0"' >> ~/.bashrc \
	&& echo 'export PATH=$PATH:$HADOOP_HOME/bin' >> ~/.bashrc \
	&& echo 'export PATH=$PATH:$HADOOP_HOME/sbin' >> ~/.bashrc \
	&& echo 'export HADOOP_MAPRED_HOME=${HADOOP_HOME}' >> ~/.bashrc \
	&& echo 'export HADOOP_COMMON_HOME=${HADOOP_HOME}' >> ~/.bashrc \
	&& echo 'export HADOOP_HDFS_HOME=${HADOOP_HOME}' >> ~/.bashrc \
	&& echo 'export YARN_HOME=${HADOOP_HOME}' >> ~/.bashrc \
	&& echo 'export JAVA_HOME=$(dirname $(dirname $(update-alternatives --list java)))' >> /opt/hadoop-3.3.0/etc/hadoop/hadoop-env.sh

EXPOSE 8888 4040 9870 8088
