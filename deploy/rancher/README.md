# Steps
## Step 1: rke-cli
官方地址: [releases](https://github.com/rancher/rke/releases)，当前最新稳定版本v1.0.4，支持最新的kubernetes版本：v1.17.2-rancher1-2
## Step 2: upload images to private registry
```
rke config --system-images > image.list
根据image.list 下载image，重新打tag并上传至私有仓库
```
## Step 3: rke up
## Step 4: kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
```
## Step 5: kubernetes-dashboard
[下载地址](https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc5/aio/deploy/recommended.yaml)
```
kubectl apply -f dashboard.yaml
```
## Step 6: 部署rancher
```
docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
```
## Step 7: master节点高可用配置
[参考文档](https://zhuanlan.zhihu.com/p/68546385)
### 单独找一台服务器(10.202.22.45)作为负载均衡器，部署nginx
```
...
stream {
    upstream apiserver {
        server 10.202.22.46:6443 weight=5 max_fails=3 fail_timeout=60s;
        server 10.202.22.47:6443 weight=5 max_fails=3 fail_timeout=60s;
        server 10.202.22.48:6443 weight=5 max_fails=3 fail_timeout=60s;
    }

    server {
        listen 6443;
        proxy_connect_timeout 1s;
        proxy_timeout 10s;
        proxy_pass apiserver;
    }
}
...
```
### 修改配置文件, 执行```rke cert-rotate```
```
authentication:
  strategy: x509
  sans:
    - "10.202.22.45"
```