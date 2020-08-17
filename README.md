# Docker 

# Run

```
docker run --rm -d --name bchwtz-spark -p 8888:8888 -p 4040:4040 -p 9870:9870 -p 8088:8088 -e GRANT_SUDO=yes --user root -e JUPYTER_ENABLE_LAB=yes -v /Users/benjamin/bchwtz-dtng:/home/jovyan bchwtz/bchwtz-all-spark-hadoop-notebook

docker logs --tail 5 bchwtz-spark
```


docker build https://github.com/bchwtz/bchwtz-all-spark-hadoop-notebook.git -t bchwtz/bchwtz-all-spark-hadoop-notebook