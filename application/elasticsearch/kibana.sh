#!/usr/bin/env bash
docker run -d --name kibana \
	-p 5601:5601 \
	-v /disk01/kibana/kibana.yml:/usr/share/kibana/config/kibana.yml \
	--restart=always \
    dockerhub.nie.netease.com/zhangbin05/kibana:7.5.1