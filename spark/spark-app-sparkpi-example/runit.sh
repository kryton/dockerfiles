PREFIX=${1-spark}
docker run --dns $(../scripts/ipof ${PREFIX}_dns ) -h demoapp.${PREFIX}.spark  kryton/spark-app-sparkpi-example start ${PREFIX}
