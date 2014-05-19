spark-master
============

Image for Spark Master.

Usage
-----

This should be run via the 'scripts/run.sh', but 'normally' should be run via
it takes as a input parameter the IP# of the DNS server, so it can register itself with it

```
  docker run  --dns $DNS_SERVER \
       -d -h master.${PREFIX}.spark \
       --name ${PREFIX}_master $IMAGEMASTER start $DNS_SERVER

```

TODO: if DNS-server isn't specified it shouldn't attempt to register itself, and assume it's been done for it
