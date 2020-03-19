# Kubernetes Concepts
## PodSecurityPolicy
- [https://www.cnblogs.com/tylerzhou/p/11078128.html](https://www.cnblogs.com/tylerzhou/p/11078128.html)
- [https://kubernetes.io/docs/concepts/policy/pod-security-policy/](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
## StatefulSet
### Headless service
**ClusterIP: None**, 以service dns的形式直接解析到被代理的POD的ip地址，并不会像普通的service一样分配一个VIP
```
<pod-name>.<svc-name>.<namespace>.svc.cluster.local
```
### POD名称编号: 保证网络标识的稳定性
配置文件中多了serviceName: "serviceName"，StatefulSet对Pod名后才能进行编号
### PV & PVC ([PV与PVC的绑定官方文档](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#lifecycle-of-a-volume-and-claim))
PV动态适配PVC通过StorageClass实现, Cephfs和Glusterfs如何封装成StorageClass以支持动态分配[dfs_volume_provisioner](https://github.com/batscars/dfs_volume_provisioner)
```
volumeClaimTemplates: 
- metadata: 
    name: www 
  spec: 
    accessModes: 
      - ReadWriteOnce 
    resources: 
      requests: 
        storage: 1Gi
```
StatefulSet中定义的PVC模板，每个pod都会创建一个跟pod编号一致的pvc，pod删除时对应的pvc和pv不会被删除，数据也不会被删除
### 总结
StatefulSet直接管理Pod，通过headless service保证pod网络标识的一致性，通过pvc模板保证存储状态的一致性
## PV/PVC
### PV 访问模式
- ReadWriteOnce（RWO）：可读可写，但只支持被单个 Pod 挂载。
- ReadOnlyMany（ROX）：可以以只读的方式被多个 Pod 挂载。
- ReadWriteMany（RWX）：可以以读写的方式被多个 Pod 共享。
### PVC释放策略
- Retain：不清理, 保留 Volume（需要手动清理）
- Recycle：删除数据，即 rm -rf /thevolume/*（只有 NFS 和 HostPath 支持）
- Delete：删除存储资源，比如删除 AWS EBS 卷（只有 AWS EBS, GCE PD, Azure Disk 和 Cinder 支持）
### [Local Persistent Volume](https://time.geekbang.org/column/article/42819)
```
# Storage-class 重要参数provisioner和volumeBindingMode
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: local-storage
provisioner: kubernetes.io/no-provisioner # 目前不支持动态分配
volumeBindingMode: WaitForFirstConsumer  # 延迟绑定

# PV 重要参数: nodeAffinity表面该本地pv在某个节点
apiVersion: v1
kind: PersistentVolume
metadata:
  name: example-pv
spec:
  capacity:
    storage: 5Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  storageClassName: local-storage
  local:
    path: /mnt/disks/vol1
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: kubernetes.io/hostname
          operator: In
          values:
          - node-1
# PVC
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: example-local-claim
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
  storageClassName: local-storage
```
### Local Persistent Volume Management
[https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner)

### 持久化Volume：两阶段
#### Attach
相当于将一块硬盘插到对应的主机上。如果是一块远程硬盘，kubelet将调用远程硬盘的api将他提供的硬盘挂在到pod所在的宿主机。如果是远程文件存储则不需要该阶段。该阶段参数为nodeName。控制器AttachDetachController在k8s master上
#### Mount
相当于把硬盘挂载到主机的指定目录。挂载的位置是
/var/lib/kubelet/pods/<Pod的ID>/volumes/kubernetes.io~<Volume类型>/<Volume名字>。控制器VolumeManagerReconciler，是kubelet组件的一部分，独立于kubelet主循环
#### Flex-Volume
![](https://github.com/batscars/kube-study/blob/master/concepts/flex_volume.jpg?row=true)
#### CSI
![](https://github.com/batscars/kube-study/blob/master/concepts/csi.jpg?row=true)
其中:
- Driver Registrar 组件，负责将插件注册到 kubelet 里面
- External Provisioner 组件，负责的正是 Provision 阶段
- External Attacher 组件，负责的正是“Attach 阶段”

