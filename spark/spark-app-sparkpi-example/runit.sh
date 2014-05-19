PREFIX=${1-spark}

docker run --dns $(../scripts/ipof.sh ${PREFIX}_dns ) -h demoapp.${PREFIX}.spark  --name ${PREFIX}_sparkpi_example kryton/spark-app-sparkpi-example start ${PREFIX}
#IP_Worker=$(./ipof.sh ${PREFIX}_sparkpi_example )
#SSH_FWDS="$SSH_FWDS -L4040:${IP_Worker}:4040"
