# Spark base
# Modified based on amplab/docker-scripts <github.com/amplab/docker-scripts>
#
FROM kryton/jdk7

ENV SCALA_VERSION 2.10.3
ENV SPARK_VERSION 0.9.1
# hadoop1, cdh4, hadoop2
ENV SPARK_BIN_VERSION hadoop1
#ENV SCALA_HOME /opt/scala-$SCALA_VERSION
ENV SPARK_HOME /opt/spark-$SPARK_VERSION

RUN apt-get install -y wget 

# Install Scala
#RUN (cd / && wget -q http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.tgz && gunzip < scala-$SCALA_VERSION.tgz)|(cd /opt && tar -xvf - && rm /scala-$SCALA_VERSION.tgz)

# Install Spark
RUN (cd / && wget -q http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VERSION-bin-$SPARK_BIN_VERSION.tgz && gunzip < spark-$SPARK_VERSION-bin-$SPARK_BIN_VERSION.tgz)|(cd /opt && tar -xvf - && ln -s /opt/spark-$SPARK_VERSION-bin-$SPARK_BIN_VERSION /opt/spark-$SPARK_VERSION && rm /spark-$SPARK_VERSION-bin-$SPARK_BIN_VERSION.tgz)

# Add Shark config files and configure script
ADD files/log4j.properties   /opt/spark-$SPARK_VERSION/conf/
#ADD files/log4j.properties  /root/spark_files
#RUN cd / && cp /root/spark_files/log4j.properties /opt/spark-$SPARK_VERSION/conf/
#RUN mkdir /root/.ssh && cp /root/spark_files/id_rsa_IH_docker.pub /root/.ssh/authorized_keys

# Setup sshd
#RUN apt-get install -y openssh-server
#RUN mkdir /var/run/sshd
#RUN echo 'root:password' |chpasswd

# Override if required (e.g. using net=host)
#ENV SSHD_PORT 22

#CMD    /usr/sbin/sshd -p $SSHD_PORT -D
