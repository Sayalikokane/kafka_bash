#!/bin/bash
sudo apt update
sudo apt install default-jre -y
java --version
sudo apt install default-jdk -y
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker --version
sudo apt update

wget -qO - https://packages.confluent.io/deb/7.5/archive.key | sudo apt-key add -
(cd /etc/apt || exit;)
sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/7.5 stable main"
sudo add-apt-repository "deb https://packages.confluent.io/clients/deb $(lsb_release -cs) main"

sudo apt-get update && sudo apt-get install confluent-platform

export CONFLUENT_HOME=/usr/local/bin
echo "CONFLUENT_HOME set to: $CONFLUENT_HOME"
export CONFLUENT_HOME=/usr/local/bin
export PATH=$PATH:$CONFLUENT_HOME/bin
echo "PATH updated with CONFLUENT_HOME/bin: $PATH"

confluent --help
confluent --version

(cd /root || exit;)
(cd /etc/kafka || exit;)
cd /etc/kafka

echo "$tickTime=2000" >> "$zookeeper.properties"
echo "$dataDir=/var/lib/zookeeper/" >> "$zookeeper.properties"
echo "$clientPort=2181" >> "$zookeeper.properties"
echo "$initLimit=5" >> "$zookeeper.properties"
echo "$syncLimit=2" >> "$zookeeper.properties"
echo "$server.1=kaifka3:2888:3888" >> "$zookeeper.properties"
echo "$autopurge.snapRetainCount=3" >> "$zookeeper.properties"
echo "$autopurge.purgeInterval=24" >> "$zookeeper.properties"
echo "$broker.id=1" >> "$server.properties"
echo "$zookeeper.connect=kaifka3:2181" >> "$server.properties"
(cd /etc/schema-registry || exit;)
echo "Current working directory: $(pwd)"
echo "$listeners=http://0.0.0.0:8081" >> "$schema-registry.properties"

#note- change vm IP
echo "$host.name=172.208.66.26" >> "$schema-registry.properties" 
echo "$kafkastore.bootstrap.servers=PLAINTEXT://kaifka3:9092,SSL://kaifka3:9092" >> "$schema-registry.properties"

sudo systemctl start confluent-zookeeper
sudo systemctl start confluent-server
sudo systemctl start confluent-kafka  
sudo systemctl start confluent-schema-registry 
sudo systemctl start confluent-kafka-connect 
sudo systemctl start confluent-kafka-rest 
sudo systemctl start confluent-ksqldb 

confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.0.4
confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.6.1
confluent-hub install --no-prompt debezium/debezium-connector-mysql:latest
confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest
confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest
confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest
confluent-hub install --no-prompt snowflakeinc/snowflake-kafka-connector:latest
confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs:latest
confluent-hub install --no-prompt wepay/kafka-connect-bigquery:latest
confluent-hub install --no-prompt splunk/kafka-connect-splunk:latest
confluent-hub install --no-prompt jcustenborder/kafka-connect-redis:latest
confluent-hub install --no-prompt microsoftcorporation/kafka-connect-cosmos:latest
confluent-hub install --no-prompt couchbase/kafka-connect-couchbase:latest
confluent-hub install --no-prompt neo4j/kafka-connect-neo4j:latest
confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest

sudo systemctl restart confluent-zookeeper
sudo systemctl restart confluent-kafka
sudo systemctl restart confluent-kafka-connect
sudo systemctl restart confluent-schema-registry
sudo systemctl restart confluent-kafka-rest
sudo systemctl restart confluent-ksqldb
sudo systemctl restart confluent-zookeeper
sudo systemctl restart confluent-kafka
sudo systemctl restart confluent-kafka-connect
sudo systemctl restart confluent-schema-registry
sudo systemctl restart confluent-kafka-rest
sudo systemctl restart confluent-ksqldb

systemctl status confluent*















































#!/bin/bash
sudo apt update
sudo apt install default-jre -y
java --version
sudo apt install default-jdk -y
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker --version
sudo apt update


wget -qO - https://packages.confluent.io/deb/7.5/archive.key | sudo apt-key add -
(cd /etc/apt || exit;)
sudo add-apt-repository "deb [arch=amd64] https://packages.confluent.io/deb/7.5 stable main"
sudo add-apt-repository "deb https://packages.confluent.io/clients/deb $(lsb_release -cs) main"

sudo apt-get update
sudo apt-get install -y confluent-platform
sudo apt-get install -y confluent-security
sudo apt-get update
sudo apt-get install -y confluent-community-2.13

export CONFLUENT_HOME=/usr/local/bin
echo "CONFLUENT_HOME set to: $CONFLUENT_HOME"
export CONFLUENT_HOME=/usr/local/bin
export PATH=$PATH:$CONFLUENT_HOME/bin
echo "PATH updated with CONFLUENT_HOME/bin: $PATH"

confluent --help
confluent --version

(cd /root || exit;)
(cd /etc/kafka || exit;)
cd /etc/kafka

echo "$tickTime=2000" >> "$zookeeper.properties"
echo "$dataDir=/var/lib/zookeeper/" >> "$zookeeper.properties"
echo "$clientPort=2181" >> "$zookeeper.properties"
echo "$initLimit=5" >> "$zookeeper.properties"
echo "$syncLimit=2" >> "$zookeeper.properties"
echo "$server.1=kaifka3:2888:3888" >> "$zookeeper.properties"
echo "$autopurge.snapRetainCount=3" >> "$zookeeper.properties"
echo "$autopurge.purgeInterval=24" >> "$zookeeper.properties"
echo "$broker.id=1" >> "$server.properties"
echo "$zookeeper.connect=kaifka3:2181" >> "$server.properties"
(cd /etc/schema-registry || exit;)
echo "Current working directory: $(pwd)"
echo "$listeners=http://0.0.0.0:8081" >> "$schema-registry.properties"

#note- change vm IP
echo "$host.name=172.208.66.26" >> "$schema-registry.properties" 
echo "$kafkastore.bootstrap.servers=PLAINTEXT://kaifka3:9092,SSL://kaifka3:9092" >> "$schema-registry.properties"

sudo systemctl start confluent-zookeeper
sudo systemctl start confluent-server
sudo systemctl start confluent-kafka  
sudo systemctl start confluent-schema-registry 
sudo systemctl start confluent-kafka-connect 
sudo systemctl start confluent-kafka-rest 
sudo systemctl start confluent-ksqldb 

confluent-hub install --no-prompt confluentinc/kafka-connect-s3:10.0.4
confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.6.1
confluent-hub install --no-prompt debezium/debezium-connector-mysql:latest
confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:latest
confluent-hub install --no-prompt jcustenborder/kafka-connect-spooldir:latest
confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:latest
confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest
confluent-hub install --no-prompt snowflakeinc/snowflake-kafka-connector:latest
confluent-hub install --no-prompt confluentinc/kafka-connect-hdfs:latest
confluent-hub install --no-prompt wepay/kafka-connect-bigquery:latest
confluent-hub install --no-prompt splunk/kafka-connect-splunk:latest
confluent-hub install --no-prompt jcustenborder/kafka-connect-redis:latest
confluent-hub install --no-prompt microsoftcorporation/kafka-connect-cosmos:latest
confluent-hub install --no-prompt couchbase/kafka-connect-couchbase:latest
confluent-hub install --no-prompt neo4j/kafka-connect-neo4j:latest
confluent-hub install --no-prompt confluentinc/kafka-connect-http:latest

sudo systemctl restart confluent-zookeeper
sudo systemctl restart confluent-kafka
sudo systemctl restart confluent-kafka-connect
sudo systemctl restart confluent-schema-registry
sudo systemctl restart confluent-kafka-rest
sudo systemctl restart confluent-ksqldb
sudo systemctl restart confluent-zookeeper
sudo systemctl restart confluent-kafka
sudo systemctl restart confluent-kafka-connect
sudo systemctl restart confluent-schema-registry
sudo systemctl restart confluent-kafka-rest
sudo systemctl restart confluent-ksqldb

systemctl status confluent*













































































