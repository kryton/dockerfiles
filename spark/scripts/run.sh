cd $(dirname $0)

HOW_MANY=${1}
PREFIX=${2-spark}
IMAGE=${3-kryton/spark-worker}
IMAGEMASTER=${4-kryton/spark-master}

if [[ ${#@} = 0 ]]; then
    echo Runs multiple spark worker containers
    echo usage: $0 NUMBER-OF-CONTAINERS [HOSTNAME-PREFIX] [IMAGE-NAME]
    echo
    echo Defaults: HOSTNAME-PREFIX:$PREFIX, IMAGE-NAME:$IMAGE
    echo Example: $0 3      # => Runs 3 spark workers container called spark1, spark2 & spark3
    echo Example: $0 1 demo # => Runs 1 spark worker container called demo1
    exit 1
fi

docker run -p 80:80 -p 53:53 -p 53:53/udp -d --name ${PREFIX}_dns -h dns.${PREFIX}.spark lijin/dnsmasq-rest-api:precise
DNS_SERVER=$(./ipof.sh ${PREFIX}_dns )

echo "Sleeping 10s to wait for DNS to come up"
sleep 10

docker run  --dns $DNS_SERVER \
    -d -h master.${PREFIX}.spark \
    --name ${PREFIX}_master $IMAGEMASTER start $DNS_SERVER

MASTER_IP=$(./ipof.sh ${PREFIX}_master )
echo master IP is ${MASTER_IP}

docker run --dns $DNS_SERVER \
    -h worker1.${PREFIX}.spark \
    -d --name ${PREFIX}1 $IMAGE start $PREFIX 1 


for (( instance=$HOW_MANY; $instance > 1; instance=$instance - 1 )); do
    docker run --dns $DNS_SERVER -h worker${instance}.${PREFIX}.spark -d --name ${PREFIX}${instance} $IMAGE start $PREFIX $instance 

done
docker attach ${PREFIX}_master
