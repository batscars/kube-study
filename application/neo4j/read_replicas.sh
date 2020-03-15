#!/usr/bin/env bash
# Example nodes: 10.110.10.14, 10.110.10.15, 10.110.10.16
docker run --name=read_replica --detach \
    --publish=8474:7474 --publish=8473:7473 --publish=8687:7687 \
    --env=NEO4J_dbms_mode=READ_REPLICA \
    --env=NEO4J_causal__clustering_initial__discovery__members=10.110.10.11:5000,10.110.10.12:5000,10.110.10.13:5000 \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    --restart=always \
    registry.cn-shenzhen.aliyuncs.com/rancher-kube/neo4j:3.4.15-enterprise