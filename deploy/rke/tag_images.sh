#!/usr/bin/env bash
docker tag rancher/coreos-etcd:v3.4.3-rancher1                           registry.cn-shenzhen.aliyuncs.com/rancher-kube/coreos-etcd:v3.4.3-rancher1                          
docker tag rancher/rke-tools:v0.1.52                                     registry.cn-shenzhen.aliyuncs.com/rancher-kube/rke-tools:v0.1.52
docker tag rancher/k8s-dns-kube-dns:1.15.0                               registry.cn-shenzhen.aliyuncs.com/rancher-kube/k8s-dns-kube-dns:1.15.0
docker tag rancher/k8s-dns-dnsmasq-nanny:1.15.0                          registry.cn-shenzhen.aliyuncs.com/rancher-kube/k8s-dns-dnsmasq-nanny:1.15.0
docker tag rancher/k8s-dns-sidecar:1.15.0                                registry.cn-shenzhen.aliyuncs.com/rancher-kube/k8s-dns-sidecar:1.15.0
docker tag rancher/cluster-proportional-autoscaler:1.7.1                 registry.cn-shenzhen.aliyuncs.com/rancher-kube/cluster-proportional-autoscaler:1.7.1
docker tag rancher/coredns-coredns:1.6.5                                 registry.cn-shenzhen.aliyuncs.com/rancher-kube/coredns-coredns:1.6.5
docker tag rancher/hyperkube:v1.17.2-rancher1                            registry.cn-shenzhen.aliyuncs.com/rancher-kube/hyperkube:v1.17.2-rancher1
docker tag rancher/coreos-flannel:v0.11.0-rancher1                       registry.cn-shenzhen.aliyuncs.com/rancher-kube/coreos-flannel:v0.11.0-rancher1
docker tag rancher/flannel-cni:v0.3.0-rancher5                           registry.cn-shenzhen.aliyuncs.com/rancher-kube/flannel-cni:v0.3.0-rancher5
docker tag rancher/calico-node:v3.10.2                                   registry.cn-shenzhen.aliyuncs.com/rancher-kube/calico-node:v3.10.2
docker tag rancher/calico-cni:v3.10.2                                    registry.cn-shenzhen.aliyuncs.com/rancher-kube/calico-cni:v3.10.2
docker tag rancher/calico-kube-controllers:v3.10.2                       registry.cn-shenzhen.aliyuncs.com/rancher-kube/calico-kube-controllers:v3.10.2
docker tag rancher/calico-ctl:v2.0.0                                     registry.cn-shenzhen.aliyuncs.com/rancher-kube/calico-ctl:v2.0.0
docker tag rancher/calico-pod2daemon-flexvol:v3.10.2                     registry.cn-shenzhen.aliyuncs.com/rancher-kube/calico-pod2daemon-flexvol:v3.10.2
docker tag rancher/coreos-flannel:v0.11.0                                registry.cn-shenzhen.aliyuncs.com/rancher-kube/coreos-flannel:v0.11.0
docker tag weaveworks/weave-kube:2.5.2                                   registry.cn-shenzhen.aliyuncs.com/rancher-kube/weave-kube:2.5.2
docker tag weaveworks/weave-npc:2.5.2                                    registry.cn-shenzhen.aliyuncs.com/rancher-kube/weave-npc:2.5.2
docker tag rancher/pause:3.1                                             registry.cn-shenzhen.aliyuncs.com/rancher-kube/pause:3.1
docker tag rancher/nginx-ingress-controller:nginx-0.25.1-rancher1        registry.cn-shenzhen.aliyuncs.com/rancher-kube/nginx-ingress-controller:nginx-0.25.1-rancher1
docker tag rancher/nginx-ingress-controller-defaultbackend:1.5-rancher1  registry.cn-shenzhen.aliyuncs.com/rancher-kube/nginx-ingress-controller-defaultbackend:1.5-rancher1
docker tag rancher/metrics-server:v0.3.6                                 registry.cn-shenzhen.aliyuncs.com/rancher-kube/metrics-server:v0.3.6
