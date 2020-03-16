# 部署Nginx-Ingress-Controller
```
# 部署
kubectl apply -f mandatory.yaml
# 验证
kubectl get svc -n ingress-nginx
```
# 部署测试服务以及Ingress
```
kubectl apply -f example.yaml
```
# 访问测试
```
# 获取节点外网IP
export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
# 配置/etc/host
NODE_IP hello-world.info
# 获取ingress-nginx服务nodePort
export NODE_PORT=$(kubectl get --namespace ingress-nginx -o jsonpath="{.spec.ports[0].nodePort}" services ingress-nginx)
# 访问服务web
curl hello-world.info:$NODE_PORT
Version: 1.0.0
Hostname: web-564fd6bc4b-tqzfs
# 访问服务web2
curl hello-world.info:$NODE_PORT/v2
Version: 2.0.0
Hostname: web2-c7d5f4dcf-n4k4b
```
# 参考文档
[Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/)
[Ingress](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

# 扩展
[MetalLB](https://kubernetes.github.io/ingress-nginx/deploy/baremetal/#a-pure-software-solution-metallb)
