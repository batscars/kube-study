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