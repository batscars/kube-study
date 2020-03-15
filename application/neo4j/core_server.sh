#!/usr/bin/env bash
# Example nodes: 10.110.10.11, 10.110.10.12, 10.110.10.13
export HOME=/disk01/neo4j_cluster
export core_addr=10.110.10.11
docker run --name=neo4j-core --detach \
    --network=host \
    --publish=7474:7474 --publish=7687:7687 \
    --publish=5000:5000 --publish=6000:6000 --publish=7000:7000 \
    --env=NEO4J_dbms_mode=CORE \
    --env=NEO4J_causal__clustering_expected__core__cluster__size=3 \
    --env=NEO4J_causal__clustering_initial__discovery__members=10.110.10.11:5000,10.110.10.12:5000,10.110.10.13:5000 \
    --env=NEO4J_causal__clustering_discovery__advertised__address=$core_addr:5000 \
    --env=NEO4J_causal__clustering_transaction__advertised__address=$core_addr:6000 \
    --env=NEO4J_causal__clustering_raft__advertised__address=$core_addr:7000 \
    --env=NEO4J_dbms_connectors_default__advertised__address=$core_addr \
    --env=NEO4J_ACCEPT_LICENSE_AGREEMENT=yes \
    --volume=$HOME/data:/data \
    --volume=$HOME/logs:/logs \
    --volume=$HOME/import:/import \
    --volume=$HOME/plugins:/plugins \
    --env=NEO4J_dbms_memory_pagecache_size=4G \
    --restart=always \
    --env=NEO4J_dbms_connector_bolt_enabled=true \
    --env=NEO4J_dbms_connector_bolt_listen__address=:7687 \
    --env=NEO4J_metrics_prometheus_enabled=true \
    --env=NEO4J_metrics_prometheus_endpoint=0.0.0.0:2004 \
    registry.cn-shenzhen.aliyuncs.com/rancher-kube/neo4j:3.4.15-enterprise