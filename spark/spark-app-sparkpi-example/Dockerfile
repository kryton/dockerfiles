# Spark application example: SparkPi
#
FROM kryton/spark-base:0.9.1

# Override the following
# ENV SPARK_MASTER_IP
# ENV SPARK_MASTER_PORT
# ENV SPARK_PUBLIC_DNS

# Override and bind the application to the specified ports
# ENV SPARK_JAVA_OPTS=-Dspark.ui.port=

# Not used
# ENV SPARK_LOCAL_IP

ADD files/default_cmd /usr/local/bin/start
EXPOSE 4040
CMD ["/usr/local/bin/start"]
