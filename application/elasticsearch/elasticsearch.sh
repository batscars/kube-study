#!/usr/bin/env bash
# esnode1: 10.160.76.10
docker run -d --name esnode01 \
	-v /disk01/es/data:/usr/share/elasticsearch/data \
	--ulimit memlock=-1:-1 \
	--ulimit nofile=65535:65535 \
	--ulimit nproc=4096:4096 \
	-p 9200:9200 \
	-p 9300:9300 \
	-e node.name=esnode01 \
	-e node.data=true \
	-e node.master=true \
    -e transport.port=9300 \
	-e network.publish_host=10.160.76.10:9300 \
	-e discovery.seed_hosts=10.160.76.10:9300,10.160.76.11:9300,10.160.76.12:9300 \
	-e cluster.initial_master_nodes=esnode01,esnode02,esnode03 \
	-e cluster.name=es-docker-cluster \
	-e bootstrap.memory_lock=true \
	-e "ES_JAVA_OPTS=-Xms31g -Xmx31g" \
	-e http.cors.enabled=true \
    -e http.cors.allow-origin=* \
	--restart=always \
    dockerhub.nie.netease.com/zhangbin05/elasticsearch:7.5.1
# esnode2: 10.160.76.11
docker run -d --name esnode02 \
	-v /disk01/es/data:/usr/share/elasticsearch/data \
	--ulimit memlock=-1:-1 \
	--ulimit nofile=65535:65535 \
	--ulimit nproc=4096:4096 \
	-p 9200:9200 \
	-p 9300:9300 \
	-e node.name=esnode02 \
	-e node.data=true \
	-e node.master=true \
    -e transport.port=9300 \
	-e network.publish_host=10.160.76.11:9300 \
	-e discovery.seed_hosts=10.160.76.10:9300,10.160.76.11:9300,10.160.76.12:9300 \
	-e cluster.initial_master_nodes=esnode01,esnode02,esnode03 \
	-e cluster.name=es-docker-cluster \
	-e bootstrap.memory_lock=true \
	-e "ES_JAVA_OPTS=-Xms31g -Xmx31g" \
	-e http.cors.enabled=true \
    -e http.cors.allow-origin=* \
	--restart=always \
    dockerhub.nie.netease.com/zhangbin05/elasticsearch:7.5.1
# esnode3: 10.160.76.12
docker run -d --name esnode03 \
	-v /disk01/es/data:/usr/share/elasticsearch/data \
	--ulimit memlock=-1:-1 \
	--ulimit nofile=65535:65535 \
	--ulimit nproc=4096:4096 \
	-p 9200:9200 \
	-p 9300:9300 \
	-e node.name=esnode03 \
	-e node.data=true \
	-e node.master=true \
    -e transport.port=9300 \
	-e network.publish_host=10.160.76.12:9300 \
	-e discovery.seed_hosts=10.160.76.10:9300,10.160.76.11:9300,10.160.76.12:9300 \
	-e cluster.initial_master_nodes=esnode01,esnode02,esnode03 \
	-e cluster.name=es-docker-cluster \
	-e bootstrap.memory_lock=true \
	-e "ES_JAVA_OPTS=-Xms31g -Xmx31g" \
	-e http.cors.enabled=true \
    -e http.cors.allow-origin=* \
	--restart=always \
    dockerhub.nie.netease.com/zhangbin05/elasticsearch:7.5.1