# Docker Data Engineering Image
# Maintainer: bchwtz

FROM jupyter/all-spark-notebook:13b866ff67b9

USER root

#COPY . /app
#RUN make /app
#CMD python /app/app.py

RUN apt-get update && apt-get install -y \
    ssh \
    pdsh \
    htop \
    tmux \
    vim

ADD ./script/setup_hadoop.sh /
RUN chmod +x /setup_hadoop.sh
RUN /setup_hadoop.sh

EXPOSE 8888 4040 9870 8088
