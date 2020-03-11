### Steps
#### Step 1: rke-cli
官方地址: [releases](https://github.com/rancher/rke/releases)，当前最新稳定版本v1.0.4，支持最新的kubernetes版本：v1.17.2-rancher1-2
#### Step 2: upload images to private registry
```
rke config --system-images > image.list
根据image.list 下载image，重新打tag并上传至私有仓库
```
#### Step 3: rke up
#### Step 4: kubectl
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
```
#### Step 5: kubernetes-dashboard
[下载地址](https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc5/aio/deploy/recommended.yaml)
```
kubectl apply -f dashboard.yaml
```
#### Step 6: kubernetes-master-highavailable