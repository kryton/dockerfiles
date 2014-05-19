spark-worker
============

Image for Spark Worker.

Usage
-----
This image assumes that the [master](../spark-master) and DNS server has been successfully started already. (See [scripts/run.sh](../scripts/run.sh))

it takes 2 parameters. The cluster name ($PREFIX) and the worker instance number (#)
```
docker run --dns $DNS_SERVER \
    -h worker#.${PREFIX}.spark \
    -d --name ${PREFIX}1 kryton/spark-worker start $PREFIX #

```
It will attempt to register itself with DNS with the pattern worker{#}.#PREFIX.spark (eg. worker57.demo.spark)


