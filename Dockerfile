FROM tensorflow/tensorflow:latest-jupyter
#PRIMER PASO: ACTUALIZO LOS PAQUETES DE UBUNTU, JAVA 

COPY    spark /usr/local/spark 

RUN     apt-get update \
 &&     apt install -y vim \ 
 &&     apt install -y openjdk-8-jdk \
 &&     export SPARK_HOME=/usr/local/spark \
 &&     export HADOOP_HOME=/usr/local/spark \
 &&     export HIVE_HOME=/usr/local/spark \
 &&     export PATH=$PATH:/usr/local/spark/bin:/usr/local/spark/hive/bin

RUN     pip install pandas[complete] \
 &&     pip install pyspark[complete] \
 &&     pip install findspark[complete] \
 &&     pip install jupyterthemes

##EJECUTO EL TEMA DE JUPYTER THEME
RUN jt -t monokai -f fira -fs 13 -nf ptsans -nfs 11 -N -kl -cursw 5 -cursc r -cellw 95% -T

#OCTAVO PASO: VOY A A DIRECCION DEL HOME
RUN cd /home

# ULTIMO PASO: ENCIENDO JUPYTER 
CMD jupyter notebook --ip=0.0.0.0 --allow-root


