### Steps
#### Step 1: rke-cli
官方地址: [https://github.com/rancher/rke/releases](https://github.com/rancher/rke/releases)，当前最新稳定版本v1.0.4，支持最新的kubernetes版本：v1.17.2-rancher1-2
#### Step 2: upload images to private registry
```
rke config --system-images > image.list
根据image.list 下载image，重新打tag并上传至私有仓库
```
#### Step 3: rke up
#### Step 4: kubernetes-dashboard
#### Step 5: kubernetes-master-highavailable